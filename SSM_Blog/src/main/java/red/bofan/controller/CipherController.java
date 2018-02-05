package red.bofan.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import red.bofan.model.Cipher;
import red.bofan.model.CipherLog;
import red.bofan.model.CipherVo;
import red.bofan.util.HttpCode;
import red.bofan.util.IP;
import red.bofan.util.JedisCache;
import red.bofan.util.JsonVo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.*;

/**
 * Created by hongbofan on 2016/10/26.
 */
@Controller
@RequestMapping("/cipher")
public class CipherController extends BaseController {

    @Resource
    private SimpMessagingTemplate template;//简单信息广播
    @Autowired
    private CacheManager cacheManager;
    private static List<CipherVo> cipherVos;//展示前端的bean封装
    private static List<Cipher> ciphers;//redis缓存
    private static Map<String,Boolean> publishMap;


    //获取提示接口
    @RequestMapping(value = "/{id}/hint.json",method = RequestMethod.GET)
    @ResponseBody
    public JsonVo getHint(@PathVariable("id")String id,@RequestParam("hint") String hint){
        if (!publishMap.get(id+"hint"+hint)){
            return getJsonVo("This hint is unreachable",HttpCode.CIPHER_SELECT_ERROR);
        }
        try{
            Cipher cipher = cipherService.selectByPrimaryKey(id);
            if ("1".equals(hint)){
                hint = cipher.getFhint();
            }else if ("2".equals(hint)){
                hint = cipher.getShint();
            }else if ("3".equals(hint)){
                hint = cipher.getThint();
            }else {
                hint = "=.=";
            }
            return getJsonVo("success",HttpCode.OK,hint);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return getJsonVo("Failed to select cipher",HttpCode.CIPHER_SELECT_ERROR);
        }
    }
    //获取cipher题目、内容
    @RequestMapping(value = "/{id}.json",method = RequestMethod.GET)
    @ResponseBody
    public JsonVo getSingle (@PathVariable("id") String id) {
        if(!publishMap.get(id)){
            return getJsonVo("This cipher is unreachable",HttpCode.CIPHER_SELECT_ERROR);
        }
        try{
            Cipher cipher = cipherService.selectByPrimaryKey(id);
            CipherVo cipherVo = new CipherVo();
            cipherVo.setContent(cipher.getContent())
                    .setTitle(cipher.getTitle());
            return getJsonVo("success",HttpCode.OK,cipherVo);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return getJsonVo("Failed to select cipher",HttpCode.CIPHER_SELECT_ERROR);
        }
    }
    @RequestMapping(value = "/{id}/answer.json", method = RequestMethod.POST)
    @ResponseBody
    public JsonVo answer(@PathVariable(value = "id") String id, @RequestParam(value = "answer") String answer, HttpServletRequest request) {
        if(!publishMap.get(id)){
            return getJsonVo("This cipher is unreachable",HttpCode.CIPHER_SELECT_ERROR);
        }
        String ip = IP.getIpAddr(request);
        try {
            JedisCache jedisCache = (JedisCache) cacheManager.getCache("cache4jds");
            Cache.ValueWrapper value = jedisCache.get("IP:"+ ip);
            if(value == null){
                jedisCache.put("IP:"+ ip,10);
            }else{
                int count = (Integer)value.get();
                if(--count < 0){
                    return getJsonVo("Wait 3 minutes!", HttpCode.CIPHER_ANSWER_LIMITED);
                }
                jedisCache.put("IP:"+ ip,count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        CipherLog log = new CipherLog();
        log.setCipherId(id);
        log.setLogId(UUID.randomUUID().toString());
        log.setSubmitAnswer(answer);
        log.setSubmitIp(ip);
        log.setCreateTime(new Date());
        log.setUpdateTime(new Date());
        log.setCreateUser("1");
        log.setUpdateUser("1");
        cipherLogService.insert(log);
        try{
            Cipher cipher = cipherService.selectByPrimaryKey(id);
            if (answer.trim().toLowerCase().equals(cipher.getAnswer())) {
                if("purposeful".equals(cipher.getAnswer())){
                    return getJsonVo("Accept,63946804", HttpCode.CIPHER_ANSWER_SUCCESS);
                }else if("beautiful".equals(cipher.getAnswer())){
                    return getJsonVo("Accept,31695804", HttpCode.CIPHER_ANSWER_SUCCESS);
                }else if ("dashing".equals(cipher.getAnswer())){
                    return getJsonVo("Accept,08085904", HttpCode.CIPHER_ANSWER_SUCCESS);
                } else {
                    return getJsonVo("Accept,",HttpCode.CIPHER_ANSWER_SUCCESS);
                }

            } else {
                return getJsonVo("Wrong", HttpCode.CIPHER_ANSWER_ERROR);
            }
        }catch (Exception e){
            return getJsonVo("Failed to select cipher",HttpCode.CIPHER_SELECT_ERROR);
        }
    }

    @Scheduled(cron = "0/1 * *  * * ? ")//每秒执行一次
    @MessageMapping("/hello")
    @SendTo("/subscribe/cipher") // 订阅
    public void greeting() throws Exception {
        //第一次从redis或数据库拿
        if (ciphers == null){
            ciphers = cipherService.getAll();
        }
        //第一次先封装成cipherVo类
        if (cipherVos == null){
            cipherVos = new ArrayList<>();
            for (Cipher cipher : ciphers){
                CipherVo cipherVo = new CipherVo();
                cipherVo.setId(cipher.getId())
                        .setPublishTime(cipher.getPublishTime());

                //加入展示列表
                cipherVos.add(cipherVo);
            }
        }
        //同时更新
        cipherVos.parallelStream().forEach(cipherVo -> {
            //设置剩余时间
            setMsec(cipherVo);
            //设置发布白名单
            setPublishMap(cipherVo);
        });
        template.convertAndSend("/subscribe/cipher", getJsonVo("subscribe success", HttpCode.OK, cipherVos));
    }

    private void setMsec(CipherVo cipherVo){
        Long hintDelay = 1000*60*60L;
        cipherVo.setRemainingMsec(date2Msec(cipherVo.getPublishTime()) - date2Msec(new Date()))
                .setFhintRemainingMsec(date2Msec(cipherVo.getPublishTime()) + hintDelay*1 - date2Msec(new Date()))
                .setShintRemainingMsec(date2Msec(cipherVo.getPublishTime()) + hintDelay*2 - date2Msec(new Date()))
                .setThintRemainingMsec(date2Msec(cipherVo.getPublishTime()) + hintDelay*3 - date2Msec(new Date()));
    }
    //通过map来判断是否发布
    private void  setPublishMap(CipherVo cipherVo){
        if (publishMap == null){
            publishMap = new HashMap<>();
        }
        if (cipherVo.getRemainingMsec() < 0){
            publishMap.put(cipherVo.getId(),true);
            cipherVo.setTrigger(true);
        } else {
            publishMap.put(cipherVo.getId(),false);
        }
        if (cipherVo.getFhintRemainingMsec() < 0){
            publishMap.put(cipherVo.getId()+"hint1",true);
            cipherVo.setHint1trigger(true);
        }else {
            publishMap.put(cipherVo.getId()+"hint1",false);
        }
        if (cipherVo.getShintRemainingMsec() < 0){
            publishMap.put(cipherVo.getId()+"hint2",true);
            cipherVo.setHint2trigger(true);
        }else {
            publishMap.put(cipherVo.getId()+"hint2",false);
        }
        if (cipherVo.getThintRemainingMsec() < 0){
            publishMap.put(cipherVo.getId()+"hint3",true);
            cipherVo.setHint3trigger(true);
        }else {
            publishMap.put(cipherVo.getId()+"hint3",false);
        }
    }
    private Long date2Msec(Date finalDate) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//非线程安全，全局并行会有问题
        try {
            return formatter.parse(formatter.format(finalDate)).getTime();
        } catch (ParseException e) {
            e.printStackTrace();
            return 0L;
        }
    }

    @RequestMapping(value = "/index.htm", method = RequestMethod.GET)
    public String index() {
        return "cipher";
    }
}
