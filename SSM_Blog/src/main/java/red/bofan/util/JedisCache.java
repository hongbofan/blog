package red.bofan.util;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.cache.Cache;
import org.springframework.cache.support.SimpleValueWrapper;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.Callable;

public class JedisCache implements Cache {

    private RedisTemplate<String, Object> redisTemplate;
    private String name;

    public RedisTemplate<String, Object> getRedisTemplate() {
        return redisTemplate;
    }

    public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String getName() {
        // TODO Auto-generated method stub
        return this.name;
    }

    @Override
    public Object getNativeCache() {
        // TODO Auto-generated method stub
        return this.redisTemplate;
    }

    @Override
    public ValueWrapper get(Object key) {
        // TODO Auto-generated method stub
        System.out.println("get key");
        final String keyf = key.toString();
        Object object = null;
        object = redisTemplate.execute(new RedisCallback<Object>() {
            public Object doInRedis(RedisConnection connection)
                    throws DataAccessException {
                byte[] key = keyf.getBytes();
                byte[] value = connection.get(key);
                if (value == null) {
                    return null;
                }
                return toObject(value);
            }
        });
        return (object != null ? new SimpleValueWrapper(object) : null);
    }

    @Override
    public <T> T get(Object key, Class<T> type) {
        return null;
    }


    @Override
    public void put(Object key, Object value) {
        // TODO Auto-generated method stub
        System.out.println("put key");
        final String keyf = key.toString();
        final Object valuef = value;
        final long liveTime = 86400;
        Set<String> set = redisTemplate.keys("article.selectByPageWithSearch*");
        Iterator<String> it = set.iterator();
        redisTemplate.execute(new RedisCallback<Long>() {
            public Long doInRedis(RedisConnection connection)
                    throws DataAccessException {
                byte[] keyb = keyf.getBytes();
                byte[] valueb = toByteArray(valuef);
                if("article.selectByPageWithSearch".equals(keyf)){
                    while(it.hasNext()){
                        String keyStr = it.next();
                        System.out.println(keyStr);
                        connection.del(keyStr.getBytes());
                    }
                }else {
                    connection.set(keyb, valueb);
                }
                if(keyf.startsWith("IP")){
                    connection.expire(keyb, 180);
                }else{
                    if (liveTime > 0) {
                        connection.expire(keyb, liveTime);
                    }
                }
                return 1L;
            }
        });
    }

    private byte[] toByteArray(Object obj) {
        byte[] bytes = null;
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        try {
            ObjectOutputStream oos = new ObjectOutputStream(bos);
            oos.writeObject(obj);
            oos.flush();
            bytes = bos.toByteArray();
            oos.close();
            bos.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return bytes;
    }

    private Object toObject(byte[] bytes) {
        Object obj = null;
        try {
            ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
            ObjectInputStream ois = new ObjectInputStream(bis);
            obj = ois.readObject();
            ois.close();
            bis.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return obj;
    }

    @Override
    public void evict(Object key) {
        // TODO Auto-generated method stub
        System.out.println("del key");
        final String keyf = key.toString();
        redisTemplate.execute(new RedisCallback<Long>() {
            public Long doInRedis(RedisConnection connection)
                    throws DataAccessException {
                return connection.del(keyf.getBytes());
            }
        });
    }

    @Override
    public void clear() {
        // TODO Auto-generated method stub
        System.out.println("clear key");
        redisTemplate.execute(new RedisCallback<String>() {
            public String doInRedis(RedisConnection connection)
                    throws DataAccessException {
                connection.flushDb();
                return "ok";
            }
        });
    }

    @Override
    public <T> T get(Object key, Callable<T> valueLoader) {
        return null;
    }


    @Override
    public ValueWrapper putIfAbsent(Object key, Object value) {
        // TODO Auto-generated method stub
        return null;
    }

}