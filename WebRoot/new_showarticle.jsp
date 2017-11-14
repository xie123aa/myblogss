<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <!--使用jsp标准库要引入taglib，不同功能对应不同的引用  -->
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<title>首页</title>

<head>
<style type="text/css">
    *{margin:0px;
    padding:0px;
    border:0px;
    }
    html,body{
    width:100%;
    height:100%;}
    .blog-top{
    width:auto;
    height:250px;
    margin:auto;
    background-image: url(${pageContext.request.contextPath }/index/back2.png);
    }
    .userface{
    width:80px;
    height:80px;
    padding-top:140px;
    padding-left:30px;
    float:left;
    display:inline;
    }
    .blogname{
    width:300px;
    display:inline;
    padding-left: 30px;
    margin-top: 155px;
    float: left;
    }

    .container{
        position: relative;
        width: auto;
        height: auto;
        margin: 0px auto;
    }
    .left{
        width: 200px;
        height:100%;
        border-style: solid;
        border-color: #C0C0C0;
        border-width: 1px;
        position: absolute;
        top: 0px;
        left: 0px;
    }
    
    .right{
        width: 200px;
        height:100%;
        position: absolute;
        top: 0px;
        right: 0px;
    }
    .center{
        height:100%;
        border-style: solid;
		border-color: #C0C0C0;
        border-width: 1px;
        margin:5px 210px 5px 210px;

    }   

    .information{
    width:100%;
    height:20px;
    background-color:#FFE4E1;
    }
    .userimg{
    width:100%;
    height:160px;
    boder:1px solid #A9A9A9;
    margin-top: 20px;
    }
    .username{
    width:100%;
    height:50px;
    text-align:center;
    }
    .user-information{
    width:100%;
    height:200px;
    line-height:20px;
    text-indent:40px;
    }
    .essay{
        width: 100%;
        height: 200px;
        border-style: solid;
        border-color: #C0C0C0;
        border-width: 1px;
    }
    .visitor-comment{
        width: 100%;
        height: 200px;
        border-style: solid;
        border-color: #C0C0C0;
        border-width: 1px;
        margin-top: 5px;
    }
    .classification{
        width:100%;
        height:20px;
        background-color:#FFE4E1;
    }
    .comment{
        width:100%;
        height:20px;
        background-color:#FFE4E1;
    }
    .user-essay{
        width:100%;
        height:20px;
        background-color:#FFE4E1;
    }
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
	background-color:#FFE4E1;
	clear:both;
	text-align:center;
	font-size:25px;	
	margin:0;padding:0;
	
	}
    </style>
    </head>
<body>
    <div id="blog-top" class="blog-top">
            <div class="userface" >
              <img src="${pageContext.request.contextPath }/index/image/userimg.png" width="80" height="80"/>
                
            </div>
            <div class="blogname">
                <font face="微软雅黑" size="5" color="#F8F8FF">梁姗姗的博客</font>
                <font face="微软雅黑" size="3"><a href="visitor.html"></a></font>
            </div>
     </div>
<div id="container" class="container">
    <div id="left" class="left">
        <div class="information"><font size="1" color="#A9A9A9"><b>个人资料</b></font></div>
        <div class="userimg" align="center"><img src="${pageContext.request.contextPath }/index/image/userimg.png" width="150" height="150"/></div>
        <div class="username"><font face="微软雅黑" size="3" color="#708090">梁姗姗的博客</font></div>
        <div class="user-information">这是梁姗姗的个人博客,我是梁姗姗，个人博客设计</div>
    </div>
    <div id="center" class="center">
    <div class="user-essay"><font size="1" color="#A9A9A9">博文</div>
    <h1 id="title">标题${requestScope.article.title}</h1>
    <div id="content"  style="color: black;">
	${requestScope.article.content}
	</div>
	${requestScope.article.date}
	<br>
	
	<div id="comment"  style="color: red;">
<hr>
	<c:forEach  items="${requestScope.comment}" var="i" begin="0" end="${requestScope.size}">
   <br>
   用户${i.userid}在${i.commentDate}发表评论: <c:out value="${i.content}"/>
	</c:forEach>
	</div>
<div id="area">	   
       <form  action="saveCommentAction.action?articleid=${requestScope.id}" method="post">
        <table >
            <tr>
                <td>评论框</td>
                <td>
                
					<input type="textarea" name="content" size="50" style="width: 400px; height: 30px; border:1px solid gray" />
                </td>
            </tr>
           
        </table>
        <input type="submit" value=提交 />
         
    </form>
    </div>
    </div>
        
    </div>
</div>
</body>
</html>