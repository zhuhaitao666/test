<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>我的购物车</title>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        ul .li1 {
            float:right;
            background-color:#C0C;
            width:70px;
            height: 22px;
            list-style-type:none;
        }
        ul .li2 {
            float:left;
            width: 10%;
            height: 22px;
            list-style-type:none;
        }
        .li2 a,.li1 a {
            color: white;
            background-color:black;
            text-decoration:none; /*超链接无下划线*/
            display:block;
            width:100%;
            height: 22px;
            text-align:center;
            text-decoration:none;
            line-height:21px;
        }
        .li1 a:hover{
            background-color: red;
        }
        .li2 a:hover{
            border: solid 1px;

        }
        .top{

            height: 22px;
        }
        .head{

            float: left;
            width: 100%;
        }
        .text{
            height: 22px;
            width: 150px;
            border: solid 2px;
            border-color: darkred;
        }
        .submit{
            width: 80px;
            height: 23px;
            border: solid 2px;
            border-color: darkred;
            background-color: red;
        }
        .submit:hover{
            background-color:saddlebrown;
        }
        .button{background-color: red;
            border-color: #000000;
        }
        body{
            background-image: url(/images/true.jpg);
            background-size: 100% auto;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<div class="top">
    <ul>
        <li class="li1"><a href="${pageContext.request.contextPath}/ShoesOnline/toSelf" target="_top">个人中心</a></li>
        <li class="li1"><a href="register.html" target="_blank">注册</a></li>

            <%
            if (session.getAttribute("phone")!=null)
            {
        %>
         <span style="color: sienna">用户${sessionScope.phone} </span>
            <%
            }else
            {
            %>
            <li class="li1"><a href="${pageContext.request.contextPath}/jsp/login.jsp" target="_blank">登录</a></li>
            <%
                }
            %>
    </ul>
    <br />
</div>
<div class="head">
    <ul>
        <li class="li2"><a href="${pageContext.request.contextPath}/ShoesOnline/toIndex" target="_top">主页</a></li>
        <li class="li2"><a href="#">热卖</a></li>
        <li class="li2"><a href="${pageContext.request.contextPath}/ShoesOnline/ClassificationNavigation?kind=adidas" target="_top">Adidas</a></li>
        <li class="li2"><a href="${pageContext.request.contextPath}/ShoesOnline/ClassificationNavigation?kind=LiNing" target="_top">Li Ning</a></li>
        <li class="li2"><a href="${pageContext.request.contextPath}/ShoesOnline/ClassificationNavigation?king=jeep" target="_top">Jeep</a></li>
        <li class="li2"><a href="${pageContext.request.contextPath}/ShoesOnline/ClassificationNavigation?kind=newBalance" target="_top">New Balance</a></li>
        <li class="li2"><a href="${pageContext.request.contextPath}/ShoesOnline/ClassificationNavigation?kind=vans" target="_top">Vans</a></li>
        <li class="li2"><a href="${pageContext.request.contextPath}/ShoesOnline/ClassificationNavigation?kind=converse" target="_top">Converse 匡威</a></li>
        <form action="${pageContext.request.contextPath}/ShoesOnline/LikeNameNavigation" target="_parent" method="get">
            <li class="li2">
                <input name="goodsName" class="text"type="text" placeholder="输入商品名"/>
            </li>
            <li class="li2">
                <input class="submit" type="submit" value="查询">
            </li>
        </form>
    </ul>
</div>
</body>
</html>
