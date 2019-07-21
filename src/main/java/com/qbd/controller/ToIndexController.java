package com.qbd.controller;

import com.qbd.dao.ShoesMapper;

import com.qbd.daoimp.ShoesMapperImp;
import com.qbd.pojo.Shoes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/ShoesOnline")
public class ToIndexController {
    @Autowired
    private ShoesMapperImp shoesMapper;
    @RequestMapping("/toIndex")
    public String toIndex(HttpServletRequest request)
    {
        HttpSession session=request.getSession();
        List<Shoes> shoes= shoesMapper.getAllShoes();
        request.getSession().setAttribute("allShoes",shoes);

        List<Shoes> shoes1=shoesMapper.getHotShoes();
        request.getSession().setAttribute("hotShoes",shoes1);
        return "index";
    }
    @RequestMapping("/toIndexByClass")
    public String toIndexByClass(HttpServletRequest request)
    {
        HttpSession session=request.getSession();
        List<Shoes> shoes1=shoesMapper.getHotShoes();
        request.getSession().setAttribute("hotShoes",shoes1);
        return "index";
    }
}
