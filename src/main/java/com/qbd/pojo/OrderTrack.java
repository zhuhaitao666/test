package com.qbd.pojo;

import java.util.Date;

public class OrderTrack {
    private Integer orderTrackId;
    private String location;
    private Date updateTime;
    private Integer arriveState;

    public Integer getOrderTrackId() {
        return orderTrackId;
    }

    public void setOrderTrackId(Integer orderTrackId) {
        this.orderTrackId = orderTrackId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getArriveState() {
        return arriveState;
    }

    public void setArriveState(Integer arriveState) {
        this.arriveState = arriveState;
    }

    @Override
    public String toString() {
        return "OrderStack{" +
                "orderTrackId=" + orderTrackId +
                ", location='" + location + '\'' +
                ", updateTime=" + updateTime +
                ", arriveState=" + arriveState +
                '}';
    }
}
