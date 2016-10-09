package red.bofan.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by 洪博凡 on 2016/3/1 0001.
 */
public class myShiro extends AuthorizingRealm {

    
    /**
     * 设定Password校验.
     */
    @PostConstruct
    public void initCredentialsMatcher() {
        //该句作用是重写shiro的密码验证，让shiro用我自己的验证
        setCredentialsMatcher(new CustomCredentialsMatcher());

    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
//        String username = (String) principalCollection.getPrimaryPrincipal();
//        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
//        if (null!=username &&username.equals("hongbofan")){
//            Set set = new HashSet<>();
//            set.add("root");
//            info.setRoles(set);
//            return info;
//        }

        return null;
    }
//    @Resource
//    private AdminService adminService;
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        UsernamePasswordToken token = (UsernamePasswordToken)authenticationToken;
//
//      Admin admin = adminService.login(token.getUsername());
//      if(null != admin){
//          AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(admin.getUsername(), admin.getPassword(),this.getName());
//          this.setSession("currentUser", admin);
//          return authcInfo;
//      }else{
//          return null;
//      }
        return null;
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
