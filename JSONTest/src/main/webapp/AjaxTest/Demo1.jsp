<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ajax Demo Test</title>
    <script type="text/javascript">
        function send() {
            if(XMLHttpRequest){
                var xhr=new XMLHttpRequest();
            }else if(ActiveXObject){
                var xhr=ActiveXObject("Microsoft.XMLHTTP");
            }
            //准备发送请求open()  参数1：请求方式（get/post） 参数2:请求路径 参数3:是否异步默认为true
            xhr.open("get","/ajaxTest");
            xhr.send();
            // alert(xhr.responseText);//将响应信息作为字符串返回
            // alert(xhr.responseText);//将响应信息作为字符串返回
            // //第一个弹窗内容为空，第二个弹窗内容不为空。异步问题

            xhr.onreadystatechange= function (ev) {//ajax监听器
                if(xhr.readyState==4&&xhr.status==200)
                   /* 返回XMLHTTP请求的当前状态
                0 (未初始化) 对象已建立，但是尚未初始化（尚未调用open方法）
                1 (初始化) 对象已建立，尚未调用send方法
                2 (发送数据) send方法已调用，但是当前的状态及http头未知
                3 (数据传送中) 已接收部分数据，因为响应及http头不全，这时通过responseBody和responseText获取部分数据会出现错误，
                4 (完成) 数据接收完毕,此时可以通过通过responseBody和responseText获取完整的回应数据
                    返回当前请求的http状态码 200 OK   404 Not Found  500Internal Server Error
                   */
                console.log(xhr.responseText);
            }
        }
    </script>
</head>
<body>
    <button onclick="send()">点我访问Ajax请求</button>
</body>
</html>