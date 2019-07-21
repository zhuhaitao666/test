package com.qbd.pojo;

public class GoodsDiscount {
    private Integer goodsDiscountId;
    private Integer goodsId;

    private Discount discount;
    private Shoes shoes;

    public Integer getGoodsDiscountId() {
        return goodsDiscountId;
    }

    public void setGoodsDiscountId(Integer goodsDiscountId) {
        this.goodsDiscountId = goodsDiscountId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public Shoes getShoes() {
        return shoes;
    }

    public void setShoes(Shoes shoes) {
        this.shoes = shoes;
    }

    @Override
    public String toString() {
        return "GoodsDiscount{" +
                "goodsDiscountId=" + goodsDiscountId +
                ", goodsId=" + goodsId +
                ", discount=" + discount +
                ", shoes=" + shoes +
                '}';
    }
}
