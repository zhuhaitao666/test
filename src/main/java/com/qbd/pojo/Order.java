package com.qbd.pojo;

import java.util.Date;
import java.util.List;

public class Order {
    private Integer orderId;
    private Integer userId;
    private Integer status;// -1取消 0已支付 1发货 2到货 3用户收货
    private Double value;//总价
    private Integer usePoints;

    private Date createTime;//下单时间
    private Date cancel;//取消时间
    private Date deliverTime;//发货时间
    private Date finishTime;//完成时间

    private Integer orderTrackId;

    private User user;
    private List<OrderTrack> orderTracks;

    private List<Ordergoods> ordergoods;

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", userId=" + userId +
                ", status=" + status +
                ", value=" + value +
                ", usePoints=" + usePoints +
                ", createTime=" + createTime +
                ", cancel=" + cancel +
                ", deliverTime=" + deliverTime +
                ", finishTime=" + finishTime +
                ", orderTrackId=" + orderTrackId +
                ", user=" + user +
                ", orderTracks=" + orderTracks +
                ", ordergoods=" + ordergoods +
                '}';
    }

    public Integer getOrderTrackId() {
        return orderTrackId;
    }

    public void setOrderTrackId(Integer orderTrackId) {
        this.orderTrackId = orderTrackId;
    }

    public List<OrderTrack> getOrderTracks() {
        return orderTracks;
    }

    public void setOrderTracks(List<OrderTrack> orderTracks) {
        this.orderTracks = orderTracks;
    }

    public List<Ordergoods> getOrdergoods() {
        return ordergoods;
    }

    public void setOrdergoods(List<Ordergoods> ordergoods) {
        this.ordergoods = ordergoods;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public Integer getUsePoints() {
        return usePoints;
    }

    public void setUsePoints(Integer usePoints) {
        this.usePoints = usePoints;
    }




    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCancel() {
        return cancel;
    }

    public void setCancel(Date cancel) {
        this.cancel = cancel;
    }

    public Date getDeliverTime() {
        return deliverTime;
    }

    public void setDeliverTime(Date deliverTime) {
        this.deliverTime = deliverTime;
    }

    public Date getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
