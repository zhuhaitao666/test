package com.qbd.dao;

import com.qbd.pojo.ShopCart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartMapper {
    public int findType1(@Param("color") String color, @Param("size") String size);//先要查找鞋子对应类型
    public boolean addToCart(ShopCart shopCart);
    public int deleteFromCart(int ShopCartId);
    public List findAllCartRecords(int userId);
}
