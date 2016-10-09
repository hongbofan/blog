package red.bofan.util;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.mindrot.jbcrypt.BCrypt;

/**
 * Created by 洪博凡 on 2016/3/5 0005.
 */
class CustomCredentialsMatcher extends SimpleCredentialsMatcher {

    @Override
    public boolean doCredentialsMatch(AuthenticationToken authcToken, AuthenticationInfo info) {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        //System.out.println(new String((char[])token.getCredentials())+","+getCredentials(info).toString());
        //将密码加密与系统加密后的密码校验，内容一致就返回true,不一致就返回false
        return BCrypt.checkpw(new String((char[])token.getCredentials()),getCredentials(info).toString());
    }

}
