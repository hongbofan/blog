package red.bofan.controller;

import com.alibaba.fastjson.JSONObject;
import com.sun.istack.internal.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import red.bofan.model.Cipher;
import red.bofan.model.CipherVo;
import red.bofan.service.CipherService;
import red.bofan.util.HttpCode;
import red.bofan.util.JsonVo;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by hongbofan on 2016/10/26.
 */
@Controller
@RequestMapping("/cipher")
public class CipherController extends BaseController {

    @Resource
    private SimpMessagingTemplate template;//简单信息广播

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
    public JsonVo answer(@PathVariable(value = "id") String id, @RequestParam(value = "answer") String answer) {
        if(!publishMap.get(id)){
            return getJsonVo("This cipher is unreachable",HttpCode.CIPHER_SELECT_ERROR);
        }
        try{
            Cipher cipher = cipherService.selectByPrimaryKey(id);
            if (answer.equals(cipher.getAnswer())) {
                return getJsonVo("Accept", HttpCode.CIPHER_ANSWER_SUCCESS);
            } else {
                return getJsonVo("Wrong", HttpCode.CIPHER_ANSWER_ERROR);
            }
        }catch (Exception e){
            return getJsonVo("Failed to select cipher",HttpCode.CIPHER_SELECT_ERROR);
        }
    }

    @Scheduled(cron = "0/1 * *  * * ? ")//每秒执行一次
    @MessageMapping("/hello")
    @SendTo("/subscribe/time") // 订阅
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
        template.convertAndSend("/subscribe/time", getJsonVo("subscribe success", HttpCode.OK, cipherVos));
    }

    private void setMsec(CipherVo cipherVo){
        Long hintDelay = 1000*60*60L;
        cipherVo.setRemainingMsec(date2Msec(cipherVo.getPublishTime()) - date2Msec(new Date()))
                .setFhintRemainingMsec(date2Msec(cipherVo.getPublishTime()) + hintDelay*6 - date2Msec(new Date()))
                .setShintRemainingMsec(date2Msec(cipherVo.getPublishTime()) + hintDelay*12 - date2Msec(new Date()))
                .setThintRemainingMsec(date2Msec(cipherVo.getPublishTime()) + hintDelay*18 - date2Msec(new Date()));
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
