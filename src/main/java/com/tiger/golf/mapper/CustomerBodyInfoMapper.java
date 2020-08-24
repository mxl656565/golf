package com.tiger.golf.mapper;

import com.tiger.golf.model.CustomerBodyInfo;

public interface CustomerBodyInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CustomerBodyInfo record);

    int insertSelective(CustomerBodyInfo record);

    CustomerBodyInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CustomerBodyInfo record);

    int updateByPrimaryKey(CustomerBodyInfo record);
}