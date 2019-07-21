package com.qbd.daoimp;

import com.qbd.dao.UserMapper;
import com.qbd.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

@Repository
public class UserMapperImp implements UserMapper {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    SqlSession sqlSession;
    public User login(String phone, String password){
        try {
            sqlSession=sqlSessionFactory.openSession();
            //mybatis为接口实现代理对象
           UserMapper userMapper=sqlSession.getMapper(UserMapper.class);
           User user=userMapper.login(phone,password);
            if (user!=null)
            {
                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
         return null;
    }

    @Override
    public User login1(String phone, String password) {//管理员登录
        try {
            sqlSession=sqlSessionFactory.openSession();
            UserMapper userMapper=sqlSession.getMapper(UserMapper.class);
            User user=userMapper.login1(phone,password);
            if (user!=null)
            {
                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    public boolean register(User user)
    {
        try{
            sqlSession=sqlSessionFactory.openSession();
            UserMapper userMapper=sqlSession.getMapper(UserMapper.class);
            boolean b=userMapper.register(user);
            sqlSession.commit();
            if (b){
                return true;
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return false;
    }

    @Override
    public User getUserById(int userId) {
        User user=null;
        try{
            sqlSession=sqlSessionFactory.openSession();
            UserMapper userMapper=sqlSession.getMapper(UserMapper.class);
            user=userMapper.getUserById(userId);
        }catch(Exception e)
        {
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return user;
    }

    @Override
    public int getPoints(int userId) {
        int points=0;
        try{
            sqlSession=sqlSessionFactory.openSession();
            UserMapper userMapper=sqlSession.getMapper(UserMapper.class);
            points=userMapper.getPoints(userId);
        }catch(Exception e)
        {
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return points;
    }

    @Override
    public List<User> getAllUsers() {
        try{
            sqlSession=sqlSessionFactory.openSession();
            UserMapper userMapper=sqlSession.getMapper(UserMapper.class);
            List<User> users=userMapper.getAllUsers();
            return users;
        }catch(Exception e)
        {
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public int deleteUserByUserId(int userId) {
        try{
            sqlSession=sqlSessionFactory.openSession();
            UserMapper userMapper=sqlSession.getMapper(UserMapper.class);
            int row = userMapper.deleteUserByUserId(userId);
            sqlSession.commit();
        }catch(Exception e)
        {
            sqlSession.rollback();
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }
        return 0;
    }


}
