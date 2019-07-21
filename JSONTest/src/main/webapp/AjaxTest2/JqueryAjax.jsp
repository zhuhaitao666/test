<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>使用ajax()请求</title>
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/js/json2.js"></script>
    <script type="text/javascript">
        //1.加载JavaScript文件
        $.ajax({
            type:"get",
            url:"test.js",
            dataType: "script"
        });
        //2.把客户端的数据传递给服务端，并获取服务器的响应信息
        $.ajax({
            type:"get",
            url:"test.asp",
            data:"username=jackson&password=123456",
            success:function (data) {
                alert(data);
            }
        });
        //3.加载HTML页面
        $.ajax({
            url:"test.html",
            cache:false,
            success:function () {
                $("#div").append(html);
            }
        });
        /*
             Ajax()参数列表
            1. async 是否异步，默认为true
            2. beforeSend  function
         */
    </script>
</head>
<body>
    <p>ajax方法是JQuery实现Ajax的底层方法，也就是说它是get(),post()等方法的基础</p>

</body>
</html>