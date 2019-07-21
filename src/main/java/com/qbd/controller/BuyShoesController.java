package com.qbd.controller;

import com.qbd.daoimp.UserMapperImp;
import com.qbd.pojo.*;
import com.qbd.service.BuyShoesService;
import com.qbd.service.MyCartService;
import com.qbd.service.SettleService;
import com.qbd.service.UserService;
import com.qbd.utils.CountTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/ShoesOnline")
public class BuyShoesController {

    @Autowired
    private BuyShoesService buyShoesService;
    @Autowired
    private MyCartService myCartService;
    @Autowired
    private SettleService settleService;
    @Autowired
    private UserService userService;


    @RequestMapping("/addShoesToCart")
    public String addToCart(String color, String size,Integer buyNum, HttpServletRequest request)
    {
        HttpSession session=request.getSession();
        Shoes shoes=(Shoes) session.getAttribute("s");
        if(session.getAttribute("userId")!=null){
            int userId=(int)session.getAttribute("userId");
            buyShoesService.addToCart(shoes,color,size,userId, shoes.getGoodsId(),buyNum);//添加到购物车了
        }
        return "shoes/shoesIndex";
    }
    @RequestMapping("/toCart")
    public String toCart(HttpServletRequest request)
    {
        HttpSession session=request.getSession();
        if(session.getAttribute("userId")!=null){
            int userId=(int)session.getAttribute("userId");
            List <ShopCart>records=myCartService.getAllCartRecords(userId);
            request.setAttribute("cartShoes",records);
        }
        return "mycart";
    }
    @RequestMapping("/deleteFromCart")
    public String deleteFromCart(HttpServletRequest request, HttpServletResponse response, int shopCartId,int addNum,int goodsId) throws IOException {

        System.out.println("控制层想要添加的数量"+addNum+"到商品"+goodsId);

        int row=buyShoesService.deleteFormCart(shopCartId,addNum,goodsId);
        if (row!=0){
            return "redirect:/ShoesOnline/toCart";
        }
        return "404";
    }
    @RequestMapping("/toSettle")//去结算页
    public String toSettle(HttpServletRequest request, String tempString)
    {
        HttpSession session=request.getSession();//得到用户id
        int userId=(int)session.getAttribute("userId");

        List <ShopCart>records=myCartService.getAllCartRecords(userId);
        session.setAttribute("tempString",tempString);//已选择的商品ID保存在Session缓存中
        List<ShopCart>hadSelected=new ArrayList<ShopCart>();//已选的的商品集合

        List<Coupon> coupons=settleService.getSelfCoupons(userId);
        session.setAttribute("coupons",coupons);//已领取的优惠券保存在Session缓存中
        String [] temp =tempString.split(",");
        int [] list=new int[20];
        for (int i=0;i<temp.length;i++)
        {
            list[i]=Integer.parseInt(temp[i]);
            hadSelected.add(records.get(list[i]));

        }
        //购物车选取的商品
        session.setAttribute("hadSelected",hadSelected);

        //能够使用的优惠券
        List<Coupon> canUseCoupons =new ArrayList<Coupon>();
        for (Coupon c:coupons) {
            int n=0;//商品均可使用该优惠券则显示该优惠券
            double total=0.0;//总价要超过优惠券的面值
            for (ShopCart shopCart:hadSelected) {

                GoodsDiscount goodsDiscount=settleService.canUseCoupons(c.getCouponId(),shopCart.getGoodsId());
                if (goodsDiscount!=null) {
                    n++;
                    total+=shopCart.getTotal();
                }
            }

            if(n==hadSelected.size()&&total>c.getFull()&&c.getHadUsed()!=1){
                canUseCoupons.add(c);
            }
        }
        session.setAttribute("canUseCoupons",canUseCoupons);

        //获取个人积分
        int points=userService.getPoints(userId);
        session.setAttribute("points",points);

        return "settle";
    }
    @RequestMapping("/toSettleN")//不是第一次去结算页
    public String toSettleN(HttpServletRequest request)
    {
        HttpSession session=request.getSession();
        int userId=(int)session.getAttribute("userId");
        List <ShopCart>records=myCartService.getAllCartRecords(userId);
        String tempString=(String) session.getAttribute("tempString");//从session中拿出来
        String [] temp =tempString.split(",");
        int [] list=new int[30];
        for (int i=0;i<temp.length;i++)
        {
            list[i]=Integer.parseInt(temp[i]);
//            System.out.println(list[i]);
        }

        List<Coupon> coupons=settleService.getSelfCoupons(userId);//更新优惠券
        session.setAttribute("coupons",coupons);//已领取的优惠券保存在Session缓存中



        return "settle";
    }
    @RequestMapping("/getCoupon")//用户获取优惠券
    public String getCoupon(HttpServletRequest request, Coupon coupon){
        List<Coupon> coupons =(List<Coupon>)request.getSession().getAttribute("coupons");
        for (Coupon coupon1:coupons)
        {
            if (coupon1.getCouponId()==coupon.getCouponId()){
                request.getSession().setAttribute("hadGet","hadGet");
                System.out.println("该优惠券已经领过");
                return "redirect:/ShoesOnline/toSettleN";//领过了直接返回
            }
        }

        Discount discount =settleService.getDisCountById(coupon.getCouponId());//查询优惠券对象
        coupon.setValue(discount.getValue());//价值
        coupon.setName(discount.getDiscountType());//名称
        Date startTime=new Date();
        coupon.setStartTime(startTime);//开始时间
        coupon.setUserId((int)request.getSession().getAttribute("userId"));//拥有者
        CountTime countTime=new CountTime();
        coupon.setEndTime(countTime.getEndTime(startTime,10));//十天后的时间
        coupon.setFull(discount.getFull());

        settleService.getCoupon(coupon);//个人存储优惠券

        return "redirect:/ShoesOnline/toSettleN";
    }

    @RequestMapping("/createOrder")
    public  String createOrder(HttpServletRequest request,double totalPrice,Integer couponId,Integer points){
        HttpSession session=request.getSession();
        List<ShopCart>hadSelected=(List<ShopCart>)session.getAttribute("hadSelected");
        int userId=(int)session.getAttribute("userId");
        double value=0.0;
        int getpoints=0;
        Order order=new Order();
        if(couponId!=null)
        {
            Coupon coupon=settleService.getCouponById(couponId);
            settleService.updateCouponStatus(couponId);
            value=totalPrice-coupon.getValue();
        }
        else{
            value=totalPrice;
        }
        if (points!=null){

            int temp=points%100;//输入值剩余积分
            int price=points/100;//可兑换金钱
            int point=points-temp;
            order.setUsePoints(point);
            settleService.reducePoints(point,userId);
            value=totalPrice-price;
        }

        order.setUserId(userId);
        order.setCreateTime(new Date());
        order.setStatus(0);
        order.setValue(value);
        settleService.createOrder(order);

        System.out.println("生成的订单:"+order);

        for (ShopCart s:hadSelected) {
            System.out.println("想要结算的商品"+s);
            Ordergoods ordergoods=new Ordergoods();
            ordergoods.setOrderId(order.getOrderId());
            ordergoods.setGoodsId(s.getGoodsId());
            ordergoods.setNumber(s.getBuyNum());
            System.out.println("预生成的订单"+ordergoods);
            settleService.createOrderGoods(ordergoods);//生成订单项
            buyShoesService.deleteFormCart(s.getShopCartId());//删除购物车中的记录
            System.out.println("获得积分:"+s.getShoes().getGivePoints());
            settleService.getPoints(s.getShoes().getGivePoints(),userId);//增加积分
        }


        return "redirect:/ShoesOnline/toCart";
    }
}
