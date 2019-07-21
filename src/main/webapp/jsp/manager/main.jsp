<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        .thediv{
            position: relative;
            top: 50px;
            left: 50px;

        }
        .single{
            float: left;
            margin-right: 10px;
            width: 18%;
        }
        .shoesImage{
            cursor: pointer;
            transition: all 0.6s;
        }
        .shoesImage:hover{
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<body>
<div class="thediv">

    <c:forEach items="${sessionScope.allShoes}" var="shoes">
    <div class="single">
        <img class="shoesImage" src="${shoes.shoesImg.path}" />
        <div class="side">
            <h4>${shoes.goodsName}</h4>
            <a href="${pageContext.request.contextPath}/ShoesOnline/toMain?information=updateShoes&goodsId=${shoes.goodsId}">修改</a>
            <a href="${pageContext.request.contextPath}/ShoesOnline/pullOff?goodsId=${shoes.goodsId}">下架</a>
        </div>
    </div>
    </c:forEach>
</div>
</body>
</body>
</html>