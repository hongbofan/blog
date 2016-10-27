package red.bofan.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by hongbofan on 2016/10/26.
 */
@Controller
@RequestMapping("/cipher")
public class CipherController extends BaseController{
    @Resource
    public SimpMessagingTemplate template;
    @MessageMapping("/hello")
    @SendTo("/subscribe/time") // 订阅
    public String greeting() throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        JSONObject time = new JSONObject();
        Long finalTime = formatter.parse("2017-01-28 00:00:00").getTime();
        Long currentTime,current,days,hours,minutes,seconds;
        while(true){
            Thread.sleep(1000); // simulated delay
            currentTime = Calendar.getInstance().getTimeInMillis();
            current = finalTime - currentTime;
            days = current/(1000*3600*24);
            current = current - days * (1000*3600*24);
            hours = current/(1000*3600);
            current = current - hours * (1000*3600);
            minutes = current/(1000*60);
            current = current - minutes * (1000*60);
            seconds = current/(1000);
            time.put("days",days);
            time.put("hours",hours);
            time.put("minutes",minutes);
            time.put("seconds",seconds);
            template.convertAndSend("/subscribe/time",time);
            //return time;
        }
    }
    @RequestMapping(value = "/index.htm", method = RequestMethod.GET)
    public String index() {
        return "cipher";
    }
}
