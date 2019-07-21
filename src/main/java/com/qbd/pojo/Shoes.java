package com.qbd.pojo;

import java.util.Date;
import java.util.List;

public class Shoes {
    private Integer goodsId;
    private String goodsName;
    private Integer goodsTypeId;
    private String desc;
    private Integer number;
    private Date onTime;
    private Date offTime;
    private Double shopPrice;
    private Double promotePrice;
    private Date promoteStartTime;
    private Date promoteEndTime;
    private Integer isOnSale;
    private Integer isPromote;
    private Integer givePoints;
    private Integer goodsImgId;
    private Integer hot;
    private Integer canPoint;


    private ShoesImg shoesImg;//图片
    private ShoesType shoesType;//分类
    private List<ShoesType1> shoesType1;//类型

    public List<ShoesType1> getShoesType1() {
        return shoesType1;
    }

    public void setShoesType1(List<ShoesType1> shoesType1) {
        this.shoesType1 = shoesType1;
    }

    public Integer getHot() {
        return hot;
    }

    public void setHot(Integer hot) {
        this.hot = hot;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public Integer getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(Integer goodsTypeId) {
        this.goodsTypeId = goodsTypeId;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Date getOnTime() {
        return onTime;
    }

    public void setOnTime(Date onTime) {
        this.onTime = onTime;
    }

    public Date getOffTime() {
        return offTime;
    }

    public void setOffTime(Date offTime) {
        this.offTime = offTime;
    }

    public Double getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(Double shopPrice) {
        this.shopPrice = shopPrice;
    }

    public Double getPromotePrice() {
        return promotePrice;
    }

    public void setPromotePrice(Double promotePrice) {
        this.promotePrice = promotePrice;
    }

    public Date getPromoteStartTime() {
        return promoteStartTime;
    }

    public void setPromoteStartTime(Date promoteStartTime) {
        this.promoteStartTime = promoteStartTime;
    }

    public Date getPromoteEndTime() {
        return promoteEndTime;
    }

    public void setPromoteEndTime(Date promoteEndTime) {
        this.promoteEndTime = promoteEndTime;
    }

    public Integer getIsOnSale() {
        return isOnSale;
    }

    public void setIsOnSale(Integer isOnSale) {
        this.isOnSale = isOnSale;
    }

    public Integer getIsPromote() {
        return isPromote;
    }

    public void setIsPromote(Integer isPromote) {
        this.isPromote = isPromote;
    }

    public Integer getGivePoints() {
        return givePoints;
    }

    public void setGivePoints(Integer givePoints) {
        this.givePoints = givePoints;
    }

    public Integer getGoodsImgId() {
        return goodsImgId;
    }

    public void setGoodsImgId(Integer goodsImgId) {
        this.goodsImgId = goodsImgId;
    }

    public ShoesImg getShoesImg() {
        return shoesImg;
    }

    public void setShoesImg(ShoesImg shoesImg) {
        this.shoesImg = shoesImg;
    }

    public ShoesType getShoesType() {
        return shoesType;
    }

    public void setShoesType(ShoesType shoesType) {
        this.shoesType = shoesType;
    }

    public Integer getCanPoint() {
        return canPoint;
    }

    public void setCanPoint(Integer canPoint) {
        this.canPoint = canPoint;
    }

    @Override
    public String toString() {
        return "Shoes{" +
                "goodsId=" + goodsId +
                ", goodsName='" + goodsName + '\'' +
                ", goodsTypeId=" + goodsTypeId +
                ", desc='" + desc + '\'' +
                ", number=" + number +
                ", onTime=" + onTime +
                ", offTime=" + offTime +
                ", shopPrice=" + shopPrice +
                ", promotePrice=" + promotePrice +
                ", promoteStartTime=" + promoteStartTime +
                ", promoteEndTime=" + promoteEndTime +
                ", isOnSale=" + isOnSale +
                ", isPromote=" + isPromote +
                ", givePoints=" + givePoints +
                ", booksImgId=" + goodsImgId +
                ", hot=" + hot +
                ", canPoint=" + canPoint +
                ", shoesImg=" + shoesImg +
                ", shoesType=" + shoesType +
                ", shoesType1=" + shoesType1 +
                '}';
    }
}
