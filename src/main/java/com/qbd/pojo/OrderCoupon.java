package com.qbd.pojo;

public class OrderCoupon {
    private Integer orderId;
    private Integer couponId;

    private Order order;
    private Coupon coupon;

    @Override
    public String toString() {
        return "OrderCoupon{" +
                "orderId=" + orderId +
                ", couponId=" + couponId +
                ", order=" + order +
                ", coupon=" + coupon +
                '}';
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getCouponId() {
        return couponId;
    }

    public void setCouponId(Integer couponId) {
        this.couponId = couponId;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Coupon getCoupon() {
        return coupon;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }
}
