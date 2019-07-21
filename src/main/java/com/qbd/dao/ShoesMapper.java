package com.qbd.dao;

import com.qbd.pojo.Comment;
import com.qbd.pojo.GoodsDiscount;
import com.qbd.pojo.Shoes;
import com.qbd.pojo.ShoesType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShoesMapper {
    public List getAllShoes();
    public List getHotShoes();
    public List getRecycleShoes();
    public void reduceNum(@Param("buynum") int buynum,@Param("goodsId")int goodsId); //减少一定数量的鞋子
    public void addNum( @Param("addnum") int addnum,@Param("goodsId")int goodsId);//增加一定数量的鞋子
    public Shoes getShoesById(int goodsId);
    public List<Comment>  getCommentsByShoesId(int goodsId);
    public int addShoes(Shoes shoes);//添加鞋子
    public List<ShoesType> getAllTypes();//查看鞋子的类型
    public int addGoodsDiscount(GoodsDiscount goodsDiscount);//添加鞋子和优惠券的依赖
    public int pullOffShelves(int goodsId);//下架
    public int onShelf(int goodsId);//商品上架
    public int updateShoes(Shoes shoes);//更改商品信息
    public GoodsDiscount getGoodsDiscount(GoodsDiscount discount);
    public int deleteGoodsDiscount(GoodsDiscount discount);//删除优惠券信息
    public int updateShoesNum(@Param("number") int number,@Param("goodsId") int goodsId);
}
