package com.qbd.service;

import com.qbd.dao.SelfMapper;
import com.qbd.pojo.Comment;
import com.qbd.pojo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;

@Service
public class SelfService {
    @Autowired
    private SelfMapper selfMapper;
    @Autowired
    private TransactionTemplate tt;
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public List<Order> getOrderByUserId(int userId) {
        return selfMapper.getOrderByUserId(userId);
    }
    public List<Order> getBeShippedOrder(int userId) {
        return selfMapper.getBeShippedOrder(userId);
    }
    public List<Order> getHadGetted(int userId){
        return selfMapper.getHadGetted(userId);
    }
    public Comment findJudgementByOrderIdAndGoodsId(int orderId, int goodsId){
        return selfMapper.findJudgementByOrderIdAndGoodsId(orderId,goodsId);
    }
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int addJudge(Comment comment){
        return selfMapper.addJudge(comment);
    }
    public Comment getCommentById(int commentId){
        return selfMapper.getCommentById(commentId);
    }
}
