package red.bofan.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.text.ParseException;
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
    private SimpMessagingTemplate template;
    private SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private Long finalTime = formatter.parse("2017-01-28 00:00:00").getTime();
    private JSONObject time = new JSONObject();
    private Long currentTime,current,days,hours,minutes,seconds;

    public CipherController() throws ParseException {
    }

    @Scheduled(cron="0/1 * *  * * ? ")
    @MessageMapping("/hello")
    @SendTo("/subscribe/time") // 订阅
    public void greeting() throws Exception {
        setTime();
        template.convertAndSend("/subscribe/time",time);
    }
    private void setTime(){
        time.clear();
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
    }
    @RequestMapping(value = "/index.htm", method = RequestMethod.GET)
    public String index() {
        return "cipher";
    }
}
