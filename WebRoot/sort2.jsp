<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
a{TEXT-DECORATION:none}
#nav{
font-size:40px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<h1 id="head" style="font-size:40px;">分类查看</h1>
<div id="nav">
	<a href="${pageContext.request.contextPath }/sort2.action?type=1" >移动开发</a>
	<br>
	<a href="${pageContext.request.contextPath }/sort2.action?type=2" >web前端</a>
	<br>
	<a href="${pageContext.request.contextPath }/sort2.action?type=3" >架构设计</a>
	<br>
	<a href="${pageContext.request.contextPath }/sort2.action?type=4" >编程语言</a>
	<br>
	<a href="${pageContext.request.contextPath }/sort2.action?type=5" >互联网</a>
	<br>
	<a href="${pageContext.request.contextPath }/sort2.action?type=6" >数据库</a>
	<br>
	<a href="${pageContext.request.contextPath }/sort2.action?type=7" >系统运维</a>
	<br>
	<a href="${pageContext.request.contextPath }/sort2.action?type=8" >云计算</a>
	<br>
	<a href="${pageContext.request.contextPath }/sort2.action?type=9" >研发管理</a>
	<br>
	<a href="${pageContext.request.contextPath }/sort2.action?type=10" >综合</a>
	<br>
</div>
</body>
</html>