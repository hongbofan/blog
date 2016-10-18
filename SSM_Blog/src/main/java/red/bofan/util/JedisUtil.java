//package red.bofan.util;
//import com.google.common.collect.Lists;
//import com.google.common.collect.Maps;
//import com.google.common.collect.Sets;
//import java.util.List;
//import java.util.Map;
//import java.util.Map.Entry;
//import java.util.Set;
//import redis.clients.jedis.Jedis;
//import redis.clients.jedis.JedisPool;
///**
// * Created by hongbofan on 2016/10/18.
// */
//
//
//public class JedisUtil
//{
//    private static JedisPool jedisPool = (JedisPool)SpringContextHolder.getBean(JedisPool.class);
//
//    public static Jedis getResource()
//    {
//        Jedis jedis = null;
//        try
//        {
//            jedis = jedisPool.getResource();
//        }
//        catch (Exception e)
//        {
//            if (jedis != null) {
//                jedis.close();
//            }
//            throw e;
//        }
//        return jedis;
//    }
//
//    public static String get(String key)
//    {
//        String value = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(key).booleanValue())
//            {
//                value = jedis.get(key);
//                value = (StringUtils.isNotBlank(value)) && (!"nil".equalsIgnoreCase(value)) ? value : null;
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return value;
//    }
//
//    public static Object getObject(String key)
//    {
//        Object value = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(getBytesKey(key)).booleanValue()) {
//                value = toObject(jedis.get(getBytesKey(key)));
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return value;
//    }
//
//    public static String set(String key, String value, int cacheSeconds)
//    {
//        String result = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            result = jedis.set(key, value);
//            if (cacheSeconds != 0) {
//                jedis.expire(key, cacheSeconds);
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static String setObject(String key, Object value, int cacheSeconds)
//    {
//        String result = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            result = jedis.set(getBytesKey(key), toBytes(value));
//            if (cacheSeconds != 0) {
//                jedis.expire(key, cacheSeconds);
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static List<String> getList(String key)
//    {
//        List<String> value = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(key).booleanValue()) {
//                value = jedis.lrange(key, 0L, -1L);
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return value;
//    }
//
//    public static List<Object> getObjectList(String key)
//    {
//        List<Object> value = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(getBytesKey(key)).booleanValue())
//            {
//                List<byte[]> list = jedis.lrange(getBytesKey(key), 0L, -1L);
//                value = Lists.newArrayList();
//                for (byte[] bs : list) {
//                    value.add(toObject(bs));
//                }
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return value;
//    }
//
//    public static long setList(String key, List<String> value, int cacheSeconds)
//    {
//        long result = 0L;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(key).booleanValue()) {
//                jedis.del(key);
//            }
//            result = jedis.rpush(key, (String[])value.toArray()).longValue();
//            if (cacheSeconds != 0) {
//                jedis.expire(key, cacheSeconds);
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static long setObjectList(String key, List<Object> value, int cacheSeconds)
//    {
//        long result = 0L;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(getBytesKey(key)).booleanValue()) {
//                jedis.del(key);
//            }
//            List<byte[]> list = Lists.newArrayList();
//            for (Object o : value) {
//                list.add(toBytes(o));
//            }
//            result = jedis.rpush(getBytesKey(key), (byte[][])list.toArray()).longValue();
//            if (cacheSeconds != 0) {
//                jedis.expire(key, cacheSeconds);
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static long listAdd(String key, String... value)
//    {
//        long result = 0L;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            result = jedis.rpush(key, value).longValue();
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static long listObjectAdd(String key, Object... value)
//    {
//        long result = 0L;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            List<byte[]> list = Lists.newArrayList();
//            for (Object o : value) {
//                list.add(toBytes(o));
//            }
//            result = jedis.rpush(getBytesKey(key), (byte[][])list.toArray()).longValue();
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static Set<String> getSet(String key)
//    {
//        Set<String> value = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(key).booleanValue()) {
//                value = jedis.smembers(key);
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return value;
//    }
//
//    public static Set<Object> getObjectSet(String key)
//    {
//        Set<Object> value = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(getBytesKey(key)).booleanValue())
//            {
//                value = Sets.newHashSet();
//                Set<byte[]> set = jedis.smembers(getBytesKey(key));
//                for (byte[] bs : set) {
//                    value.add(toObject(bs));
//                }
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return value;
//    }
//
//    public static long setSet(String key, Set<String> value, int cacheSeconds)
//    {
//        long result = 0L;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(key).booleanValue()) {
//                jedis.del(key);
//            }
//            result = jedis.sadd(key, (String[])value.toArray()).longValue();
//            if (cacheSeconds != 0) {
//                jedis.expire(key, cacheSeconds);
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static long setObjectSet(String key, Set<Object> value, int cacheSeconds)
//    {
//        long result = 0L;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(getBytesKey(key)).booleanValue()) {
//                jedis.del(key);
//            }
//            Set<byte[]> set = Sets.newHashSet();
//            for (Object o : value) {
//                set.add(toBytes(o));
//            }
//            result = jedis.sadd(getBytesKey(key), (byte[][])set.toArray()).longValue();
//            if (cacheSeconds != 0) {
//                jedis.expire(key, cacheSeconds);
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static long setSetAdd(String key, String... value)
//    {
//        long result = 0L;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            result = jedis.sadd(key, value).longValue();
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static long setSetObjectAdd(String key, Object... value)
//    {
//        long result = 0L;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            Set<byte[]> set = Sets.newHashSet();
//            for (Object o : value) {
//                set.add(toBytes(o));
//            }
//            result = jedis.rpush(getBytesKey(key), (byte[][])set.toArray()).longValue();
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static Map<String, String> getMap(String key)
//    {
//        Map<String, String> value = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(key).booleanValue()) {
//                value = jedis.hgetAll(key);
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return value;
//    }
//
//    public static Map<String, Object> getObjectMap(String key)
//    {
//        Map<String, Object> value = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(getBytesKey(key)).booleanValue())
//            {
//                value = Maps.newHashMap();
//                Map<byte[], byte[]> map = jedis.hgetAll(getBytesKey(key));
//                for (Map.Entry<byte[], byte[]> e : map.entrySet()) {
//                    value.put(StringUtils.toString((byte[])e.getKey()), toObject((byte[])e.getValue()));
//                }
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return value;
//    }
//
//    public static String setMap(String key, Map<String, String> value, int cacheSeconds)
//    {
//        String result = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(key).booleanValue()) {
//                jedis.del(key);
//            }
//            result = jedis.hmset(key, value);
//            if (cacheSeconds != 0) {
//                jedis.expire(key, cacheSeconds);
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static String setObjectMap(String key, Map<String, Object> value, int cacheSeconds)
//    {
//        String result = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(getBytesKey(key)).booleanValue()) {
//                jedis.del(key);
//            }
//            Map<byte[], byte[]> map = Maps.newHashMap();
//            for (Map.Entry<String, Object> e : value.entrySet()) {
//                map.put(getBytesKey(e.getKey()), toBytes(e.getValue()));
//            }
//            result = jedis.hmset(getBytesKey(key), map);
//            if (cacheSeconds != 0) {
//                jedis.expire(key, cacheSeconds);
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static String mapPut(String key, Map<String, String> value)
//    {
//        String result = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            result = jedis.hmset(key, value);
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static String mapObjectPut(String key, Map<String, Object> value)
//    {
//        String result = null;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            Map<byte[], byte[]> map = Maps.newHashMap();
//            for (Map.Entry<String, Object> e : value.entrySet()) {
//                map.put(getBytesKey(e.getKey()), toBytes(e.getValue()));
//            }
//            result = jedis.hmset(getBytesKey(key), map);
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static long mapRemove(String key, String mapKey)
//    {
//        long result = 0L;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            result = jedis.hdel(key, new String[] { mapKey }).longValue();
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static long mapObjectRemove(String key, String mapKey)
//    {
//        long result = 0L;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            result = jedis.hdel(getBytesKey(key), new byte[][] { getBytesKey(mapKey) }).longValue();
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static boolean mapExists(String key, String mapKey)
//    {
//        boolean result = false;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            result = jedis.hexists(key, mapKey).booleanValue();
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static boolean mapObjectExists(String key, String mapKey)
//    {
//        boolean result = false;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            result = jedis.hexists(getBytesKey(key), getBytesKey(mapKey)).booleanValue();
//        }
//        catch (Exception localException) {}finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static long del(String key)
//    {
//        long result = 0L;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(key).booleanValue()) {
//                result = jedis.del(key).longValue();
//            }
//        }
//        catch (Exception localException) {}finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static long delObject(String key)
//    {
//        long result = 0L;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            if (jedis.exists(getBytesKey(key)).booleanValue()) {
//                result = jedis.del(getBytesKey(key)).longValue();
//            }
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static boolean exists(String key)
//    {
//        boolean result = false;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            result = jedis.exists(key).booleanValue();
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static boolean existsObject(String key)
//    {
//        boolean result = false;
//        Jedis jedis = null;
//        try
//        {
//            jedis = getResource();
//            result = jedis.exists(getBytesKey(key)).booleanValue();
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            returnResource(jedis);
//        }
//        return result;
//    }
//
//    public static void returnBrokenResource(Jedis jedis)
//    {
//        if (jedis != null) {
//            jedisPool.returnBrokenResource(jedis);
//        }
//    }
//
//    public static void returnResource(Jedis jedis)
//    {
//        if (jedis != null) {
//            jedisPool.returnResource(jedis);
//        }
//    }
//
//    public static byte[] getBytesKey(Object object)
//    {
//        if ((object instanceof String)) {
//            return StringUtils.getBytes((String)object);
//        }
//        return ObjectUtils.serialize(object);
//    }
//
//    public static byte[] toBytes(Object object)
//    {
//        return ObjectUtils.serialize(object);
//    }
//
//    public static Object toObject(byte[] bytes)
//    {
//        return ObjectUtils.unserialize(bytes);
//    }
//}
//
