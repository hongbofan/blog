package red.bofan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import red.bofan.model.Article;
import red.bofan.service.ArticleService;
import red.bofan.util.PaginationVo;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by hongbofan on 2016/10/12.
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController{
    @Autowired
    private ArticleService articleService;

    /**
     * 文章提交
     * @param markdown
     * @param html
     * @param attr
     * @return
     */
    @RequestMapping(value = "/upload.do", method = RequestMethod.POST)
    public String upload(@RequestParam(value = "test-editormd-markdown-doc", required = false) String markdown,
                         @RequestParam(value = "test-editormd-html-code", required = false) String html,
                         RedirectAttributes attr) {
        System.out.println(markdown);
        System.out.println(html);
        attr.addFlashAttribute("html", html);
        attr.addFlashAttribute("markdown", markdown);
        String id = UUID.randomUUID().toString();
        Article article = new Article();
        article.setId(id);
        article.setContent(markdown);
        article.setTitle("test");
        article.setUserId("1");
        System.out.println(articleService.insertSelective(article));
        return "redirect:showContent.do";

    }
    @RequestMapping(value = "/showContent.do", method = RequestMethod.GET)
    public String showContent(ModelMap map, RedirectAttributes attr) {
        System.out.println("attr=" + attr.getFlashAttributes().get("html"));

        PaginationVo<Article> paginationVo = articleService.selectByPageWithSearch(1, 2, "");
        paginationVo.getList().forEach(e -> System.out.println(e.getTitle()));
        return "article_content";
    }

    @ResponseBody
    @RequestMapping(value = "/{id}.json", method = RequestMethod.GET)
    public Map<String, Object> getSingle(@PathVariable("id") String id) {
        Map<String, Object> result = new HashMap<>();
        Article article = articleService.selectByPrimaryKey(id);
        result.put("article", article);
        return result;
    }

    @RequestMapping(value = "/{id}.htm", method = RequestMethod.GET)
    public String getSingle(@PathVariable(value = "id") String id, Model model) {
        model.addAttribute("id", id);
        return "article";
    }

    @ResponseBody
    @RequestMapping(value = "/list.json", method = RequestMethod.GET)
    public Map list(@RequestParam(value = "p", defaultValue = "1") Integer p) {
        Map<String, Object> result = new HashMap<>();
        PaginationVo<Article> paginationVo = articleService.selectByPageWithSearch(p, 8, "");
        result.put("articles", paginationVo.getList());
        System.out.println(paginationVo.getPageNum());
        result.put("pageInfo", paginationVo);
        return result;
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
