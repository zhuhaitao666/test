package com.qbd.controller;

import com.qbd.pojo.Shoes;
import com.qbd.service.Nav1Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/ShoesOnline")
public class Nav1Controller {

    @Autowired
    private Nav1Service nav1Service;

    @RequestMapping("/ClassificationNavigation")
    public String ClassificationNavigation(HttpServletRequest request,String kind){
        int goodsTypeId=nav1Service.getGoodsTypeIdByBrandName(kind);
        List<Shoes> shoes=nav1Service.getShoesByClass(goodsTypeId);
        request.getSession().setAttribute("allShoes",shoes);

        return "redirect:/ShoesOnline/toIndexByClass";
    }
    @RequestMapping("/LikeNameNavigation")
    public String LikeNameNavigation(HttpServletRequest request,String goodsName){
        System.out.println("接受参数"+goodsName);
        List<Shoes> shoes=nav1Service.getShoesBySearch(goodsName);
        for (Shoes s:shoes) {
            System.out.println("获得的鞋子:"+s);
        }
        request.getSession().setAttribute("allShoes",shoes);
        return "redirect:/ShoesOnline/toIndexByClass";
    }
}
