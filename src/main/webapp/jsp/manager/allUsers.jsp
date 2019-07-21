<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        td{
            width: 10%;
        }
        table{
            border-style: solid;
        }
    </style>
    <script type="text/javascript">
        function toConfirm() {
            if (confirm("您确认删除此用户？")){
                return true;
            }else{
                return false;
            }
        }
    </script>
</head>
<body>
    <h2>全部会员</h2>
    <table>
        <tr>
            <td>用户编号</td>
            <td>姓名</td>
            <td>邮箱</td>
            <td>生日</td>
            <td>QQ</td>
            <td>电话</td>
            <td>住址</td>
            <td>操作</td>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.userid}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.birthday}</td>
                <td>${user.qq}</td>
                <td>${user.phone}</td>
                <td>${user.address}</td>
                <td>
                   <form action="/ShoesOnline/deleteUser" onsubmit="return toConfirm()">
                       <input type="hidden" name="userId" value="${user.userid}">
                       <input type="hidden" name="information" value="allUsers">
                       <input  value="删除" type="submit"/>
                   </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>