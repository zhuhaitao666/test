package com.qbd.daoimp;


import com.qbd.dao.Nav1Mapper;
import com.qbd.pojo.Shoes;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Nav1MapperImp implements Nav1Mapper {
    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    SqlSession sqlSession;
    @Override
    public List<Shoes> getShoesByClass(int goodsTypeId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            Nav1Mapper nav1Mapper= sqlSession.getMapper(Nav1Mapper.class);
            List<Shoes> shoes=nav1Mapper.getShoesByClass(goodsTypeId);
            return shoes;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public int getGoodsTypeIdByBrandName(String kind) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            Nav1Mapper nav1Mapper= sqlSession.getMapper(Nav1Mapper.class);
            int goodsTypeId=nav1Mapper.getGoodsTypeIdByBrandName(kind);
            return goodsTypeId;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return 0;
    }

    @Override
    public List<Shoes> getShoesBySearch(String goodsName) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            Nav1Mapper nav1Mapper= sqlSession.getMapper(Nav1Mapper.class);
            List<Shoes> shoes=nav1Mapper.getShoesBySearch(goodsName);
            return shoes;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }
}
