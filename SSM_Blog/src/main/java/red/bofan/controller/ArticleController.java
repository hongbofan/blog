package red.bofan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import red.bofan.model.Article;
import red.bofan.service.ArticleService;

import java.util.UUID;

/**
 * Created by hongbofan on 2016/10/12.
 */
@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @RequestMapping(value="/upload.do",method= RequestMethod.POST)
    public String upload(@RequestParam(value = "test-editormd-markdown-doc", required = false)String markdown,
                          @RequestParam(value = "test-editormd-html-code", required = false)String html,
                         RedirectAttributes attr){
        System.out.println(markdown);
        System.out.println(html);
        attr.addFlashAttribute("html",html);
        attr.addFlashAttribute("markdown",markdown);
        String id = UUID.randomUUID().toString();
        Article article = new Article();
        article.setId(id);
        article.setContent(markdown);
        article.setTitle("test");
        article.setUserId("1");
        System.out.println(articleService.insertSelective(article));
        return "redirect:showContent.do";
    }
    @RequestMapping(value = "/showContent.do",method = RequestMethod.GET)
    public String showContent(ModelMap map,RedirectAttributes attr){
        System.out.println("attr="+ attr.getFlashAttributes().get("html"));
        return "article_content";

    }
}
