package com.qbd.controller;

import com.qbd.dao.SelfMapper;
import com.qbd.pojo.Comment;
import com.qbd.pojo.Order;
import com.qbd.pojo.Ordergoods;
import com.qbd.service.SelfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/ShoesOnline")
public class selfController {

    @Autowired
    private SelfMapper selfMapper;
    @Autowired
    private SelfService selfService;
    @RequestMapping("/toSelf")
    public String toSelf(){
        return "self/selfindex";
    }

    @RequestMapping("/toPendingReceipt")
    public String pendingReceipt(HttpServletRequest request){
        HttpSession session=request.getSession();
        int userId=(int)session.getAttribute("userId");
        List<Order>orders =selfMapper.getOrderByUserId(userId);
        request.setAttribute("orders",orders);
        return "self/pendingReceipt";
    }

    @RequestMapping("/toBeShipped")
    public String getBeShippedOrder(HttpServletRequest request) {
        HttpSession session=request.getSession();
        int userId=(int)session.getAttribute("userId");
        List<Order>orders =selfMapper.getBeShippedOrder(userId);
        request.setAttribute("orders",orders);
        return "self/toBeShipped";
    }
    @RequestMapping("/toHadGet")
    public String getHadGet(HttpServletRequest request) {
        HttpSession session=request.getSession();
        int userId=(int)session.getAttribute("userId");
        List<Order>orders =selfMapper.getHadGetted(userId);//所有订单项
        for(Order order:orders){
            for(Ordergoods ordergoods:order.getOrdergoods()){
                Comment comment= selfService.findJudgementByOrderIdAndGoodsId(ordergoods.getOrderId(),ordergoods.getGoodsId());
                if (comment!=null)
                {
                    ordergoods.setComment(comment);
                }
            }
        }
        request.setAttribute("orders",orders);

        return "self/hadGet";
    }
    @RequestMapping("/toJudge")
    public String toJudge(String judgement,int orderId,int goodsId,int star,HttpServletRequest request){
        if(selfService.findJudgementByOrderIdAndGoodsId(orderId,goodsId)!=null){
            request.setAttribute("message","该订单项已完成评论，您可选择是否追评");
            System.out.println("该订单项已完成评论");
            return "redirect:/ShoesOnline/toHadGet";
        }
        int userId=(int)request.getSession().getAttribute("userId");
        Comment comment=new Comment();
        comment.setUserId(userId);
        comment.setContent(judgement);
        comment.setOrderId(orderId);
        comment.setGoodsId(goodsId);
        comment.setFirstTime(new Date());
        comment.setStar(star);
        int result=selfMapper.judge(comment);
        if (result==1){
            return "redirect:/ShoesOnline/toHadGet";
        }
        return "404";
    }
    @RequestMapping("/toAddJudge")
    public String toAddJudge(String judgement,int commentId){

        Comment comment=selfMapper.getCommentById(commentId);
        comment.setAddTime(new Date());
        comment.setAddContent(judgement);

        System.out.println(comment);
        int result=selfService.addJudge(comment);
        if(result!=0){
            return "redirect:/ShoesOnline/toHadGet";
        }
        return "404";
    }
}
