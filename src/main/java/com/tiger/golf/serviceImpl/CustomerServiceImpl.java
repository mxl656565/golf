/**
 * 公司:
 * 文件名:CustomerServiceImpl
 * 作者：asus
 * 时间：2020/8/13 14:11
 * 描述：
 */
package com.tiger.golf.serviceImpl;

import com.alibaba.fastjson.JSON;
import com.tiger.golf.mapper.CustomerMapper;
import com.tiger.golf.model.Customer;
import com.tiger.golf.service.CustomerService;
import com.tiger.golf.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;
import java.util.Random;

/**
 * @author : tiger
 * @description :
 * @email : tiger.liu@waymap.cn
 * @date : 2020/8/13
 */
@Service
@SuppressWarnings("all")
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private RedisService redisService;
    @Value("${redis.key.prefix.customer}")
    private String customer_key;
    @Value("${redis.key.expire.customer}")
    private String expire;

    @Override
    public List<Customer> selectAll() {
        Random random = new Random();
        List<Customer> list = customerMapper.selectAll();
        Iterator iterator = list.iterator();
        while(iterator.hasNext()){
            System.out.println(iterator.next());
        }
        redisService.set(customer_key+random.ints(50),JSON.toJSONString(list));

        return list;
    }

    @Override
    public Customer selectOne(Integer id) {
        return customerMapper.selectByPrimaryKey(id);
    }

}
