package red.bofan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.messaging.simp.SimpMessagingTemplate;

import javax.annotation.Resource;

/**
 * Created by hongbofan on 2016/10/26.
 */
@Controller
@RequestMapping("/cipher")
public class CipherController extends BaseController{
    @MessageMapping("/hello")
    @SendTo("/tweet/fuck") // 订阅
    public String greeting(String message) throws Exception {
        System.out.println(message);
        Thread.sleep(3000); // simulated delay
        return  message;
    }
    @RequestMapping(value = "/index.htm", method = RequestMethod.GET)
    public String index() {
        return "cipher";
    }
}
