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
	a:visited {color: blue}
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
    .blogtwo{
    	width:180px;
    	height:80px;
        float:left;
        display:inline;
        padding-top:140px;
        padding-left: 20px;
    }
    .blogname{
    width:180px;
    display:inline;
    text-align:center;
    }
    .userlead{
    width:180px;
    display:inline;
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
		        .fabiao{
    	width:90px;
    	height:50px;
        float:right;
        display:inline;
        background-image: url(${pageContext.request.contextPath }/index/image/flower.png);
        margin-right:300px;
        margin-top: 170px;
        border-width: 3px;
        border-style: outset;
        border-color: #C0C0C0;
        text-align: center;
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
                <br><br>
              
            </div>
            <div class="bloglead">
            	<span><a href="${pageContext.request.contextPath }/login.action">首页&brvbar;</a> </span>
              <span><a href="${pageContext.request.contextPath }/showAllArticle.action?manage=1">博文目录&brvbar; </a></span>
              <span><a href="${pageContext.request.contextPath }/getcomment.action">评论管理</a></span>
            </div>
            </div>
                        <div class="fabiao"> <font face="楷体" size="6" color="#808080"><a href="postedit.jsp"><strong>发表</strong></a></font></div>
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
        <li><a href="${pageContext.request.contextPath }/sort.action?type=1" target="content">移动开发</a></li>
	<li><a href="${pageContext.request.contextPath }/sort.action?type=2" target="content">web前端</a></li>
	<li><a href="${pageContext.request.contextPath }/sort.action?type=3" target="content">架构设计</a></li>
	<li><a href="${pageContext.request.contextPath }/sort.action?type=4" target="content">编程语言</a></li>
	<li><a href="${pageContext.request.contextPath }/sort.action?type=5" target="content">互联网</a></li>
	<li><a href="${pageContext.request.contextPath }/sort.action?type=6" target="content">数据库</a></li>
	<li><a href="${pageContext.request.contextPath }/sort.action?type=7" target="content">系统运维</a></li>
	<li><a href="${pageContext.request.contextPath }/sort.action?type=8" target="content">云计算</a></li>
	<li><a href="${pageContext.request.contextPath }/sort.action?type=9" target="content">研发管理</a></li>
	<li><a href="${pageContext.request.contextPath }/sort.action?type=10" target="content">综合</a></li>
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
			<a href="sort.action?pageNum=1&type=${requestScope.type}">首页</a>
共有${requestScope.page.totalPage}页,当前为第${requestScope.page.pageNum}页
			
<!--翻页时进行判断jsp标准标签库	 -->
<%--如果只有一页没有上一页下一页 --%>
             <c:if test="${requestScope.page.pageNum ==1&&requestScope.page.pageNum==requestScope.page.totalPage}">
                <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">
                    <c:if test="${requestScope.page.pageNum == i}">
                         ${i}
                    </c:if>                
                    <c:if test="${requestScope.page.pageNum != i}">
                         <a href="sort.action?pageNum=${i}&type=${requestScope.type}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                                   
             </c:if>
 <%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>	
             <c:if test="${requestScope.page.pageNum ==1&&requestScope.page.pageNum!=requestScope.page.totalPage}">
                <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">
                    <c:if test="${requestScope.page.pageNum == i}">
                         ${i}
                    </c:if>                
                    <c:if test="${requestScope.page.pageNum != i}">
                         <a href="sort.action?pageNum=${i}&type=${requestScope.type}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="sort.action?pageNum=${requestScope.page.pageNum+1}&type=${requestScope.type}">下一页</a>                    
             </c:if>
 <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
            <c:if test="${requestScope.page.pageNum > 1 && requestScope.page.pageNum < requestScope.page.totalPage}">
                 <a href="sort.action?pageNum=${requestScope.page.pageNum-1}&type=${requestScope.type}">上一页</a>
                <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">    
                    <c:if test="${requestScope.page.pageNum == i}">
                         ${i}
                    </c:if>            
                    <c:if test="${requestScope.page.pageNum != i}">
                         <a href="sort.action?pageNum=${i}&type=${requestScope.type}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="sort.action?pageNum=${requestScope.page.pageNum+1}&type=${requestScope.type}">下一页</a>    
             </c:if>
<%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>             
  			<c:if test="${requestScope.page.pageNum == requestScope.page.totalPage&&requestScope.page.pageNum !=1}">
                <a href="sort.action?pageNum=${requestScope.page.pageNum-1}&type=${requestScope.type}">上一页</a>
                 <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">
                     <c:if test="${requestScope.page.pageNum == i}">
                        ${i}
                     </c:if>
                     <c:if test="${requestScope.page.pageNum != i}">
                        <a href="sort.action?pageNum=${i}&type=${requestScope.type}">${i}</a>                                        
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