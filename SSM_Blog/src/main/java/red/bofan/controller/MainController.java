package red.bofan.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import red.bofan.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hongbofan on 2016/10/18.
 */
@Controller
@RequestMapping("/")
public class MainController extends BaseController{


    //登录方法
    @RequestMapping(value = "login.do" ,method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> login(@RequestParam("username")String username,
                                    @RequestParam("password")String password,
                                    HttpServletRequest request){
        Map<String,Object> result = new HashMap<>();
        try {
            Subject subject = SecurityUtils.getSubject();
            System.out.println(BCrypt.hashpw(password, BCrypt.gensalt()));
            subject.login(new UsernamePasswordToken(username, password));
            if (subject.isAuthenticated()) {
                this.setSession("currentUser",subject.getPrincipal());
                result.put("result",true);
                result.put("message","欢迎你，"+ subject.getPrincipal());
            } else {
                result.put("result",false);
                result.put("message","密码错误");
            }
        }catch (AuthenticationException ex){
            System.out.println("currentUser:"+request.getSession().getAttribute("currentUser"));
            result.put("result",false);
            result.put("message","密码错误");
            ex.printStackTrace();
        }
        return result;
    }
    @RequestMapping(value = "check.do",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> check(HttpServletRequest request){

        HttpSession session = request.getSession();
        Map<String,Object> result = new HashMap<>();
        String  principal = (String) session.getAttribute("currentUser");
        if (principal != null ){
            result.put("result",true);
            result.put("username",principal);
        }else{
            result.put("result",false);
        }
        return result;
    }

    @RequestMapping(value = "logout.do" , method = RequestMethod.GET)
    @ResponseBody
    public Boolean logout(HttpServletRequest request){
        try{
            Subject subject = SecurityUtils.getSubject();
            subject.logout();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @RequestMapping(value = "home.htm",method = RequestMethod.GET)
    public String home(){
        return "home";
    }
    @RequestMapping(value = "user_login.htm",method = RequestMethod.GET)
    public String user_login(){
        return "user_login";
    }
    /**
     * 将一些数据放到ShiroSession中,以便于其它地方使用
     * 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
     */
    private void setSession(Object key, Object value){
        Subject currentUser = SecurityUtils.getSubject();
        if(null != currentUser){
            Session session = currentUser.getSession();
            System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
            if(null != session){
                session.setAttribute(key, value);
            }
        }
    }
}
