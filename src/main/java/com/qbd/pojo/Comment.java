package com.qbd.pojo;

import java.util.Date;

public class Comment {
    private Integer commentId;
    private Integer orderId;
    private Integer goodsId;
    private Integer userId;
    private String content;
    private String addContent;
    private Date addTime;
    private Date firstTime;
    private int star;

    private Ordergoods ordergoods;
    private User user;


    @Override
    public String toString() {
        return "Comment{" +
                "commentId=" + commentId +
                ", orderId=" + orderId +
                ", goodsId=" + goodsId +
                ", userId=" + userId +
                ", content='" + content + '\'' +
                ", addContent='" + addContent + '\'' +
                ", addTime=" + addTime +
                ", time=" + firstTime +
                ", star=" + star +
                ", ordergoods=" + ordergoods +
                ", user=" + user +
                '}';
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAddContent() {
        return addContent;
    }

    public void setAddContent(String addContent) {
        this.addContent = addContent;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Date getFirstTime() {
        return firstTime;
    }

    public void setFirstTime(Date firstTime) {
        this.firstTime = firstTime;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Ordergoods getOrdergoods() {
        return ordergoods;
    }

    public void setOrdergoods(Ordergoods ordergoods) {
        this.ordergoods = ordergoods;
    }

}
