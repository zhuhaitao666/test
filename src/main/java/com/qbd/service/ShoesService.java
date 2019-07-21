package com.qbd.service;


import com.qbd.dao.ShoesImgMapper;
import com.qbd.dao.ShoesUpdateMapper;
import com.qbd.daoimp.ShoesMapperImp;
import com.qbd.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class ShoesService {
    @Autowired
    private TransactionTemplate tt;
    @Autowired
    private ShoesMapperImp shoesMapperImp;
    @Autowired
    private ShoesImgMapper shoesImgMapper;
    @Autowired
    private ShoesUpdateMapper shoesUpdateMapper;
    List shoes=new ArrayList();
    public List getAllBooks(){
        shoes=shoesMapperImp.getAllShoes();
        return shoes;
    }
    public List getHotShoes(){
        shoes=shoesMapperImp.getHotShoes();
        return shoes;
    }
    public List getRecycleShoes() {
        shoes=shoesMapperImp.getRecycleShoes();
        return shoes;
    }
    public Shoes getShoesById(int goodsId){
        return shoesMapperImp.getShoesById(goodsId);
    }

    public List<Comment> getCommentsByShoesId(int goodsId){
        return shoesMapperImp.getCommentsByShoesId(goodsId);
    }
    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public boolean addShoes(Shoes shoes, ShoesImg shoesImg,String goodsDiscountId){


        shoesImgMapper.addImg(shoesImg);//添加图片记录
        System.out.println("想要添加的图片记录"+shoesImg);
        shoes.setGoodsImgId(shoesImg.getGoodsImgId());//添加商品记录主键回显
        shoesMapperImp.addShoes(shoes);//添加商品。主键回显
        System.out.println("想要添加的鞋子"+shoes);

        if (goodsDiscountId!=null){//选择了优惠券
            String [] goodsDiscountIds=goodsDiscountId.split(",");//通过逗号划分
            for(int i=0;i<goodsDiscountIds.length;i++){
                GoodsDiscount goodsDiscount=new GoodsDiscount();
                goodsDiscount.setGoodsDiscountId(Integer.parseInt(goodsDiscountIds[i]));
                goodsDiscount.setGoodsId(shoes.getGoodsId());
                shoesMapperImp.addGoodsDiscount(goodsDiscount);
                System.out.println("优惠券联系"+goodsDiscount);
            }
        }

        return true;
    }

    public List<ShoesType> getAllTypes() {
        return shoesMapperImp.getAllTypes();
    }

    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int pullOffShelves(int goodsId){
        return shoesMapperImp.pullOffShelves(goodsId);
    }

    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int onShelves(int goodsId){
        return shoesMapperImp.onShelf(goodsId);
    }

    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int updateImg(ShoesImg shoesImg){
        return shoesImgMapper.updateImg(shoesImg);
    }

    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public boolean updateShoes(Shoes shoes,String goodsDiscountId){
        shoesMapperImp.updateShoes(shoes);//更改鞋子的信息
        if (goodsDiscountId!=null){//选择了优惠券
            String [] goodsDiscountIds=goodsDiscountId.split(",");//通过逗号划分
            for(int i=0;i<goodsDiscountIds.length;i++){
                GoodsDiscount goodsDiscount=new GoodsDiscount();
                goodsDiscount.setGoodsDiscountId(Integer.parseInt(goodsDiscountIds[i]));
                goodsDiscount.setGoodsId(shoes.getGoodsId());
                if(shoesMapperImp.getGoodsDiscount(goodsDiscount)==null)
                {
                    shoesMapperImp.addGoodsDiscount(goodsDiscount);
                }
                else{

                }

            }
        }

        return true;
    }

    @Transactional(isolation= Isolation.REPEATABLE_READ,propagation= Propagation.REQUIRED,readOnly=false)
    public int updateShoesNum(int number,int goodsId) {
        return shoesMapperImp.updateShoesNum(number,goodsId);
    }
}
