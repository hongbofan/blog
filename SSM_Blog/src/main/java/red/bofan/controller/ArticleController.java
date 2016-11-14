package red.bofan.controller;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import red.bofan.model.Article;
import red.bofan.model.User;
import red.bofan.service.ArticleService;
import red.bofan.util.HttpCode;
import red.bofan.util.JsonVo;
import red.bofan.util.PaginationVo;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by hongbofan on 2016/10/12.
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController{


    /**
     * 文章提交
     * @param markdown
     * @param html
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/upload.do", method = RequestMethod.POST)
    public JsonVo upload(@RequestParam(value = "test-editormd-markdown-doc", required = false) String markdown,
                         @RequestParam(value = "test-editormd-html-code", required = false) String html,
                         @RequestParam(value = "title",required = false)String title) {
        String id = UUID.randomUUID().toString();
        Article article = new Article();
        article.setId(id);
        article.setContent(markdown);
        article.setTitle(title);
        article.setLastDate(new Date());
        String principal = SecurityUtils.getSubject().getPrincipal().toString();
        //姓名获取用户id验证
        try{
            User currentUser = userService.selectByName(principal);
            article.setUserId(currentUser.getId());
        }catch (Exception e){
            System.out.println(e.getMessage());
            return getJsonVo("invalid user",HttpCode.USER_GET_ERROR);
        }
        //插入文章验证
        try{
            System.out.println(articleService.insertSelective(article));
            return getJsonVo("success",HttpCode.OK);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return getJsonVo("failed to insert article",HttpCode.ARTICLE_INSERT_ERROR);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/{id}.json", method = RequestMethod.GET)
    public JsonVo getSingle(@PathVariable("id") String id) {
        try{
            Article article = articleService.selectByPrimaryKey(id);
            return getJsonVo("success",HttpCode.OK,article);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return getJsonVo("failed to select article",HttpCode.ARTICLE_SELECT_ERROR);
        }
    }
    @ResponseBody
    @RequestMapping(value = "/list.json", method = RequestMethod.GET)
    public JsonVo list(@RequestParam(value = "p", defaultValue = "1") Integer p,
                    @RequestParam(value = "title", defaultValue = "") String title) {
        try {
            PaginationVo<Article> paginationVo = articleService.selectByPageWithSearch(p, 8, title);
            Map<String, Object> result = new HashMap<>();
            result.put("articles", paginationVo.getList());
            result.put("pageInfo", paginationVo);
            return getJsonVo("success",HttpCode.OK,result);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return getJsonVo("failed to list article",HttpCode.ARTICLE_LIST_ERROR);
        }
    }


    @RequestMapping(value = "/{id}.htm", method = RequestMethod.GET)
    public String getSingle(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("id", id);
        return "article_content";
    }
    @RequestMapping(value = "/list.htm", method = RequestMethod.GET)
    public String list() {
        return "article_list";
    }
    @RequestMapping(value = "/editor.htm", method = RequestMethod.GET)
    public String editor() {
        return "article_editor";
    }


}
