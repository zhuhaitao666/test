package com.qbd.controller;

import com.qbd.dao.ShoesMapper;
import com.qbd.pojo.*;
import com.qbd.service.OrderService;
import com.qbd.service.ShoesService;
import com.qbd.service.UserService;
import com.qbd.utils.CountTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ShoesOnline")
public class ShoesController {

    @Autowired
    private ShoesService shoesService;

    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @RequestMapping("/addShoes")
    public String addShoes(Shoes shoes, int day, String promoteDay,
                           String goodsDiscountId,HttpServletRequest request,
                           @RequestParam("pic") MultipartFile file, HttpSession session)
    {
        String Filename=file.getOriginalFilename();//得到文件名
        String dirPath="D:/IDE Programs/shop/src/main/webapp/images/";//绝对路径
        try {
            file.transferTo(new File(dirPath+Filename));//上传文件
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        ShoesImg shoesImg=new ShoesImg();
        shoesImg.setPath("/images/"+Filename);
        shoesImg.setUploadTime(new Date());
        shoesImg.setUploader((String) session.getAttribute("userName"));

        Date date=new Date();
        shoes.setOnTime(date);
        Date offtime= CountTime.getEndTime(date,day);//下架时间
        shoes.setOffTime(offtime);
        shoes.setIsOnSale(1);//正在出售
        if (shoes.getIsPromote()==1){
            Date promoteDate=new Date();
            Date promoteEndTime=CountTime.getEndTime(promoteDate,Integer.parseInt(promoteDay));
            shoes.setPromoteStartTime(promoteDate);
            shoes.setPromoteEndTime(promoteEndTime);
        }
//        System.out.println("传递过来的商品图片信息"+shoesImg);
//        System.out.println("传递过来的商品信息"+shoes);
//        System.out.println("传递来来的优惠券Id"+goodsDiscountId);

        if (shoesService.addShoes(shoes, shoesImg,goodsDiscountId)){
            request.setAttribute("information","addShoes");
            List<ShoesType> shoesTypes=shoesService.getAllTypes();
            request.setAttribute("shoesTypes",shoesTypes);
            return "forward:/jsp/manager/slide.jsp";
        }
        return "404";
    }
    @RequestMapping("/toMain")
    public String toMain(String information, HttpServletRequest request
            ,HttpSession session,String goodsId,@ModelAttribute("updateShoes") Shoes shoes1){

        if (information!=null){
            System.out.println("请求转发转发信息"+information);
            request.setAttribute("information",information);//请求转发客户端跳转
            if (information.equals("updateShoes")) {
                request.setAttribute("updateShoes",shoes1);//如果是更新操作，设置request属性值，用于显示部分属性
            }
            else if(information.equals("allUsers")){
                List<User>users=userService.getAllUsers();
                request.setAttribute("users",users);
            }
            else if (information.equals("pendingStation")){
                List<Order> orders=orderService.getAllPendingShipmentOrders();
                request.setAttribute("bePendingOrders",orders);
            }
            else if (information.equals("orderStation")){
                List <Order> orders=orderService.getAllPendingOrders();
                request.setAttribute("orderList",orders);
            }
        }
        List<ShoesType> shoesTypes=shoesService.getAllTypes();
        request.setAttribute("shoesTypes",shoesTypes);
        List<Shoes> shoes2=shoesService.getRecycleShoes();
        session.setAttribute("recycleShoes",shoes2);
        List<Shoes> shoes=shoesService.getAllBooks();
        session.setAttribute("allShoes",shoes);

        return "forward:/jsp/manager/slide.jsp";

    }
    @RequestMapping("/pullOff")
    public String pullOffShelves(int goodsId) {
        if (shoesService.pullOffShelves(goodsId)==1)
        {
            return "redirect:/ShoesOnline/toMain";
        }
        return "404";
    }
    @RequestMapping("/onSale")
    public String onShelf(int goodsId,HttpServletRequest request,String information,HttpSession session){

        request.setAttribute("information",information);//请求转发客户端跳转
        if (shoesService.onShelves(goodsId)==1){
            List<Shoes> shoes2=shoesService.getRecycleShoes();
            session.setAttribute("recycleShoes",shoes2);
            return "forward:/jsp/manager/slide.jsp";
        }
        return "404";
    }

    @RequestMapping("/updateA")
    public String updateShoes(@ModelAttribute("updateShoes") Shoes shoes,String information,
                              String day, String promoteDay, String goodsDiscountId,HttpServletRequest request,
                              @RequestParam("pic") MultipartFile file, HttpSession session){
        System.out.println("修改后information:"+information);
        request.setAttribute("information",information);//请求转发客户端跳转

        String Filename=file.getOriginalFilename();//得到文件名
        if(file!=null&&!Filename.equals("")){
            String dirPath="D:/IDE Programs/shop/src/main/webapp/images/";//绝对路径
            shoes.getShoesImg().setPath("/images/"+Filename);//重新设置路径
            try {
                file.transferTo(new File(dirPath+Filename));//上传文件
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            //此处重新更改商品图片信息
            shoesService.updateImg(shoes.getShoesImg());
        }

//        Date date=new Date();
//        shoes.setOnTime(date);
//        Date offtime= CountTime.getEndTime(date,Integer.parseInt(day));//下架时间
//        shoes.setOffTime(offtime);
        shoes.setIsOnSale(1);//正在出售
        if (shoes.getIsPromote()==1){
            Date promoteDate=new Date();
            Date promoteEndTime=CountTime.getEndTime(promoteDate,Integer.parseInt(promoteDay));
            shoes.setPromoteStartTime(promoteDate);
            shoes.setPromoteEndTime(promoteEndTime);
        }
        shoesService.updateShoes(shoes,goodsDiscountId);
        List<ShoesType> shoesTypes=shoesService.getAllTypes();
        request.setAttribute("shoesTypes",shoesTypes);
        return "forward:/jsp/manager/slide.jsp";
    }
    @ModelAttribute
    public void start(Map<String,Object> map,HttpServletRequest request,String goodsId){
        if (goodsId!=null)
        {
            Shoes  shoes=shoesService.getShoesById(Integer.parseInt(goodsId));
            map.put("updateShoes",shoes);
            map.put("updateId",goodsId);
        }
    }
    @RequestMapping("/managerShoesNum")
    public String updateNum(String information,HttpServletRequest request,int goodsId,int Num,HttpSession session){
        request.setAttribute("information",information);//必须
        if(shoesService.updateShoesNum(Num,goodsId)==1){
            List<Shoes> shoes=shoesService.getAllBooks();
            session.setAttribute("allShoes",shoes);
            return "forward:/jsp/manager/slide.jsp";
        }
        return "404";
    }
}
