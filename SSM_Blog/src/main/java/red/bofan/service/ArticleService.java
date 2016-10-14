package red.bofan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import red.bofan.dao.ArticleMapper;
import red.bofan.model.Article;

/**
 * Created by hongbofan on 2016/10/14.
 */
@Service("articleService")
public class ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    public int insertSelective(Article article){
        return articleMapper.insertSelective(article);
    }
}
