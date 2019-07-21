package com.qbd.dao;

import com.qbd.pojo.Shoes;
import com.qbd.pojo.ShoesImg;

public interface ShoesImgMapper {
    public ShoesImg getShoesImg(Integer goodsImgId);
    public int addImg(ShoesImg shoesImg);//插入图片
    public int updateImg(ShoesImg shoesImg);
}
