<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ajax Demo Test</title>
    <script type="text/javascript">
        function check(){
            var xhr;
            if(XMLHttpRequest){
                xhr=new XMLHttpRequest();
            }else if(ActiveXObject){
                xhr=ActiveXObject("Microsoft.XMLHTTP");
            }
            else{
                alert("您使用了不兼容的浏览器");
            }
            //准备发送请求open()  参数1：请求方式（get/post） 参数2:请求路径 参数3:是否异步默认为true
            //用post方法传参的要设置请求头信息，而且位置必须要在open方法下面
            xhr.open("post","/ajaxTestSamePassword");
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");

                // + "?password="+password.value+"&repeatPassword="+repeatPassword.value+"&_time="+new Date().getTime());
            //加入时间参数放置了浏览器缓存问题
            // xhr.send();
            // 当通过post传参的时候，需要在send（）方法中传递参数，才不会暴露参数值
            xhr.send("password="+password.value+"&repeatPassword="+repeatPassword.value+"&_time="+new Date().getTime());
            xhr.onreadystatechange=function (ev) {
                if(xhr.readyState==4&&xhr.status==200) {
                    if (xhr.responseText == "true") {
                        alert("两次输入的密码一致");
                        window.location.href="/success.jsp";
                    }
                    else {
                        alert("两次输入的密码不一致");
                        document.getElementById("info").innerHTML = "两次输入的密码不一致";
                    }
                }
            }
        }
    </script>
</head>
<body>
       用户名：<input id="userName" name="userName" type="text"/>
       密码：<input name="password" id="password" type="password">
       重复密码：<input name="repeatPassword" id="repeatPassword" type="password">
       <button onclick="check()">登录</button>
       <br /><strong id="info"></strong>
</body>
</html>