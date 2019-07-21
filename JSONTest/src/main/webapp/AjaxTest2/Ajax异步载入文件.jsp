<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>测试异步加载文件</title>
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/js/json2.js"></script>
    <script type="text/javascript">
        // $(function () {
        //     $("input").click(function () {
        //         $("div").load("test1.jsp");
        //     });
        // })
        $(function () {
            $("input").click(function () {
                var str=(
                    $.ajax({
                    url:"test1.jsp",
                    async:false
                })).responseText;
                $("div").html(str);
            });
        })
    </script>
</head>
<body>
    <input type="button" value="JQuery实现的异步请求">
    <div></div>
    <b>将会在上面呈现另外一个页面的内容</b>
</body>
</html>