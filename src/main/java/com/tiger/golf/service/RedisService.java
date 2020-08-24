package com.tiger.golf.service;

/**
 * @author : tiger
 * @description : redis常用操作
 * @email : tiger.liu@waymap.cn
 * @date : 2020/8/21
 */
public interface RedisService {
    /**
     * 储存数据
     */
    void set(String key,String value);

    /**
     * 删除数据
     */
    void remove(String key);

    /**
     * 获取数据
     */
    String get(String key);

    /**
     * 设置超时时间
     */
    boolean expire(String key,long expire);

}
