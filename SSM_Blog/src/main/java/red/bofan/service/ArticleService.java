package red.bofan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import red.bofan.dao.ArticleMapper;
import red.bofan.model.Article;
import red.bofan.util.PaginationVo;

/**
 * Created by hongbofan on 2016/10/14.
 */
@Service("articleService")
public class ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    public Article selectByPrimaryKey(String id){
        return articleMapper.selectByPrimaryKey(id);
    }
    public int insertSelective(Article article){
        return articleMapper.insertSelective(article);
    }

    public PaginationVo<Article> selectByPageWithSearch(int pagenum,int pagesize,String title){
        //int pagenum是当前的页码,int pagesize是每页显示的数据数量
        PaginationVo<Article> pageVo=new PaginationVo<Article>();
        //一定要在setPageCount()方法之后执行setPageNum
        pageVo.setCount(articleMapper.selectCountBySearch(title));
        pageVo.setRows(pagesize);
        pageVo.setPageNum(pagenum);
        pageVo.setList(articleMapper.selectByPageWithSearch(pageVo.getOffset(), pageVo.getRows(),title));
        return pageVo;
    }
}
