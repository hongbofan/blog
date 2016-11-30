import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import red.bofan.model.Cipher;
import red.bofan.service.CipherService;

import java.util.Date;
import java.util.UUID;

/**
 * Created by hongbofan on 2016/11/28.
 */
public class CiperServiceTest extends BaseTest{

    @Autowired
    private CipherService cipherService;
    @Test
    public void getAllTest(){
        cipherService.getAll();
    }
    @Test
    public void insertCipherTest(){
        Cipher  cipher = new Cipher();
        cipher.setUserId("1");
        cipher.setId(UUID.randomUUID().toString());
        cipher.setAnswer("answer");
        //cipher.setTitle("title");
        cipher.setFhint("fhint");
        cipher.setShint("shint");
        cipher.setThint("thint");
        cipher.setPublishTime(new Date());
        cipher.setContent("content");
        //cipherService.insert(cipher);
        cipherService.insertSelective(cipher);
    }

}
