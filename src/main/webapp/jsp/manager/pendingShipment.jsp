<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        .singleShoes{
            float:left;
        }
        .orderInfo td{
            width: 8%;
        }
        hr{
            border-color:red;
            border-style: dashed;
        }

    </style>
</head>
<body>
    <h3>待发货列表</h3>
    <div>
        <table>
            <c:forEach items="${bePendingOrders}" var="order">

                <div class="singleShoes">

                    <c:forEach items="${order.ordergoods}" var="ordergood">
                    <tr>
                        <td><strong>商品：</strong>&nbsp;&nbsp;&nbsp;&nbsp;
                            <img src="${ordergood.shoes.shoesImg.path}" width="50px" height="50px"/></td>
                        <td>${ordergood.shoes.goodsName} </td>
                       <td> &nbsp;&nbsp;&nbsp;数量:${ordergood.number}</td>
                    </tr>
                    </c:forEach>
                </div>

            <tr>
                <td>订单号</td>
                <td>订单人姓名</td>
                <td>电话</td>
                <td>实付款</td>
                <td>使用积分</td>
                <td>下单时间</td>
                <td>发货地址</td>
            </tr>
            <tr class="orderInfo">
                    <td>${order.orderId}</td>
                    <td>${order.user.name}</td>
                    <td>${order.user.phone}</td>
                    <td>${order.value}</td>
                    <td>${(empty order.usePoints)?"未使用积分":order.usePoints}</td>
                    <td>
                        <fmt:formatDate value="${order.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/>
                    </td>
                    <td>

                        <form action="${pageContext.request.contextPath}/ShoesOnline/pending">
                            <input type="hidden" name="information" value="pendingStation">
                            <input type="hidden" name="orderId" value="${order.orderId}">
                            <input type="text" name="location"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请填写发货地址:';}" required autofocus>
                            <input type="submit"  value="发货"/>
                        </form>
                    </td>

            </tr>

            </c:forEach>

        </table>


    </div>
</body>
</html>