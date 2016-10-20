package red.bofan.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import red.bofan.model.User;
import red.bofan.service.UserService;

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
    @Autowired
    private UserService userService;
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        UsernamePasswordToken token = (UsernamePasswordToken)authenticationToken;
        User user = userService.selectByName(token.getUsername());
        if (null != user){
            AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getName(),user.getPassword(),this.getName());

            return authenticationInfo;
        }
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

}
