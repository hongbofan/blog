package red.bofan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by hongbofan on 2016/10/18.
 */
@Controller
@RequestMapping("/")
public class MainController extends BaseController{
    @RequestMapping(value = "home.htm",method = RequestMethod.GET)
    public String index(){
        return "home";
    }
}
