<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>鞋子详情的首页</title>
</head>
<frameset rows="80,80%,*" frameborder="no" border="0" framespacing="0">
    <frame src="${pageContext.request.contextPath}/jsp/shoes/Nav1.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
    <frame src="${pageContext.request.contextPath}/jsp/shoes/main.jsp" name="mainFrame" id="mainFrame" title="mainFrame" noresize="noresize" scrolling="yes"/>
</frameset>
<body>

</body>
</html>
