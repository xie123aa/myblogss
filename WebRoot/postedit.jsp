<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>  
<script type="text/javascript" src="ueditor/ueditor.all.js"></script> 
 <LINK rel=stylesheet href="ueditor/themes/default/css/ueditor.css">
<head>
<style>
	#title{
		position:absolute;
	top:120px;
	left:530px;
	margin:0 auto;
	}
	#biaoti{
	text-align:center;
	position:absolute;
	top:120px;
	left:400px;
	font-size:30px;	
	}
	
	#myEditor{
	position:relative;
	top:100px;
	left:0px;
	}
	#submit{
	position:absolute;
	bottom:0px;
	left:700px;
	font-size:20px;
	
	}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div id=nav"><%@include file="index/blogmanage.jsp" %></div>


<div id="biaoti">文章标题</div>
<form action="publish.action" method="post">
<div id="title">
<select id="selType" name="type" style="height:35px"><option value="0">请选择文章类型</option><option value="1">移动开发</option><option value="2">web前端</option><option value="3">架构设计</option><option value="4">编程语言</option><option value="5">互联网</option><option value="6">数据库</option><option value="7">系统运维</option><option value="8">云计算</option><option value="9">研发管理</option><option value="10">综合</option></select>
<input type="text" name="title" id="txtTitle" style="width:560px; height:30px; float:left;" maxlength="100" />
</div>
<br>
<br>
<br>


<textarea name="content" id="myEditor" style="width: 1000px; height: 400px; margin: 0 auto;"></textarea>
<script type="text/javascript">

UE.getEditor('myEditor');
</script>
    <input id="submit" type="submit" name="submit" value="发布文章">
</form>




</body>
</html>