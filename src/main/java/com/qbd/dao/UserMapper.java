package com.qbd.dao;

import com.qbd.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    public User login(@Param("phone") String phone, @Param("password") String password);
    public User login1(@Param("phone") String phone, @Param("password") String password);
    public boolean register(User user);
    public User getUserById(int userId);
    public int getPoints(int userId);//个人积分

    public List<User> getAllUsers();//获取所有用户
    public int deleteUserByUserId(int userId);//删除用户

}
