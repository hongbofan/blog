package red.bofan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import red.bofan.dao.UserMapper;
import red.bofan.model.User;

/**
 * Created by hongbofan on 2016/10/20.
 */
@Service("userService")
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User selectByName(String name){
        return userMapper.selectByName(name);
    }
}
