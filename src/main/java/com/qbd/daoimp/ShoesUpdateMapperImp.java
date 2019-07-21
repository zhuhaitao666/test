package com.qbd.daoimp;

import com.qbd.dao.CartMapper;
import com.qbd.dao.ShoesUpdateMapper;
import com.qbd.pojo.Shoes;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShoesUpdateMapperImp implements ShoesUpdateMapper {


    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    SqlSession sqlSession;

}
