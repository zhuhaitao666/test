package com.qbd.dao;

import com.qbd.pojo.Order;
import com.qbd.pojo.OrderTrack;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface OrderMapper {
    public List<Order> getAllPendingShipmentOrders();//查询所有人订单未发货订单
    public List<Order> getAllOrderByUserId();//查询个人未发货订单
    public List<OrderTrack> getOrderTrackById(int orderTrackId);//订单追踪
    public int Pending(@Param("orderId") int orderId,@Param("orderTrackId") int orderTrackId);//发货
    public int addOrderTrack(OrderTrack orderTrack);
    public List<Order> getAllPendingOrders();//查询所有人已发货订单
    public int arrived(int orderId);
}
