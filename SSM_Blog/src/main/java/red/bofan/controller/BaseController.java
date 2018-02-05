package red.bofan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import red.bofan.service.ArticleService;
import red.bofan.service.CipherLogService;
import red.bofan.service.CipherService;
import red.bofan.service.UserService;
import red.bofan.util.JsonVo;

/**
 * Created by hongbofan on 2016/10/18.
 */
public class BaseController {
    @Autowired
    protected ArticleService articleService;
    @Autowired
    protected UserService userService;
    @Autowired
    protected CipherService cipherService;
    @Autowired
    protected CipherLogService cipherLogService;
    //统一返回的json信息
    protected JsonVo getJsonVo(String msg,Integer code){
        return new JsonVo().setMsg(msg).setCode(code);
    }
    protected JsonVo getJsonVo(String msg, Integer code, Object data){
        return new JsonVo().setMsg(msg).setCode(code).setData(data);
    }
}
