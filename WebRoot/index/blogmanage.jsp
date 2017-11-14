<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
	#nav {
    background-color:blue;
    color:white;
    text-align:center;
    text-decoration:none;
    font-size:50px;
    float:right;
    position:absolute;
	left:450px;
    }
    a{TEXT-DECORATION:none}

}
</style>
</head>
<body>
<div id="nav">
    <!--导航栏链接  -->
	
	<a  id="article" href="${pageContext.request.contextPath }/showAllArticle.action?manage=1" >文章管理</a>
	<a id="index" href="${pageContext.request.contextPath }/login.action" >返回首页</a>
	<a id="comment" href="${pageContext.request.contextPath }/getcomment.action" >评论管理</a>
</div>
</body>
</html>