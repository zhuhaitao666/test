<%@ page import="com.qbd.pojo.Coupon" %>
<%@ page import="java.util.List" %>
<%@ page import="com.qbd.pojo.ShopCart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>结算页</title>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        .center{
            width: 70%;
            height: 90%;
            position: relative;
            left: 15%;
            top: 10%;
            /*background-color: #cfcfcf;*/
        }
        hr{
           border-color:red;
            border-style: dashed;
        }
        .context{
            display: none;
            height: 200px;
            width: 100%;
            border-top: 1px solid #8e8e8e;
            border-bottom: 1px solid #8e8e8e;
        }
        .active{
            background-color: yellow;
        }
        .get{
            position: absolute;
            left: 450px;
            top: 430px;
        }
        .get a{
            background-color: red;
            width: 20px;height: 20px;
            text-decoration: none;
            margin-right: 140px;
        }

        .cb{
            background-color: red;
            height:30px;
            background-image: url("/images/coupon1.jpg");

        }
        span{

            width: 30px;
            background-color: #895d23;
            height:30px;
            display: inline-block;
        }
        .form1 span input{
            width: 30px;
            height: 30px;
            border-radius: 100%;
            vertical-align: middle;
            content: '';
        }
        b{
            border: dashed 2px;
            background-color:red;
        }
        .coupon{
            border:2px;
            border-style: solid;
            display: inline-block;
            width: 18%;
        }
        table tr td img{
            width: 50px;
            height: 50px;
        }
        .submitButton{
            width: 80px;
            height: 40px;
            background-color: red;
            float: right;
        }
        .CouponMain{
            text-align: center;
            width: 25%;
            height: 60px;
            background-image:url("/images/coupon.jpg");
            line-height: 60px;
        }
    </style>
</head>
<body>
    <%
       List<Coupon> coupons=(List<Coupon>)session.getAttribute("coupons");//个人拥有的优惠券
         List<Coupon> canUseCoupons=(List<Coupon>)session.getAttribute("canUseCoupons");
       List<ShopCart> hadSelected= (List<ShopCart>)session.getAttribute("hadSelected");
       double totalPrice=0.0;//结算总价
       String hadGet=(String) session.getAttribute("hadGet");
    %>

    <div class="center">
        <h3 style="color: #101010">结算页</h3>
        <div class="getMain">
            <img src="/images/settlelogo.png"  style="width: 100px; height: 100px;">
            <div class="get">
                <%
                    for(int i=1;i<=3;i++)
                    {

                %>
                  <a href="${pageContext.request.contextPath}/ShoesOnline/getCoupon?couponId=<%=i%>" onclick="on();">点击领取</a>
                <%
                    }
                %>

            </div>
        </div>

        <hr>
        <img src="/images/1.png" alt="">

        <table>
            <tr width="23" class="th">

                <td width="20%">图片</td>
                <td width="20%">商品名称</td>
                <td width="30%">商品描述</td>
                <td width="10%">单价</td>
                <td width="10%">数量</td>
                <td width="5%">小计</td>

            </tr>
            <%
                for (ShopCart shopCart:hadSelected)
                {
                    totalPrice+=shopCart.getTotal();
            %>

            <tr class="oneRecord">
                <td><img src="<%=shopCart.getShoes().getShoesImg().getPath()%>"/></td>
                <td><%=shopCart.getShoes().getGoodsName()%></td>
                <td><%=shopCart.getShoes().getDesc()%></td>
                <td>￥
                    <%
                        if (shopCart.getShoes().getIsPromote()==1)
                        {
                    %>
                    <%=shopCart.getShoes().getPromotePrice()%>
                    <%  }else{
                    %>
                    <%=shopCart.getShoes().getShopPrice()%>
                    <%
                        }
                    %>
                </td>
                <td>
                    <%=shopCart.getBuyNum()%>
                </td>
                <td>
                    <%=shopCart.getTotal()%>
                </td>
            </tr>

            <%
                }
            %>

        </table>
        总计：￥<input type="text" class="price" value="<%=totalPrice%>" style="border-style: none;background-color: ghostwhite" size="10" disabled/>
        <p>已领取优惠券</p>
        <%
            for (Coupon coupon:coupons)
            {
        %>
            <p class="CouponMain"><%=coupon.getName()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                面值:<%=coupon.getValue()%>&nbsp;<%if(coupon.getHadUsed()==1){%><strong>已使用</strong><%}else{%>待使用<%}%></p>
        <br />
        <%
            }
        %>
        <div class="wrapper">
            <button class="active">可用优惠券</button>
            <button>积分</button>
            <button>其他</button>
            <div class="context" style="display: block;">
                <form class="form1" action="${pageContext.request.contextPath}/ShoesOnline/createOrder" method="get">

                        <%
                            for (Coupon coupon:canUseCoupons)
                            {
                        %>
                            <div class="coupon">
                            <span><input name="couponId" type="radio" class="couponId"  value="<%=coupon.getCouponId()%>"
                                      onclick="selectRadio();" /></span>
                            <b><%=coupon.getName()%>面值:<%=coupon.getValue()%></b>
                            </div>
                        <%
                            }
                        %>
                         <input name="totalPrice" type="hidden" value="<%=totalPrice%>">
                    <br /><br /><br /><input class="submitButton" type="submit" value="支付">

                </form>
            </div>
            <div class="context">
                <form action="${pageContext.request.contextPath}/ShoesOnline/createOrder" class="form2" onsubmit="textbox()"><br />
                    <p style="font-size: 20px;color: #9d0000">注:100积分可减1元</p>
                    拥有积分:<input class="havePoints"  style="border-style: none" type="text" value="<%=session.getAttribute("points")%>" disabled/>
                    使用积分:<input name="points" class="txt" type="text"/>
                    <input name="totalPrice" type="hidden" value="<%=totalPrice%>">
                    <input class="submitButton" type="submit" value="支付">
                </form>
            </div>
            <div class="context">暂无</div>
        </div>


        <script type="text/javascript">
            var btn=document.getElementsByTagName('button');
            var div=document.getElementsByClassName('context');
            for (var i=0;i<btn.length;i++) {
                (function(i){
                    btn[i].onclick=function(){
                            for ( var j=0;j<btn.length;j++) {
                            btn[j].className="";//所有按钮的className名字为空，样式消失
                            div[j].style.display="none";
                        }
                        this.className="active";//点击那个按钮，该按钮的className名字对应成设计样式
                        div[i].style.display="block"; //如果不加入立即执行函数的话，存在类似闭包问题
                    }
                }(i))
            }

            function on() {
                alert("领取成功！");
            }
            //选择优惠券
            function selectRadio() {
                var div=document.getElementsByTagName('span');
                for (var i=0;i<div.length;i++){
                    (function(i){
                        div[i].onclick=function(){
                            for ( var j=0;j<div.length;j++) {
                                div[j].className="";
                            }

                            this.className="cb";
                        }
                    }(i))
                }
            }

            //控制积分输入范围
            function textbox(){
                var obj=document.getElementsByClassName("txt")[0];
                var havePoints= document.getElementsByClassName("havePoints")[0];
                var points=parseInt(havePoints.value);
                if(parseInt(obj.value)==obj.value && parseInt(obj.value)>=0 && parseInt(obj.value)<=points)
                {
                    alert("支付成功");
                    return true;
                }
                else
                    alert('请输入在积分范围内的数字！');
                return false;
            }
        </script>
    </div>


</body>
</html>