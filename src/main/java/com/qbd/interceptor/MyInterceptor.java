package com.qbd.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MyInterceptor implements HandlerInterceptor{
    //在调用业务方法之前调用
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        if(request.getSession().getAttribute("userId")==null)
        {
            request.getSession().setAttribute("msg", "请先登录");
            response.getWriter().println("<script>top.location.href='/ShoesOnline/toIndex';</script>");
            return false;
        }
        return true;
    }
    //在调用业务方法之后，渲染视图之前调用
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
//        System.out.println("在调用业务方法之后，渲染视图之前调用");
    }
    //在渲染视图之后调用
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    }
}
