package com.qbd.service;

import com.qbd.daoimp.UserMapperImp;

import com.qbd.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private TransactionTemplate tt;
    @Autowired
    private UserMapperImp userMapperImp;

    //设置事务隔离等级为可重复读,事务传播行为REQUIRED,是否只读:否
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public User login(String phone, String password) {
        User user = userMapperImp.login(phone,password);
        if (user!=null)
        {
            return user;
        }
        return null;
    }
    public User login1(String phone, String password) {
        User user = userMapperImp.login1(phone,password);
        if (user!=null)
        {
            return user;
        }
        return null;
    }
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public boolean register(User user)
    {
        if (userMapperImp.register(user))
        {
            return true;
        }
        return false;
    }

    public int getPoints(int userId){
        int points=userMapperImp.getPoints(userId);
        return points;
    }
    public List<User> getAllUsers(){
        return userMapperImp.getAllUsers();
    }
    public boolean deleteUserByUserId(int userId){
         userMapperImp.deleteUserByUserId(userId);
        return true;
    }
}
