package com.qbd.daoimp;

import com.qbd.dao.CartMapper;
import com.qbd.dao.SettleMapper;
import com.qbd.pojo.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SettleMapperImp implements SettleMapper {
    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    SqlSession sqlSession;
    @Override

    public int getCoupon(Coupon coupon) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SettleMapper settleMapper=sqlSession.getMapper(SettleMapper.class);
            int row=settleMapper.getCoupon(coupon);//领取优惠券
            sqlSession.commit();//提交事务
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return 0;
    }

    @Override
    public Coupon getCouponById(int couponId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SettleMapper settleMapper=sqlSession.getMapper(SettleMapper.class);
            Coupon coupon=settleMapper.getCouponById(couponId);
            return coupon;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }

        return null;
    }

    @Override
    public Discount getDisCountById(int couponId) {

        try {
            sqlSession=sqlSessionFactory.openSession();
            SettleMapper settleMapper=sqlSession.getMapper(SettleMapper.class);
            Discount discount=settleMapper.getDisCountById(couponId);
            sqlSession.close();
            return discount;//返回查询的折扣优惠券对象
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(sqlSession!=null)
            {
                sqlSession.close();
            }
        }
        return null;
    }

    @Override
    public List<Coupon> getSelfCoupons(int userId) {

        try {
            sqlSession=sqlSessionFactory.openSession();
            SettleMapper settleMapper=sqlSession.getMapper(SettleMapper.class);
            List <Coupon> coupons=settleMapper.getSelfCoupons(userId);//得到优惠券集合
            sqlSession.close();
            return coupons;

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(sqlSession!=null)
            {
                sqlSession.close();
            }
        }

        return null;
    }

    @Override
    public GoodsDiscount canUseCoupons(int goodsDiscountId, int goodsId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SettleMapper settleMapper=sqlSession.getMapper(SettleMapper.class);
            GoodsDiscount goodsDiscount= settleMapper.canUseCoupons(goodsDiscountId,goodsId);
            return goodsDiscount;//返回对象
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(sqlSession!=null)
            {
                sqlSession.close();
            }
        }
        return null;
    }

    @Override
    public void updateCouponStatus(int couponId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SettleMapper settleMapper=sqlSession.getMapper(SettleMapper.class);
            settleMapper.updateCouponStatus(couponId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(sqlSession!=null)
            {
                sqlSession.close();
            }
        }
    }

    @Override
    public int connectOrderCoupon(int orderId, int couponId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SettleMapper settleMapper=sqlSession.getMapper(SettleMapper.class);
            int row=settleMapper.connectOrderCoupon(orderId,couponId);
            sqlSession.commit();
            return row;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(sqlSession!=null)
            {
                sqlSession.close();
            }
        }
        return 0;
    }

    @Override
    public int createOrder(Order order) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SettleMapper settleMapper=sqlSession.getMapper(SettleMapper.class);
            int row=settleMapper.createOrder(order);
            sqlSession.commit();
            return row;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(sqlSession!=null)
            {
                sqlSession.close();
            }
        }
        return 0;
    }

    @Override
    public int createOrderGoods(Ordergoods ordergoods) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SettleMapper settleMapper=sqlSession.getMapper(SettleMapper.class);
            int row=settleMapper.createOrderGoods(ordergoods);
            sqlSession.commit();
            return row;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(sqlSession!=null)
            {
                sqlSession.close();
            }
        }
        return 0;
    }

    @Override
    public int getPoints(int addPoints, int userId) {

        try {
            sqlSession=sqlSessionFactory.openSession();
            SettleMapper settleMapper=sqlSession.getMapper(SettleMapper.class);
            int row =settleMapper.getPoints(addPoints,userId);
            sqlSession.commit();
            return row;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(sqlSession!=null)
            {
                sqlSession.close();
            }
        }
        return 0;
    }

    @Override
    public int reducePoints(int reducePoints, int userId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SettleMapper settleMapper=sqlSession.getMapper(SettleMapper.class);
            int r =settleMapper.reducePoints(reducePoints, userId);
            sqlSession.commit();
            return r;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(sqlSession!=null)
            {
                sqlSession.close();
            }
        }
        return 0;
    }

}
