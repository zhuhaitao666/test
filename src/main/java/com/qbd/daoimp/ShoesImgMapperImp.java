package com.qbd.daoimp;

import com.qbd.dao.ShoesImgMapper;
import com.qbd.pojo.ShoesImg;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShoesImgMapperImp implements ShoesImgMapper {
    @Autowired
    private SqlSessionFactory sqlsessionFactory;
    private SqlSession sqlSession;
    @Override
    public ShoesImg getShoesImg(Integer goodsImgId) {

        try {
            sqlSession=sqlsessionFactory.openSession();
            ShoesImgMapper shoesImgMapper=sqlSession.getMapper(ShoesImgMapper.class);
            ShoesImg shoesImg=shoesImgMapper.getShoesImg(goodsImgId);
            return shoesImg;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            sqlSession.close();
        }
        return null;
    }

    @Override
    public int addImg(ShoesImg shoesImg) {
        try {
            sqlSession=sqlsessionFactory.openSession();
            ShoesImgMapper shoesImgMapper=sqlSession.getMapper(ShoesImgMapper.class);
            int row=shoesImgMapper.addImg(shoesImg);
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
    public int updateImg(ShoesImg shoesImg) {
        try {
            sqlSession=sqlsessionFactory.openSession();
            ShoesImgMapper shoesImgMapper=sqlSession.getMapper(ShoesImgMapper.class);
            int row=shoesImgMapper.updateImg(shoesImg);//退一步越想越亏
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
