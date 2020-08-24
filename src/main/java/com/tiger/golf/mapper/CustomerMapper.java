package com.tiger.golf.mapper;

import com.tiger.golf.model.Customer;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    @Select("select*from customer")
    List<Customer> selectAll();
}