<%@ page import="java.util.List" %>
<%@ page import="com.qbd.pojo.ShopCart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <title>我的购物车</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycar.css" />
</head>
<body>
<%
    List<ShopCart> cartShoes=(List<ShopCart>) request.getAttribute("cartShoes");
    int records=0;//共有几条记录
    double allPrice=0.0;
%>
<div class="top">
    <h1>购物车</h1>
    <p>温馨提示: 产品是否购买成功，请以最终下单为准，请尽快结算</p>
    <hr color="#2F2F2F" />
</div>
<div class="main">
    <%
        if (session.getAttribute("userId")!=null)
        {
    %>


    <table>
        <tr width="23" class="th">
            <td width="10%"><input type="checkbox" class="all" onclick="allSelect();"/>全选</td>
            <td width="20%">图片</td>
            <td width="20%">商品名称</td>
            <td width="30%">商品描述</td>
            <td width="10%">单价</td>
            <td width="10%">数量</td>
            <td width="5%">小计</td>
            <td width="5%">操作</td>
        </tr>
        <%
            for (ShopCart shopCart:cartShoes)
            {
                records++;
        %>

        <tr class="oneRecord">
            <td><input class="check-box" type="checkbox" name="xuanze" onclick="hadSelect();"/></td>
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
            <td><a href="${pageContext.request.contextPath}/ShoesOnline/deleteFromCart?shopCartId=<%=shopCart.getShopCartId()%>&addNum=<%=shopCart.getBuyNum()%>&goodsId=<%=shopCart.getShoes().getGoodsId()%>"><img style="width: 50px; height: 50px" src="/images/delete.png"/></a></td>
        </tr>

        <form name="form2"><input class="price" value="<%=shopCart.getTotal()%>" type="hidden"/></form>
        <%
            }
        %>
    </table>
    <div class="footer">
        <form name="form1">
            <span>共<%=records%> 件商品，已选择
                <input  name="i" value="0" style="border-style: none;background-color: ghostwhite" size="1" disabled>
                合计<span class="allPrcie">￥<input value="0" name="allPrice" size="10"  style="border-style: none;background-color: ghostwhite" disabled/></span>（不含运费,折扣费）
        </span>
        </form>
        <a href="${pageContext.request.contextPath}/ShoesOnline/toIndex" class="foot">继续购物</a>
        <form action="${pageContext.request.contextPath}/ShoesOnline/toSettle" name="theform" onsubmit="return wantTosettle(<%=records%>)">
            <input type="hidden" id="tempString" name="tempString" />

            <input type="submit" value="去结算" onclick="settle();"  style="border-style: none;background-color: red">

        </form>
    </div>

    <%
        }
        else{

    %>
    <span style="color: #ffd900; float: right"><a href="${pageContext.request.contextPath}/ShoesOnline/login">登录</a>亲，请先登录(状态：尚未登录)</span>
    <%
        }
    %>
</div>
<script type="text/javascript">
    function allSelect() {

       var all=document.getElementsByClassName("all")[0];
       var check=document.getElementsByClassName("check-box");
       if (all.checked==true){
            for (var i=0;i<check.length;i++){
                check[i].checked=true;
            }
       }
       else{
           for (var i=0;i<check.length;i++){
               check[i].checked=false;
           }
       }
       hadSelect();
    }
    function hadSelect() {
        var v=document.form1.i;
        var allPrice =document.form1.allPrice;
        var p=document.getElementsByClassName("price");//小计数组
        var num=0;var tempAllPrice=0.0;
        var checks=document.getElementsByClassName("check-box");

        for (var i=0;i<checks.length;i++)
        {
            if (checks[i].checked==true)
            {
                num++;
                tempAllPrice=parseFloat(p[i].value)+tempAllPrice;//算总价
            }
        }
        v.value=num;
        allPrice.value=tempAllPrice;
    }
    function settle() {
        var checks=document.getElementsByClassName("check-box");
        var bb = "";
        for (var i=0;i<checks.length;i++)
        {
            if (checks[i].checked==true)
            {
                    bb=bb+","+i;
            }
        }
        document.getElementById("tempString").value=bb.substring(1);
    }
    function wantTosettle(records) {
        var v=parseInt(document.form1.i.value);//获取已选择的商品数量
        if(v==0){
            alert("请先选择结算商品");
            return false;
        }
        else if (records==0) {
            alert("请先添加商品到购物车");
            return false;
        }
        else {
            return true;
        }
    }
</script>
</body>
</html>