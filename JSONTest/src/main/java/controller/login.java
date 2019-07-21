package controller;

import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pojo.User;

@Controller
public class login {
    @RequestMapping("/login")
    public ModelAndView login(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("index");
        User user=new User();
        user.setUserId(1);
        user.setUserName("朱海涛");
        user.setUserAge(20);
        JSONObject objectUser=JSONObject.fromObject(user);
        modelAndView.addObject(objectUser);
        return modelAndView;
    }
}
