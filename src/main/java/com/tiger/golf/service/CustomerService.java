package com.tiger.golf.service;

import com.tiger.golf.model.Customer;

import java.util.List;

/**
 * @author : tiger
 * @description :
 * @email : tiger.liu@waymap.cn
 * @date : 2020/8/13
 */
public interface CustomerService {
    List<Customer> selectAll();
    Customer selectOne(Integer id);
}
