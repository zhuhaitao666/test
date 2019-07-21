<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>通过JQuery接受get请求返回的JSON字符串</title>
    <script src="/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/json2.js"></script>
    <script type="text/javascript">
        $(function () {
            $("input").click(function (){
                $.getJSON("test1.asp",function (data){
                    var data=data;
                    for(var i=0;i<data.length;i++){
                        var $p=$("<p>姓名:"+data[i].name+"  密码:"+data[i].pass+" 年龄:"+data[i].age+"</p>");
                        $("div").append($p);
                    }
                })
            });
        })
    </script>
</head>
<body>
    <input type="button" value="JQuery 实现的异步请求（get）">
    <div></div>
</body>
</html>