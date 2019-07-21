package com.qbd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/ShoesOnline")
public class LogoutController {
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session= request.getSession();
        session.removeAttribute("phone");//删除session手机号
        session.removeAttribute("userId");
        return "index";
    }
    @RequestMapping("/logout1")
    public String logout1(HttpServletRequest request) {
        HttpSession session= request.getSession();
        session.removeAttribute("phone");//删除session手机号
        session.removeAttribute("userName");
        session.removeAttribute("userId");
        return "manager/login1";
    }
}
