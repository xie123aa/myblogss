<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	#title {
    background-color:red;
    color:white;
	margin:0;
	padding:0;
    }
    #content {
    float:left;	 
    text-align:center;
    font-size:35px;
 	margin:0;padding:0;	 
	}
	#comment {
	background-color:#FFA500;
	clear:both;
	text-align:center;
	font-size:25px;	
	margin:0;padding:0;
	}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<h1 id="title">标题${requestScope.article.title}</h1>
<div id="content">
${requestScope.article.content}
</div>
${requestScope.article.date}
<br>
<!--展示评论  -->
<div id="comment">
<br>
	<c:forEach  items="${requestScope.comment}" var="i" begin="0" end="${requestScope.size}">
   
   用户${i.userid}在${i.commentDate}发表评论: <c:out value="${i.content}"/>

   <br>
	</c:forEach>
	</div>
<div id="area">	   
       <form  action="saveCommentAction.action?articleid=${requestScope.id}" method="post">
        <table>
            <tr>
                <td>评论框</td>
                <td>
					<input type="textarea" name="content" size="50"/>
                </td>
            </tr>
           
        </table>
        <input type="submit" value=提交 />
         
    </form>
    </div>

</body>
</html>