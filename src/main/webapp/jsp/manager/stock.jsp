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
        .submit-button{
            background-color: red;
        }
    </style>

</head>
<body>
<body>
<div class="thediv">

    <c:forEach items="${sessionScope.allShoes}" var="shoes">
    <form action="${pageContext.request.contextPath}/ShoesOnline/managerShoesNum" method="get" onsubmit="alert('更新成功!');">
    <div class="single">
        <img class="shoesImage" src="${shoes.shoesImg.path}" />
        <div class="side">
            <h4>${shoes.goodsName}</h4>
            <span>编号:${shoes.goodsId}
            <input type="hidden" name="goodsId" value="${shoes.goodsId}"><input type="hidden" name="information" value="reserveStation">
            <input type="button" value="-" onClick="javascript:if(this.form.Num.value>0)
                    this.form.Num.value--;" size="1">
            <input name="Num" type="text"  value="${shoes.number}" class="Num"  size="1" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
            <input type="button" value="+" onClick="javascript:this.form.Num.value++;" size="1">
            </span>
           <input type="submit" value="更新" class="submit-button">
        </div>
    </div>
    </form>
    </c:forEach>
</div>
</body>
</body>
</html>