package com.qbd.service;

import com.qbd.daoimp.SettleMapperImp;
import com.qbd.pojo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;

@Service
public class SettleService {
    @Autowired
    private SettleMapperImp settleMapper;
    @Autowired
    private TransactionTemplate tt;
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int getCoupon(Coupon coupon){
        int row=settleMapper.getCoupon(coupon);
        return row;
    }
    public Coupon getCouponById(int couponId){
        return settleMapper.getCouponById(couponId);
    }
    public Discount getDisCountById(int couponId){
        Discount discount=settleMapper.getDisCountById(couponId);
        if(discount!=null)
        {
            return discount;
        }
        return null;
    }

    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public List<Coupon> getSelfCoupons(int userId){
        List<Coupon> coupons=settleMapper.getSelfCoupons(userId);
        return coupons;
    }

    public GoodsDiscount canUseCoupons(int goodsDiscountId, int goodsId) {
        GoodsDiscount goodsDiscount=settleMapper.canUseCoupons(goodsDiscountId,goodsId);
        return goodsDiscount;
    }


    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public boolean updateCouponStatus(int couponId){
        settleMapper.updateCouponStatus(couponId);//使用优惠券
        return true;
    }
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int createOrder(Order order){
        settleMapper.createOrder(order);
        return 1;
    }
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int createOrderGoods(Ordergoods ordergoods){
        settleMapper.createOrderGoods(ordergoods);
        return 1;
    }

    public int getPoints(int addPoints, int userId){//增加积分
       return settleMapper.getPoints(addPoints,userId);
    }
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int reducePoints(@Param("reducePoints") int reducePoints, @Param("userId") int userId){
        return settleMapper.reducePoints(reducePoints,userId);
    }
}
