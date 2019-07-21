package com.qbd.controller;

import com.qbd.pojo.Comment;
import com.qbd.pojo.Shoes;
import com.qbd.service.ShoesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.print.Book;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/ShoesOnline")
public class ShoeDetailController {

    @Autowired
    private ShoesService shoesService;
    @RequestMapping("/detail")
    public String detail(HttpServletRequest request,Integer shoesId) {

        HttpSession session=request.getSession();
        List<Shoes> shoes=(List<Shoes>) session.getAttribute("allShoes");
        Shoes shoe=null;//详情的鞋子
        for (Shoes s:shoes) {
            if (s.getGoodsId()==shoesId){
                shoe=s;
            }
        }
        List <Comment> comments=shoesService.getCommentsByShoesId(shoesId);//获取该鞋子的所有评论
        session.setAttribute("comments",comments);//评论集合保存在session对象中
        session.setAttribute("s",shoe);
        session.removeAttribute("commentsN");
        session.removeAttribute("info");
        return "shoes/shoesIndex";
    }

    @RequestMapping("/detailN")
    public String detailN(HttpServletRequest request,int star) {

        HttpSession session=request.getSession();
        List <Comment>comments= (List<Comment>)session.getAttribute("comments");
        List <Comment> comments1=new ArrayList();
        if(star==5){
            for (Comment c:comments) {
                if (c.getStar()==5){
                    comments1.add(c);
                }
            }
            session.removeAttribute("info");
        }
        else if (star==4){
            for (Comment c:comments) {
                if (c.getStar()==4){
                    comments1.add(c);
                }
            }
            session.removeAttribute("info");
        }
        else if (star==1){
            for (Comment c:comments) {
                if (c.getStar()==1||c.getStar()==2||c.getStar()==3){
                    comments1.add(c);
                }
            }
            session.removeAttribute("info");
        }
        else{
            for (Comment c:comments) {
                if (c.getAddContent()!=null){
                    comments1.add(c);
                }
            }
            session.setAttribute("info","addJudge");
        }



        session.setAttribute("commentsN",comments1);//评论集合保存在session对象中

        return "shoes/shoesIndex";
    }
}
