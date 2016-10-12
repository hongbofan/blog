package red.bofan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

/**
 * Created by hongbofan on 2016/10/12.
 */
@Controller
@RequestMapping("/article")
public class Article {
    @RequestMapping(value="/upload.do",method= RequestMethod.POST)
    public HashMap upload(@RequestParam(value = "test-editormd-markdown-doc", required = false)String markdown,
                          @RequestParam(value = "test-editormd-html-code", required = false)String html){
        System.out.println(markdown);
        System.out.println(html);
        HashMap map = new HashMap();
        map.put("msg","ok");
        return map;
    }
}
