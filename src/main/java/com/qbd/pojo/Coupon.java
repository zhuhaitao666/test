package com.qbd.pojo;

import java.util.Date;

public class Coupon {
    private Integer couponId;
    private Double value;
    private String name;
    private Date startTime;
    private Date endTime;
    private Integer userId;
    private Integer hadUsed;
    private Double full;
    private User user;

    public Double getFull() {
        return full;
    }

    public void setFull(Double full) {
        this.full = full;
    }

    public Integer getHadUsed() {
        return hadUsed;
    }

    public void setHadUsed(Integer hadUsed) {
        this.hadUsed = hadUsed;
    }

    public Integer getCouponId() {
        return couponId;
    }

    public void setCouponId(Integer couponId) {
        this.couponId = couponId;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
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

    @Override
    public String toString() {
        return "coupon{" +
                "couponId=" + couponId +
                ", value=" + value +
                ", name='" + name + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", userId=" + userId +
                ", user=" + user +
                '}';
    }
}
