<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单列表</title>
    <style type="text/css">
        .singleShoes{
            float:left;
        }
        .orderInfo td{
            width: 8%;
        }
        .table1{
            border: dashed 1px ;
        }
        .submit-button{
            background-color: red;
        }
    </style>
    <script type="text/javascript">
        function find() {
            var v=document.getElementsByClassName("table2")[0];
            if(v.style.display=="none"){
                v.style.display="block";
            }else{
                v.style.display="none";
            }
        }
    </script>
</head>
<body>
<div>
    <h3>订单管理</h3>
    <c:forEach items="${orderList}" var="order">
    <table class="table1">

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
                <td>订单追踪</td>
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
                    <input  type="button" value="查询/收回" onclick="find()"/>
                </td>

            </tr>
    </table>

        <table class="table2" style="display: none">
            <tr>
                <td >货物抵达位置</td>
                <td >更新时间</td>
            </tr>

            <c:forEach items="${order.orderTracks}" var="orderTrack">
                 <tr>
                    <td >${orderTrack.location}</td>
                    <td ><fmt:formatDate value="${orderTrack.updateTime}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                     <c:if test="${orderTrack.arriveState==1}">
                         <c:set value="${orderTrack.orderTrackId}" var="orderTrackIdAdd"></c:set>
                     </c:if>
                     <c:set value="${orderTrack.orderTrackId}" var="orderTrackId"></c:set>
                </tr>
            </c:forEach>
            <c:if test="${orderTrackIdAdd==null}">
            <tr><td>
                <form action="${pageContext.request.contextPath}/ShoesOnline/addTrack">
                    <input type="hidden" name="orderTrackId" value="${orderTrackId}">
                    <input type="hidden" name="information" value="orderStation">
                    <input type="hidden" name="orderId" value="${order.orderId}">
                    <input type="text" name="location"  placeholder="请填写货物抵达地点:"  required autofocus>

                    <p>是否终点 &nbsp;
                    是：<input name="arriveState" type="radio" value="1">否：<input name="arriveState" type="radio" value="0" checked>
                        <input class="submit-button" type="submit"  value="提交"/></p>
                </form>
                </td>
            </tr>
            </c:if>
            <tr><td><c:if test="${orderTrackIdAdd!=null}">
               <strong>该订单已到达终点</strong>
            </c:if></td></tr>
    </table>
</c:forEach>

</div>
</body>
</html>