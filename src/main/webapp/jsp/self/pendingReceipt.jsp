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
    int totalRecords=orders.size();
    int currentPage=1;
%>
<a href="#" onClick="javascript :history.back(1);">返回上一页</a>
<div class="main">
    <div class="nav">
        <ul>
            <li>商品</li>
            <li>订单详情</li>
            <li>收货人</li>
            <li>数量</li>


            <li>
                <form>
                    <select>
                        <option><a>近三个月订单</a></option>
                        <option><a>半年以内订单</a></option>
                        <option><a>2018年订单</a></option>
                        <option><a>2017年订单</a></option>
                        <option><a>以前的订单</a></option>
                    </select>
                    <input type="button" name="find" id="find" value="查询" />
                </form>
            </li>

        </ul>
    </div>
    <div class="text-center">

            <%
                for (Order o:orders){

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
                <td class="price">总额 ¥<%=o.getValue()%></td>

            </tr>
        </table>
            <%}%>

        <div class="pageTurning">
            <p>总共<%=totalRecords%>条记录 &nbsp;&nbsp; 共1页 &nbsp;&nbsp; 当前页数<%=currentPage%>&nbsp;&nbsp;
                <a href="#">上一页</a>
                <a href="#">下一页</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>