package com.qbd.dao;

import com.qbd.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SettleMapper {
    public  int getCoupon(Coupon coupon);//领取个人优惠券（插入）
    public  Coupon getCouponById(int couponId);//获取优惠券信息
    public Discount getDisCountById(int couponId);//查询折扣优惠券信息
    public List<Coupon> getSelfCoupons(int userId);//查找个人所有的优惠券
    public GoodsDiscount canUseCoupons(@Param("goodsDiscountId") int goodsDiscountId,@Param("goodsId") int goodsId);//查询优惠券是否可用
    public  void updateCouponStatus(int couponId);//优惠券状态
    public int connectOrderCoupon(@Param("orderId") int orderId,@Param("couponId")int couponId);
    public int createOrder(Order order);
    public int createOrderGoods(Ordergoods ordergoods);
    public int getPoints(@Param("addPoints") int addPoints,@Param("userId") int userId);//购买得到积分
    public int reducePoints(@Param("reducePoints") int reducePoints,@Param("userId") int userId);//减少积分
}
