package com.qbd.daoimp;

import com.qbd.dao.ShoesMapper;
import com.qbd.dao.ShoesUpdateMapper;
import com.qbd.pojo.Comment;
import com.qbd.pojo.GoodsDiscount;
import com.qbd.pojo.Shoes;

import com.qbd.pojo.ShoesType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ShoesMapperImp implements  ShoesMapper{
    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    SqlSession sqlSession;



    public List getAllShoes() {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoeMapper  =sqlSession.getMapper(ShoesMapper.class);
            List<Shoes> shoes =shoeMapper.getAllShoes();
            return shoes;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public List getHotShoes() {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoeMapper  =sqlSession.getMapper(ShoesMapper.class);
            List<Shoes> shoes =shoeMapper.getHotShoes();
            return shoes;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;

    }

    @Override
    public List getRecycleShoes() {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoeMapper  =sqlSession.getMapper(ShoesMapper.class);
            List<Shoes> shoes =shoeMapper.getRecycleShoes();
            return shoes;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public void reduceNum(int buynum, int goodsId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoeMapper  =sqlSession.getMapper(ShoesMapper.class);
            shoeMapper.reduceNum(buynum,goodsId);
            sqlSession.commit();//减少提交事务
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
    }

    @Override
    public void addNum(int addnum, int goodsId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoeMapper  =sqlSession.getMapper(ShoesMapper.class);
            shoeMapper.addNum(addnum,goodsId);
            sqlSession.commit();//增加提交事务
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
    }
//根据商品id查找鞋子
    @Override
    public Shoes getShoesById(int goodsId) {
        Shoes shoes=null;
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoeMapper  =sqlSession.getMapper(ShoesMapper.class);
            shoes= shoeMapper.getShoesById(goodsId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return shoes;
    }

    @Override
    public List<Comment> getCommentsByShoesId(int goodsId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoeMapper=sqlSession.getMapper(ShoesMapper.class);
            List<Comment> comments=shoeMapper.getCommentsByShoesId(goodsId);
            return comments;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public int addShoes(Shoes shoes) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoesMapper=sqlSession.getMapper(ShoesMapper.class);
            int row=shoesMapper.addShoes(shoes);
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
    public List<ShoesType> getAllTypes() {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoesMapper=sqlSession.getMapper(ShoesMapper.class);
            List<ShoesType> shoesTypes=shoesMapper.getAllTypes();
            return  shoesTypes;//返回鞋子的所有品牌
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public int addGoodsDiscount(GoodsDiscount goodsDiscount) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoesMapper=sqlSession.getMapper(ShoesMapper.class);
            int row=shoesMapper.addGoodsDiscount(goodsDiscount);
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
    public int pullOffShelves(int goodsId) {

        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoesMapper =sqlSession.getMapper(ShoesMapper.class);
            int row=shoesMapper.pullOffShelves(goodsId);
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
    public int onShelf(int goodsId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoesMapper =sqlSession.getMapper(ShoesMapper.class);
            int row=shoesMapper.onShelf(goodsId);
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
    public int updateShoes(Shoes shoes) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoesMapper=sqlSession.getMapper(ShoesMapper.class);
            int row=shoesMapper.updateShoes(shoes);
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
    public GoodsDiscount getGoodsDiscount(GoodsDiscount discount) {

        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoesMapper=sqlSession.getMapper(ShoesMapper.class);
            GoodsDiscount goodsDiscount=shoesMapper.getGoodsDiscount(discount);
            return goodsDiscount;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public int deleteGoodsDiscount(GoodsDiscount discount) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoesMapper=sqlSession.getMapper(ShoesMapper.class);
            int row=shoesMapper.deleteGoodsDiscount(discount);
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
    public int updateShoesNum(int number,int goodsId) {
        try {
            sqlSession=sqlSessionFactory.openSession();
            ShoesMapper shoesMapper=sqlSession.getMapper(ShoesMapper.class);
            int row=shoesMapper.updateShoesNum(number,goodsId);
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
