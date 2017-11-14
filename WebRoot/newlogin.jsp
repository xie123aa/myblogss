<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
a{TEXT-DECORATION:none}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body style="background-image:url(${pageContext.request.contextPath }/index/image/background.jpg);
   background-size:100%; ">
<center>
<font face="楷体" size="5" color="white">
<h1>个人博客系统</h1>
<h3>用户登陆</h3>
</font>

<form action="login.action" method="get">

<table width="300" height="180" border="5" bordercolor="#000000" style="background:white">

<tr align="center">
<td>用户名：<input type="text" name="username" placeholder="用户名" maxlength="16 "/></td>
</tr>
<tr align="center"><td>密   码：<input name="password" type="password" placeholder="密码" maxlength="20"/></td></tr>
<tr align="center">
<td colspan="3"><input type="submit" value="提  交"  />
<input type="reset" value="重  置"/>
  <a href="${pageContext.request.contextPath }/showAllArticle.action?pageNum=1">游客登陆</a>
</tr>
</table>
</form>
</center>
</body>>
</html>