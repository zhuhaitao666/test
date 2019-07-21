<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>测试接受JSON格式的数据</title>
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/json2.js"></script>
    <script type="text/javascript">
        // $(document).ready(function () {
        //     testRequestBody();
        // });
        function testRequestBody() {
            $.ajax({
                url:"<%=request.getContextPath()%>/jsonTest",
                dataType : "json",//预期服务器返回的数据类型
                type : "post",
                contentType:"application/json",
                data:JSON.stringify({id:1,name:"JSON简单应用"}),
                async:true,//默认设置下，所有请求均为异步请求，如果设置为false，则发送同步请求
                success:function (data) {
                    console.log(data);
                    $("#id").html(data.id);
                    $("#name").html(data.name);
                    $("#author").html(data.author);
                },
                error:function x() {
                    alert("数据发送失败");
                }
            });
        }
    </script>
</head>
<body>
    <button onclick="testRequestBody()">异步调用</button><br />
    编号:<span id="id"></span><br>
    书名:<span id="name"></span><br>
    作者:<span id="author"></span>
</body>
</html>