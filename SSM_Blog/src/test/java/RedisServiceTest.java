import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import red.bofan.service.ArticleService;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hongbofan on 2016/11/10.
 */
public class RedisServiceTest extends BaseTest {
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private ArticleService articleService;
    @Test
    public void articleCacheTest(){
        articleService.selectByPageWithSearch(1,8,"");
    }
    @Test
    public void redisTest() throws InterruptedException{
        ValueOperations<String, Object> value = redisTemplate.opsForValue();
        value.set("lp", "hello word");
        //获取 这个 key 的值
        System.out.println(value.get("lp"));
        //添加 一个 hash集合
        HashOperations<String, Object, Object> hash = redisTemplate.opsForHash();
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("name", "lp");
        map.put("age", "26");
        hash.putAll("lpMap", map);
        //获取 map
        System.out.println(hash.entries("lpMap"));
    }
}
