package com.qbd.dao;

import com.qbd.pojo.Comment;
import com.qbd.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SelfMapper {
    public List<Order> getOrderByUserId(int userId);//获取待收货
    public List<Order> getBeShippedOrder(int userId);//待发货
    public List<Order> getHadGetted(int userId);//获取已收货
    public int judge(Comment comment);//评论
    public Comment findJudgementByOrderIdAndGoodsId(@Param("orderId") int orderId,@Param("goodsId") int goodsId);
    public int addJudge(Comment comment);//追评
    public Comment getCommentById(int commentId);
}
