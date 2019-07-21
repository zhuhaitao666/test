package com.qbd.pojo;

import java.util.Date;
import java.util.Objects;

public class ShopCart {
    private Integer shopCartId;
    private Integer goodsId;
    private Integer buyNum;
    private Date addTime;
    private Integer userId;
    private Integer type1Id;
    private Double total;

    //购物车包含对象
    private User user;
    private ShoesType1 shoesType1;
    private Shoes shoes;

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Integer getType1Id() {
        return type1Id;
    }

    public void setType1Id(Integer type1Id) {
        this.type1Id = type1Id;
    }


    public Integer getShopCartId() {
        return shopCartId;
    }

    public void setShopCartId(Integer shopCartId) {
        this.shopCartId = shopCartId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(Integer buyNum) {
        this.buyNum = buyNum;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ShoesType1 getShoesType1() {
        return shoesType1;
    }

    public void setShoesType1(ShoesType1 shoesType1) {
        this.shoesType1 = shoesType1;
    }

    public Shoes getShoes() {
        return shoes;
    }

    public void setShoes(Shoes shoes) {
        this.shoes = shoes;
    }


    @Override
    public String toString() {
        return "ShopCart{" +
                "shopCartId=" + shopCartId +
                ", goodsId=" + goodsId +
                ", buyNum=" + buyNum +
                ", addTime=" + addTime +
                ", userId=" + userId +
                ", type1Id=" + type1Id +
                ", total=" + total +
                ", user=" + user +
                ", shoesType1=" + shoesType1 +
                ", shoes=" + shoes +
                '}';
    }
}
