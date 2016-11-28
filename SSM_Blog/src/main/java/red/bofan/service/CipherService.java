package red.bofan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import red.bofan.dao.CipherMapper;
import red.bofan.model.Cipher;

/**
 * Created by hongbofan on 2016/11/28.
 */
@Service("cipherService")
public class CipherService {
    @Autowired
    private CipherMapper cipherMapper;

    public int insert(Cipher cipher){
        return  cipherMapper.insert(cipher);
    }
    public int insertSelective(Cipher cipher){
        return cipherMapper.insertSelective(cipher);
    }
    public Cipher selectByPrimaryKey(String id){
        return cipherMapper.selectByPrimaryKey(id);
    }
}
