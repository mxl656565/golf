/**
 * 公司:
 * 文件名:CustomerController
 * 作者：asus
 * 时间：2020/8/13 14:10
 * 描述：
 */
package com.tiger.golf.controller;

import com.tiger.golf.common.CommonResult;
import com.tiger.golf.mapper.CustomerMapper;
import com.tiger.golf.model.Customer;
import com.tiger.golf.service.CustomerService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author : tiger
 * @description :
 * @email : tiger.liu@waymap.cn
 * @date : 2020/8/13
 */
@RestController
@RequestMapping("/cust")
@SuppressWarnings("all")
@Api(tags = "CustomerController",value = "客户管理")
public class CustomerController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomerMapper customerMapper;
    @ApiOperation("获取所有客户信息")
    @RequestMapping(value = "/getAll",method = RequestMethod.GET)
    public CommonResult getAllCustomerInfo(){
        List<Customer> customers = customerService.selectAll();
        return CommonResult.success(customers);
    }
    @ApiOperation("根据id获取客户信息")
    @RequestMapping(value = "/get/{id}",method = RequestMethod.GET)
    public Customer getCustomerInfoById(@PathVariable Integer id){
        Customer cust = customerService.selectOne(id);
        return cust;

    }
    @ApiOperation("根据id删除客户信息")
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    public CommonResult deleteCustomerInfoById(@PathVariable Integer id){
        int rows = customerMapper.deleteByPrimaryKey(id);
        return CommonResult.success(rows);

    }
}
