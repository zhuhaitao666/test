<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理员登录界面</title>
    <link href="/css/login1.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- -->
    <script>var __links = document.querySelectorAll('a');function __linkClick(e) { parent.window.postMessage(this.href, '*');} ;for (var i = 0, l = __links.length; i < l; i++) {if ( __links[i].getAttribute('data-t') == '_blank' ) { __links[i].addEventListener('click', __linkClick, false);}}</script>
    <script src="/js/login1.js"></script>
    <script>$(document).ready(function(c) {
        $('.alert-close').on('click', function(c){
            $('.message').fadeOut('slow', function(c){
                $('.message').remove();
            });
        });
    });
    </script>
</head>
<body>
<!-- contact-form -->
<div class="message warning">
    <div class="inset">
        <div class="login-head">
            <h1>Login Form</h1>
            <div class="alert-close"> </div>
        </div>
        <form action="${pageContext.request.contextPath}/ShoesOnline/login1">
            <li>
                <input name="phone" type="text" class="text" value="phone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Phone';}"><a href="#" class=" icon user"></a>
            </li>
            <div class="clear"> </div>
            <li>
                <input name="password" type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"> <a href="#" class="icon lock"></a>
            </li>
            <div class="clear"> </div>
            <div class="submit">
                <input type="submit" onclick="myFunction()" value="登录" >
                <h4><a href="#">Lost your Password ?</a></h4>
                <div class="clear">  </div>
            </div>
        </form>
        <p style="color: #9d0000"><%=request.getAttribute("error")==null?"":"手机号或者密码错误!"%></p>
    </div>
</div>
</div>
<div class="clear"> </div>


</body>
</html>