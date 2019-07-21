package com.qbd.daoimp;

import com.qbd.dao.OrderMapper;
import com.qbd.dao.ShoesMapper;
import com.qbd.pojo.Order;

import com.qbd.pojo.OrderTrack;
import com.qbd.pojo.Shoes;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderMapperImp implements OrderMapper {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    SqlSession sqlSession;

    @Override
    public List<Order> getAllPendingShipmentOrders() {
        try {
            sqlSession=sqlSessionFactory.openSession();
            OrderMapper orderMapper=sqlSession.getMapper(OrderMapper.class);
            List<Order> orders=orderMapper.getAllPendingShipmentOrders();
            return orders;
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public List<Order> getAllOrderByUserId() {
        try {
            sqlSession=sqlSessionFactory.openSession();
            OrderMapper orderMapper=sqlSession.getMapper(OrderMapper.class);

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;

    }

    @Override
    public List<OrderTrack> getOrderTrackById(int orderTrackId) {

        try {
            sqlSession=sqlSessionFactory.openSession();
            OrderMapper orderMapper=sqlSession.getMapper(OrderMapper.class);
            List<OrderTrack> orderTracks=orderMapper.getOrderTrackById(orderTrackId);
            return orderTracks;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public int Pending(int orderId,int orderTrackId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            OrderMapper orderMapper=sqlSession.getMapper(OrderMapper.class);
            int row=orderMapper.Pending(orderId,orderTrackId);
            sqlSession.commit();
            return row;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return 0;
    }

    @Override
    public int addOrderTrack(OrderTrack orderTrack) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            OrderMapper orderMapper=sqlSession.getMapper(OrderMapper.class);
            int row = orderMapper.addOrderTrack(orderTrack);
            return row;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return 0;
    }

    @Override
    public List<Order> getAllPendingOrders() {
        try {
            sqlSession=sqlSessionFactory.openSession();
            OrderMapper orderMapper=sqlSession.getMapper(OrderMapper.class);
            List<Order> orders=orderMapper.getAllPendingOrders();
            return orders;
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public int arrived(int orderId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            OrderMapper orderMapper=sqlSession.getMapper(OrderMapper.class);
            int row=orderMapper.arrived(orderId);
            sqlSession.commit();
            return row;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return 0;
    }
}
