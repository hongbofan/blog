import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.ManagedArray;
import org.springframework.core.task.TaskExecutor;
import red.bofan.model.Article;
import red.bofan.service.ArticleService;

import java.util.Date;
import java.util.UUID;

/**
 * Created by hongbofan on 2016/11/12.
 */
public class ArticleServiceTest extends BaseTest {
    @Autowired
    private ArticleService articleService;
    private final static String content = "[TOC]\n" +
            " #### Disabled options\n" +
            " \n" +
            " - TeX (Based on KaTeX);\n" +
            " - Emoji;\n" +
            " - Task lists;\n" +
            " - HTML tags decode;\n" +
            " - Flowchart and Sequence Diagram;\n" +
            " \n" +
            " #### Editor.md directory\n" +
            " \n" +
            "     editor.md/\n" +
            "             lib/\n" +
            "             css/\n" +
            "             scss/\n" +
            "             tests/\n" +
            "             fonts/\n" +
            "             images/\n" +
            "             plugins/\n" +
            "             examples/\n" +
            "             languages/\n" +
            "             editormd.js\n" +
            "             ...\n" +
            " \n" +
            " ```html\n" +
            " <!-- English -->\n" +
            " <script src=\"../dist/js/languages/en.js\"></script>\n" +
            " \n" +
            " <!-- 繁體中文 -->\n" +
            " <script src=\"../dist/js/languages/zh-tw.js\"></script>\n" +
            " ```";

    @Autowired
    private TaskExecutor taskExecutor;
    Integer count = 0;
    @Test
    public void insertArticleTest(){
        for(int i = 0; i<100;i++){
            Article article = new Article();
            String id = UUID.randomUUID().toString();
            article.setId(id);
            article.setContent(content);
            article.setTitle("test" + i);
            article.setLastDate(new Date());
            article.setUserId("1");
            try{
                taskExecutor.execute(()->{
                    System.out.println(article.getTitle()+" start");
                    articleService.insertSelective(article);
                    synchronized(count) {
                        count++;
                        System.out.println(article.getTitle()+" finish,"+count);
                    }
                });
            }catch (Exception e){
                e.printStackTrace();
                break;
            }
        }
        while (count != 100){
//           System.out.println("count:"+count);
//            int a = 1;
//            int b = a+1;
//            System.out.println(a);
        }
        System.out.println("insertArticleTest");

    }
}
