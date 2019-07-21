package com.qbd.controller;

import com.qbd.pojo.User;
import com.qbd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/ShoesOnline")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/deleteUser")
    public String deleteUser(int userId,String information,HttpServletRequest request){
        if (userService.deleteUserByUserId(userId))
        {
            request.setAttribute("information",information);
            List<User> users=userService.getAllUsers();
            request.setAttribute("users",users);
            return "forward:/jsp/manager/slide.jsp";
        }
        return "404";
    }
}
