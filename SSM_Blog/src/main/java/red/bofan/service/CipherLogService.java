package red.bofan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import red.bofan.dao.CipherLogMapper;
import red.bofan.model.CipherLog;

/**
 * Created by DELL on 2018/2/5.
 */
@Service("cipherLogService")
public class CipherLogService {
    @Autowired
    private CipherLogMapper cipherLogMapper;
    public int insert(CipherLog record){
        return  cipherLogMapper.insert(record);
    }
}
