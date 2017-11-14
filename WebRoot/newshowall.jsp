<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <!--使用jsp标准库要引入taglib，不同功能对应不同的引用  -->
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<title>首页</title>

</head>
<style type="text/css">
	a{TEXT-DECORATION:none}
    *{margin:0px;
    padding:0px;
    border:0px;
    }
    html,body{
    width:100%;
    height:100%;}
    .blog-top{
    width:1000px;
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
    	width: 1000px;
    	height: 100%;
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
    	height: 250px;
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
	.nav{
		margin-left:20px;
		list-style-position:inside;
		
		}
    </style>
<body>
	<div id="blog-top" class="blog-top">
            <div class="userface" >
              <img src="${pageContext.request.contextPath }/index/image/userimg.png" width="80" height="80"/>
                
            </div>
            <div class="blogtwo">
            <div class="blogname">
                <font face="微软雅黑" size="5" color="#F8F8FF">梁姗姗的博客</font>
                <font face="微软雅黑" size="3"><a href="showAllArticle.action?pageNum=1"> 刷新</a></font>
              
            </div>
            
            </div>
     </div>
<div id="container" class="container">
    <div id="left" class="left">
    	<div class="information"><font size="1" color="#A9A9A9"><b>个人资料</b></font></div>
        <div class="userimg" align="center"><img src="${pageContext.request.contextPath }/index/userimg.png" width="150" height="150"/></div>
        <div class="username"><font face="微软雅黑" size="3" color="#708090">计算机2班的博客</font></div>
        <div class="user-information">安徽理工大学计算机2班有36人，其中女生8人，男生28人</div>
    </div>
    <div id="right" class="right">
    <div class="essay">
    	<div class="classification"><font size="1" color="#A9A9A9">分类</font></div>
        <div class="nav">
        <ul>
        <li><a href="${pageContext.request.contextPath }/sort2.action?type=1" target="content">移动开发</a></li>
	<li><a href="${pageContext.request.contextPath }/sort2.action?type=2" target="content">web前端</a></li>
	<li><a href="${pageContext.request.contextPath }/sort2.action?type=3" target="content">架构设计</a></li>
	<li><a href="${pageContext.request.contextPath }/sort2.action?type=4" target="content">编程语言</a></li>
	<li><a href="${pageContext.request.contextPath }/sort2.action?type=5" target="content">互联网</a></li>
	<li><a href="${pageContext.request.contextPath }/sort2.action?type=6" target="content">数据库</a></li>
	<li><a href="${pageContext.request.contextPath }/sort2.action?type=7" target="content">系统运维</a></li>
	<li><a href="${pageContext.request.contextPath }/sort2.action?type=8" target="content">云计算</a></li>
	<li><a href="${pageContext.request.contextPath }/sort2.action?type=9" target="content">研发管理</a></li>
	<li><a href="${pageContext.request.contextPath }/sort2.action?type=10" target="content">综合</a></li>
    </ul>
    </div>
	<br>
    </div>
    <div class="visitor-comment">
    	<div class="comment"><font size="1" color="#A9A9A9">评论</font></div>
    </div>
    </div>
    <div id="center" class="center">
    <div class="user-essay"><font size="1" color="#A9A9A9">博文</div>
    <div id="content">
	
	
			<c:forEach  items="${requestScope.list}" var="i" begin="0" end="5">
   
   	<a href="showArticle.action?id=${i.id}" id="neirong" style="font-size:30px;" > ${i.title}</a>
   	<br>
   	<div style="font-size:15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间:${i.date}&nbsp;点击数:${i.clickhit}&nbsp;评论数:${i.replyhit}</div>
<br>
	</c:forEach>
	
</div>
<div id="foot" style="font-size:20px;">			
<!--首页，下一页  -->			
		<!--首页，下一页  -->
共有${requestScope.page.totalPage}页,当前为第${requestScope.page.pageNum}页			
			<a href="showAllArticle.action?pageNum=1">首页</a>
			
<!--翻页时进行判断jsp标准标签库	 -->
 <%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
             <c:if test="${requestScope.page.pageNum ==1}">
                <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">
                    <c:if test="${requestScope.page.pageNum == i}">
                         ${i}
                    </c:if>                
                    <c:if test="${requestScope.page.pageNum != i}">
                         <a href="showAllArticle.action?pageNum=${i}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="showAllArticle.action?pageNum=${requestScope.page.pageNum+1}">下一页</a>                    
             </c:if>
 <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
            <c:if test="${requestScope.page.pageNum > 1 && requestScope.page.pageNum < requestScope.page.totalPage}">
                 <a href="showAllArticle.action?pageNum=${requestScope.page.pageNum-1}">上一页</a>
                <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">    
                    <c:if test="${requestScope.page.pageNum == i}">
                         ${i}
                    </c:if>            
                    <c:if test="${requestScope.page.pageNum != i}">
                         <a href="showAllArticle.action?pageNum=${i}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="showAllArticle.action?pageNum=${requestScope.page.pageNum+1}">下一页</a>    
             </c:if>
<%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>             
  			<c:if test="${requestScope.page.pageNum == requestScope.page.totalPage}">
                <a href="showAllArticle.action?pageNum=${requestScope.page.pageNum-1}">上一页</a>
                 <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">
                     <c:if test="${requestScope.page.pageNum == i}">
                        ${i}
                     </c:if>
                     <c:if test="${requestScope.page.pageNum != i}">
                        <a href="showAllArticle.action?pageNum=${i}">${i}</a>                                        
                     </c:if>                
                </c:forEach>
            </c:if>  
</div>             
    </div>
    	
    </div>
</div>
</body>

</body>
</html>