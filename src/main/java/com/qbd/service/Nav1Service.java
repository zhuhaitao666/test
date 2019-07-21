package com.qbd.service;

import com.qbd.dao.Nav1Mapper;
import com.qbd.daoimp.Nav1MapperImp;
import com.qbd.pojo.Shoes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class Nav1Service {
    @Autowired
    private Nav1MapperImp nav1Mapper;

    public List<Shoes> getShoesByClass(int goodsTypeId) {
        return nav1Mapper.getShoesByClass(goodsTypeId);
    }
    public List<Shoes> getShoesBySearch(String goodsName) {
        System.out.println("Service层得到参数"+goodsName);
        return nav1Mapper.getShoesBySearch(goodsName);
    }
    public int getGoodsTypeIdByBrandName(String kind){
        return nav1Mapper.getGoodsTypeIdByBrandName(kind);
    }
}
