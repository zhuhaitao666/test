package com.qbd.service;

import com.qbd.daoimp.CartMapperImp;
import com.qbd.daoimp.ShoesMapperImp;
import com.qbd.pojo.Shoes;
import com.qbd.pojo.ShopCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.Date;

@Service
public class BuyShoesService {
    @Autowired
    private TransactionTemplate tt;
    @Autowired
    private CartMapperImp cartMapperImp;//用于查找鞋子类型1
    @Autowired
    private ShoesMapperImp shoesMapper;//用于减少鞋子数量
    double total;

    private ShopCart shopCart=new ShopCart();

    //设置事务隔离等级为可重复读,事务传播行为REQUIRED,是否只读:否
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public boolean addToCart(Shoes s, String color, String size,
                             int userId, int goodsId, int buyNum){


        //------------------------------------------------------------------
        int type1Id=cartMapperImp.findType1(color,size);//查找类型

        shoesMapper.reduceNum(buyNum,goodsId);//减少数量

        //------------------------------------------------------------------
        if (s.getIsPromote()==1)
        {
            total=s.getPromotePrice()*buyNum;
        }else
        {
            total=s.getShopPrice()*buyNum;
        }
        shopCart.setGoodsId(goodsId);
        shopCart.setBuyNum(buyNum);
        shopCart.setAddTime(new Date());
        shopCart.setUserId(userId);
        shopCart.setType1Id(type1Id);
        shopCart.setTotal(total);

        cartMapperImp.addToCart(shopCart);//保存到购物车

        return true;
    }
    public int deleteFormCart(int shopCartId,int addNum,int goodsId){
        int row=cartMapperImp.deleteFromCart(shopCartId);
        shoesMapper.addNum(addNum,goodsId);
        if(row!=0){
            return row;
        }
        return 0;
    }
    public void deleteFormCart(int shopCartId){
        cartMapperImp.deleteFromCart(shopCartId);
    }
}
