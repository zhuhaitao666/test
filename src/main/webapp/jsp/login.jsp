<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Home</title>
<!-- Custom Theme files -->
<link href="/css/login.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!--Google Fonts-->
<link href='http://fonts.useso.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<!--Google Fonts-->
</head>
<body>
<div class="login">
	<h2>Acced Form</h2>
	<div class="login-top">
		<h1>LOGIN FORM</h1>
		<form action="${pageContext.request.contextPath}/ShoesOnline/login">
			<input name="phone" type="text" value="phone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入用户手机号';}" required autofocus>
			<input name="password" type="password" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入密码';}" required autofocus>
			<div class="forgot">
				<a href="#">forgot Password</a>
				<input type="submit" value="Login" onclick="success();">
			</div>
		</form>
        <p style="color: #9d0000"><%=request.getAttribute("error")==null?"":"用户名或者密码错误!"%></p>
	</div>
	<div class="login-bottom">
		<h3>New User &nbsp;<a href="${pageContext.request.contextPath}/jsp/register.jsp">Register</a>&nbsp Here</h3>
	</div>
</div>

</body>
</html>