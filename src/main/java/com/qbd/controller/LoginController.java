package com.qbd.controller;


import com.qbd.daoimp.ShoesMapperImp;
import com.qbd.pojo.Shoes;
import com.qbd.pojo.User;
import com.qbd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/ShoesOnline")
public class LoginController {

    @Autowired
    private UserService userService;
    @Autowired
    private ShoesMapperImp shoesMapper;
    @RequestMapping("/login")
    public  String login(String phone, String password, HttpServletRequest request){
        HttpSession session=request.getSession();
        User user =userService.login(phone, password);
        if (user!=null)
        {
            List<Shoes> shoes=shoesMapper.getAllShoes();
            session.setAttribute("phone",phone);//登录以后手机号保存在session中
            session.setAttribute("userId",user.getUserid());//登录后保存id在session缓存中
            session.setAttribute("allShoes",shoes);
            List<Shoes> shoes1=shoesMapper.getHotShoes();
            request.getSession().setAttribute("hotShoes",shoes1);
            for (Shoes s:shoes) {
                System.out.println(s);
            }
            return "index";
        }
        else
        {
            request.setAttribute("error","手机号或者密码错误");
        }
        return  "login";
    }
    @RequestMapping("/register")
    public String register(User user){
        if(user.getName()==""){
            System.out.println("试图通过访问控制器来注册空用户!");
            return "register";//防止通过访问控制器路径直接注册
        }

        if (userService.register(user)){
            return "index";
        }
        return "register";
    }
    @RequestMapping("/login1")
    public ModelAndView login1(String phone, String password, HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
        HttpSession session=request.getSession();
        User user =userService.login1(phone, password);

        if (user!=null)
        {
            List<Shoes> shoes=shoesMapper.getAllShoes();
            session.setAttribute("phone",phone);//登录以后手机号保存在session中
            session.setAttribute("userId",user.getUserid());//登录后保存id在session缓存中
            session.setAttribute("userName",user.getName());
            session.setAttribute("allShoes",shoes);
            List<Shoes> shoes1=shoesMapper.getHotShoes();
            request.getSession().setAttribute("hotShoes",shoes1);
            List<Shoes> shoes2=shoesMapper.getRecycleShoes();
            session.setAttribute("recycleShoes",shoes2);
            modelAndView.setViewName("manager/slide");//返回视图名称
        }
        else
        {
            modelAndView.addObject("error","手机号或者密码错误");
            modelAndView.setViewName("manager/login1");//返回视图名称
        }
        return modelAndView;
    }
}
