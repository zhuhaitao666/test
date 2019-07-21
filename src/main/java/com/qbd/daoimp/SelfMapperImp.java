package com.qbd.daoimp;

import com.qbd.dao.SelfMapper;
import com.qbd.pojo.Comment;
import com.qbd.pojo.Order;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SelfMapperImp  implements SelfMapper {


    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    SqlSession sqlSession;
    @Override
    public List<Order> getOrderByUserId(int userId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SelfMapper selfMapper=sqlSession.getMapper(SelfMapper.class);//获得代理实现类
            List<Order> orders=selfMapper.getOrderByUserId(userId);
            return orders;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public List<Order> getBeShippedOrder(int userId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SelfMapper selfMapper=sqlSession.getMapper(SelfMapper.class);//获得代理实现类
            List<Order> orders=selfMapper.getBeShippedOrder(userId);
            return orders;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public List<Order> getHadGetted(int userId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SelfMapper selfMapper=sqlSession.getMapper(SelfMapper.class);//获得代理实现类
            List<Order> orders=selfMapper.getHadGetted(userId);
            return orders;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public int judge(Comment comment) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SelfMapper selfMapper=sqlSession.getMapper(SelfMapper.class);//获得代理实现类
            int result=selfMapper.judge(comment);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return 0;
    }

    @Override
    public Comment findJudgementByOrderIdAndGoodsId(int orderId, int goodsId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SelfMapper selfMapper=sqlSession.getMapper(SelfMapper.class);//获得代理实现类
           Comment comment= selfMapper.findJudgementByOrderIdAndGoodsId(orderId,goodsId);
           if (comment!=null){
               return comment;
           }
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public int addJudge(Comment comment) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SelfMapper selfMapper=sqlSession.getMapper(SelfMapper.class);//获得代理实现类
            int result= selfMapper.addJudge(comment);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return 0;
    }

    @Override
    public Comment getCommentById(int commentId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            SelfMapper selfMapper=sqlSession.getMapper(SelfMapper.class);//获得代理实现类
            Comment comment=selfMapper.getCommentById(commentId);
            return comment;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }
}
