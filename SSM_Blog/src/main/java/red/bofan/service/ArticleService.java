package red.bofan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import red.bofan.dao.ArticleMapper;
import red.bofan.model.Article;
import red.bofan.util.PaginationVo;

import java.util.Map;

/**
 * Created by hongbofan on 2016/10/14.
 */
@Service("articleService")
public class ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    @CachePut(value = "cache4jds",key = "'article.selectByPageWithSearch'")
    public Map insertSelectiveDDL(Integer count){
        return articleMapper.insertSelectiveDDL(count);
    }
    @Cacheable(value = "cache4jds",key="'article.selectByPrimaryKey('+#id+')'")
    public Article selectByPrimaryKey(String id){
        return articleMapper.selectByPrimaryKey(id);
    }
    @CachePut(value = "cache4jds",key = "'article.selectByPageWithSearch'")
    public int insertSelective(Article article){
        return articleMapper.insertSelective(article);
    }
    @CachePut(value = "cache4jds",key = "'article.selectByPageWithSearch'")
    public int updateSelective(Article article){
        return articleMapper.updateByPrimaryKeySelective(article);
    }
    //@Cacheable(value = "cache4jds",key="'article.selectByPageWithSearch('+#pagenum+','+#pagesize+','+#title+')'")
    public PaginationVo<Article> selectByPageWithSearch(int pagenum,int pagesize,String title){
        //int pagenum是当前的页码,int pagesize是每页显示的数据数量
        PaginationVo<Article> pageVo=new PaginationVo<Article>();
        //一定要在setPageCount()方法之后执行setPageNum
        pageVo.setCount(articleMapper.selectCountBySearch(title));
        pageVo.setRows(pagesize);
        pageVo.setPageNum(pagenum);
        pageVo.setList(articleMapper.selectByPageWithSearch(title,pageVo.getOffset(), pageVo.getRows()));
        return pageVo;
    }
    @Cacheable(value = "cache4jds",key="'selectByPageWithSearch('+#pagenum+','+#pagesize+','+#title+')'")
    public PaginationVo<Article> selectByPageWithSearchDDL(int pagenum,int pagesize,String title){
        //int pagenum是当前的页码,int pagesize是每页显示的数据数量
        PaginationVo<Article> pageVo=new PaginationVo<Article>();
        //一定要在setPageCount()方法之后执行setPageNum
        pageVo.setCount(articleMapper.selectCountBySearchDDL(title));
        pageVo.setRows(pagesize);
        pageVo.setPageNum(pagenum);
        pageVo.setList(articleMapper.selectByPageWithSearchDDL(title,pageVo.getOffset(), pageVo.getRows()));
        return pageVo;
    }
}
