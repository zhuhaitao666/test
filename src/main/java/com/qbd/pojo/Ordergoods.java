package com.qbd.pojo;

public class Ordergoods {

    private Integer orderId;
    private Integer goodsId;
    private Integer number;
    private Shoes shoes;
    private Order order;
    private Comment comment;

    @Override
    public String toString() {
        return "Ordergoods{" +
                "orderId=" + orderId +
                ", goodsId=" + goodsId +
                ", number=" + number +
                ", shoes=" + shoes +
                ", order=" + order +
                ", comment=" + comment +
                '}';
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }


    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Shoes getShoes() {
        return shoes;
    }

    public void setShoes(Shoes shoes) {
        this.shoes = shoes;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

}
