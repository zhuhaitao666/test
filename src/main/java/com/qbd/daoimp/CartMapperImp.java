package com.qbd.daoimp;

import com.qbd.dao.CartMapper;
import com.qbd.dao.ShoesMapper;
import com.qbd.pojo.Shoes;
import com.qbd.pojo.ShopCart;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository
public class CartMapperImp implements CartMapper {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    SqlSession sqlSession;
    int goodsId;

    @Override
    public int findType1(String color, String size) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            CartMapper cartMapper  =sqlSession.getMapper(CartMapper.class);
            goodsId=cartMapper.findType1(color,size);//查找对应的编号
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }

        return goodsId;
    }

    @Override
    public boolean addToCart(ShopCart shopCart) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            CartMapper cartMapper  =sqlSession.getMapper(CartMapper.class);
            boolean b=cartMapper.addToCart(shopCart);
            sqlSession.commit();
            sqlSession.close();
            return b;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public int deleteFromCart(int ShopCartId) {
        sqlSession=sqlSessionFactory.openSession();
        CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
        int row=cartMapper.deleteFromCart(ShopCartId);//删除影响的属性列
        sqlSession.commit();
        sqlSession.close();
        return row;//返回数值
    }

    @Override
    public List findAllCartRecords(int userId) {
        List<ShopCart> shopCarts=new ArrayList<ShopCart>();

        try {
            sqlSession=sqlSessionFactory.openSession();
            CartMapper cartMapper  =sqlSession.getMapper(CartMapper.class);
            shopCarts= cartMapper.findAllCartRecords(userId);//得到所有购物车中的记录
            return shopCarts;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return shopCarts;
    }

}
