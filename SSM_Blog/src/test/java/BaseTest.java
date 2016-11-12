import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by hongbofan on 2016/11/10.
 */
//指定bean注入的配置文件
@ContextConfiguration(locations = { "classpath:spring/spring-redis.xml","classpath:spring/spring-service.xml","classpath:spring/spring-dao.xml"})
//使用标准的JUnit @RunWith注释来告诉JUnit使用Spring TestRunner
@RunWith(SpringJUnit4ClassRunner.class)
public class BaseTest extends AbstractJUnit4SpringContextTests {
}