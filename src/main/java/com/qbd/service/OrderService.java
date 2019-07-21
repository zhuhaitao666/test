package com.qbd.service;

import com.qbd.dao.OrderMapper;
import com.qbd.pojo.Order;
import com.qbd.pojo.OrderTrack;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    private TransactionTemplate tt;
    @Autowired
    private OrderMapper orderMapper;
    public List<Order> getAllPendingShipmentOrders(){
        return orderMapper.getAllPendingShipmentOrders();
    }
    public List<Order> getAllPendingOrders(){return orderMapper.getAllPendingOrders();}
    public List<Order> getAllOrderByUserId(){
       return null;
    }
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int Pending(int orderId,int orderTrackId){
        return orderMapper.Pending(orderId,orderTrackId);
    }

    public int addOrderTrack(OrderTrack orderTrack){
        return orderMapper.addOrderTrack(orderTrack);
    }
    public int arrived(int orderId){return orderMapper.arrived(orderId);}
}
