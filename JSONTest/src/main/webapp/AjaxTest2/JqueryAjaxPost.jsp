<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JQuery实现异步请（post）</title>
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/js/json2.js"></script>
    <script>
        $(function () {
            $("input").click(function () {
                /*
                       JQuery.get(url,[data],[callback],[type])
                       首个参数必须，其他三个参数可选
                       第一个参数表示要请求页面的URL地址
                       第二个参数表示对象结构的键值对
                       第三个参数表示异步交互成功之后调用的回调函数
                       第四个参数表示服务器响应信息返回的内容格式 xml JSON text

                       JQuery还提供了getJSON()和getScript()方法用来接受JSON数据和JavaScript文件
                       该类方法不需要设置第四个参数
                 */
                $.post("test1.asp",{
                    name:"朱海涛",
                    pass:"masterYourself",
                    age:20
                },function (data) {
                    alert(data);
                });
            });
        })
    </script>
</head>
<body>
    <input type="button" value="通过JQuery实现异步传输(post)">
</body>
</html>