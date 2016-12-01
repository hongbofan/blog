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
import red.bofan.util.HttpCode;
import red.bofan.util.JsonVo;

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
    public JsonVo login(@RequestParam("username")String username,
                        @RequestParam("password")String password,
                        HttpServletRequest request){
        try {
            Subject subject = SecurityUtils.getSubject();
            System.out.println(BCrypt.hashpw(password, BCrypt.gensalt()));
            subject.login(new UsernamePasswordToken(username, password));
            if (subject.isAuthenticated()) {
                this.setSession("currentUser",subject.getPrincipal());
                return getJsonVo("Success", HttpCode.OK);
            } else {
                return getJsonVo("Failed to login", HttpCode.USER_LOGIN_ERROR);
            }
        }catch (AuthenticationException ex){
            System.out.println("currentUser:"+request.getSession().getAttribute("currentUser"));
            return getJsonVo("Failed to login", HttpCode.USER_LOGIN_ERROR);
        }

    }
    @RequestMapping(value = "check.do",method = RequestMethod.GET)
    @ResponseBody
    public JsonVo check(HttpServletRequest request){

        HttpSession session = request.getSession();
        String  principal = (String) session.getAttribute("currentUser");
        if (principal != null ){
            User user = new User();
            user.setName(principal);
            return getJsonVo("Success",HttpCode.OK,user);
        }else{
            return getJsonVo("Failed to check user",HttpCode.USER_LOGIN_ERROR);
        }

    }

    @RequestMapping(value = "logout.do" , method = RequestMethod.GET)
    @ResponseBody
    public JsonVo logout(HttpServletRequest request){
        try{
            Subject subject = SecurityUtils.getSubject();
            subject.logout();
            return getJsonVo("Success",HttpCode.OK);
        }catch (Exception e){
            return getJsonVo("Failed to logout",HttpCode.USER_LOGOUT_ERROR);
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
