package com.qbd.controller;

import com.qbd.pojo.Order;
import com.qbd.pojo.OrderTrack;
import com.qbd.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/ShoesOnline")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @RequestMapping("/pending")
    public String pending(int  orderId, HttpServletRequest request,String information,String location){
        request.setAttribute("information",information);//必须
        OrderTrack orderTrack=new OrderTrack();
        orderTrack.setLocation(location);
        orderTrack.setUpdateTime(new Date());
        orderService.addOrderTrack(orderTrack);
        if (orderService.Pending(orderId,orderTrack.getOrderTrackId())==1)
        {
            List<Order> orders=orderService.getAllPendingShipmentOrders();
            request.setAttribute("bePendingOrders",orders);
            return "forward:/jsp/manager/slide.jsp";
        }
        return "404";
    }

    @RequestMapping("/addTrack")
    public String addTracks(int  orderId, HttpServletRequest request,String information,OrderTrack orderTrack)
    {
        request.setAttribute("information",information);//必须
        orderTrack.setUpdateTime(new Date());
        orderService.addOrderTrack(orderTrack);//追加订单信息
        if(orderTrack.getArriveState()==1){
            orderService.arrived(orderId);//到货
            //重新加载未到货，已发货订单信息
        }
        List <Order> orders=orderService.getAllPendingOrders();
        request.setAttribute("orderList",orders);
        return "forward:/jsp/manager/slide.jsp";
    }
}
