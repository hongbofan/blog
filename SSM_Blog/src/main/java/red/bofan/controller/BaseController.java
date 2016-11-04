package red.bofan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import red.bofan.service.ArticleService;
import red.bofan.service.UserService;

/**
 * Created by hongbofan on 2016/10/18.
 */
public class BaseController {
    @Autowired
    protected ArticleService articleService;
    @Autowired
    protected UserService userService;
}
