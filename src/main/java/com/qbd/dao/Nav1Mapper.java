package com.qbd.dao;

import com.qbd.pojo.Shoes;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Nav1Mapper {
    public List<Shoes>  getShoesByClass(int goodsTypeId);
    public int getGoodsTypeIdByBrandName(String kind);
    public List<Shoes> getShoesBySearch(@Param("goodsName") String goodsName);//模糊查询
}
