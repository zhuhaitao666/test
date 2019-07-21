package com.qbd.service;

import com.qbd.daoimp.CartMapperImp;
import com.qbd.pojo.Shoes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;

@Service
public class MyCartService {
    @Autowired
    private TransactionTemplate tt;
    @Autowired
    private CartMapperImp cartMapper;
    //设置事务隔离等级为可重复读,事务传播行为REQUIRED,是否只读:否
    // @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public List getAllCartRecords(int userId){
        List <Shoes> shoes=cartMapper.findAllCartRecords(userId);
        return shoes;
    }
}
