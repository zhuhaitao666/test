<%@ page import="com.qbd.pojo.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.qbd.pojo.Ordergoods" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style type="text/css">

        .nav{
            position: absolute;
            width: 98%;
            height: 90%;
            top: 60px;
            background-color:#E7E7E7;
        }
        .nav ul li{
            list-style-type: none;
            float: left;
            margin-right: 3px ;
            width: 120px;

        }

        a{
            text-decoration: none;
            width: 60px;
            background-color: orangered;

        }
        a:hover{
            background-color: red;
        }
        .text-center{
            position: absolute;
            top: 100px;
        }
        table{
            background-color:#E7E7E7;
            border: dashed  1px;
            text-align: center;
            font-family: "微软雅黑";
            font-size: 10px;
        }
        table tr{
            height: 50px;

        }
        table tr td{
            width: 120px;
        }
        #find{
            background-color: darkgoldenrod;
        }
        #find:hover{
            background-color: red;
        }
        .price{
            color: red;
        }
        .pageTurning{
            float: right;
        }
    </style>
</head>
<body>
<%
    List<Order> orders=(List<Order>) request.getAttribute("orders");
%>
<span style="color: darkgreen;font-size:25px">待发货商品</span><a href="#" onClick="javascript :history.back(1);">返回上一页</a>
<div class="main">
    <div class="nav">
        <ul>
            <li>商品</li>
            <li>订单详情</li>
            <li>收货人</li>
            <li>数量</li>


        </ul>
    </div>
    <div class="text-center">

            <%
                for (Order o:orders){
            %>
            <strong>订单编号:</strong>&nbsp;<%=o.getOrderId()%>
            <%
                    for (Ordergoods ordergoods:o.getOrdergoods()) {


            %>
        <table align="center">
            <tr>
                <td><img src="<%=ordergoods.getShoes().getShoesImg().getPath()%>" width="50px" height="50px"/></td>
                <td><%=ordergoods.getShoes().getGoodsName()%> </td>
                <td><%=o.getUser().getName()%></td>
                <td><%=ordergoods.getNumber()%></td>

            </tr>
                    <%}%>
            <tr>
                <td>在线支付</td>
                <td class="price">实付金额 ￥<%=o.getValue()%></td>
            </tr>
        </table>
            <%}%>

    </div>
</div>
</body>
</html>