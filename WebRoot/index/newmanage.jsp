<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
            <!--使用jsp标准库要引入taglib，不同功能对应不同的引用  -->
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
    .bottom{
        width:1000px;
        height:800px;
        padding-top: 5px;
        position: relative;
        margin: auto;
    }
    .left{
        margin-top: 5px;
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
        width:790px;
        height:800px;
        float: right;
        border-color: #C0C0C0;
        border-style: solid;
        border-width: 1px;
        margin-left: 5px;
    }
    .essay-management{
        width:100%;
    height:20px;
    background-color:#FFE4E1;
    }
    .text1{  
        width: 100%;
        height: 500px;
        border-style: solid;
        border-color: #C0C0C0;
        border-width: 1px;}
    .text2{
        width:100%;
        height:20px;
        background-color:#FFE4E1;
    }
    .array{
        list-style-position: inside;
        margin-left: 20px;
        margin-top: 30px;
        color: black;
        font-size: 15px;
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

    </style>
<body>
  <div id="blog-top" class="blog-top">
            <div class="userface" >
              <img src="${pageContext.request.contextPath }/index/image/userimg.png" width="80" height="80"/>
                
            </div>
            <div class="blogtwo">
            <div class="blogname">
                <font face="微软雅" size="5" color="#F8F8FF">计算机2班的博客</font>
                <br><br>
              
            </div>
            <div class="bloglead">
              <span><a href="${pageContext.request.contextPath }/login.action">首页&brvbar;</a> </span>
              <span><a href="${pageContext.request.contextPath }/showAllArticle.action?manage=1">博文目录&brvbar;</a></span>
              <span><a href="${pageContext.request.contextPath }/getcomment.action">评论管理</a></span>
            </div>
            </div>
                         <div class="fabiao"> <font face="楷体" size="6" color="#808080"><a href="postedit.jsp"><strong>发表</strong></a></font></div>
     </div>
     
     <div class="bottom">
               <div class="left">
        <div class="information"><font size="1" color="#A9A9A9"><b>个人资料</b></font></div>
        <div class="userimg" align="center"><img src="${pageContext.request.contextPath }/index/image/userimg.png" width="150" height="150"/></div>
        <div class="username"><font face="微软雅黑" size="3" color="#708090">计算机2班的博客</font></div>
        <div class="user-information">安徽理工大学计算机2班有36人，其中女生8人，男生28人。</div>
        </div>
        <div class="right">
            <div class="allessay">
            <div class="text2"><font size="1" color="#A9A9A9">全部博文</font></div>
 <div style="font-size:20px;">           <table border="0">
<tr>
        <th>标题</th>
        <th>阅读数</th>
        <th>类型</th>
        <th>发布时间</th>
        <th>评论数</th>
        <th>操作</th>  
         
 </tr>
	<c:forEach  items="${requestScope.list}" var="i" begin="0" end="5">
   

    <tr>
        <td>${i.title}</td>
        <td>${i.clickhit}</td>
        <td>${i.type}</td>
        <td>${i.date}</td>
        <td>${i.replyhit}</td>
        <td><a href="remove.action?id=${i.id}&manage=1">删除</a>   <a href="amend.action?id=${i.id}">编辑</a> 
        </td>
        
    </tr>
	</c:forEach>
</table>
</div>
<div style="font-size:20px;"> 
共有${requestScope.page.totalPage}页,当前为第${requestScope.page.pageNum}页
<!--首页，下一页  -->			
			<a href="showAllArticle.action?pageNum=1&&manage=1">首页</a>
			
<!--翻页时进行判断jsp标准标签库	 -->
<%--如果只有一页没有上一页下一页 --%>
             <c:if test="${requestScope.page.pageNum ==1&&requestScope.page.pageNum==requestScope.page.totalPage}">
                <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">
                    <c:if test="${requestScope.page.pageNum == i}">
                         ${i}
                    </c:if>                
                    <c:if test="${requestScope.page.pageNum != i}">
                         <a href="showAllArticle.action?pageNum=${i}&&manage=1">${i}</a>                                        
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
                         <a href="showAllArticle.action?pageNum=${i}&&manage=1">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="showAllArticle.action?pageNum=${requestScope.page.pageNum+1}&&manage=1">下一页</a>                    
             </c:if>
 <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
            <c:if test="${requestScope.page.pageNum > 1 && requestScope.page.pageNum < requestScope.page.totalPage}">
                 <a href="showAllArticle.action?pageNum=${requestScope.page.pageNum-1}&&manage=1">上一页</a>
                <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">    
                    <c:if test="${requestScope.page.pageNum == i}">
                         ${i}
                    </c:if>            
                    <c:if test="${requestScope.page.pageNum != i}">
                         <a href="showAllArticle.action?pageNum=${i}&&manage=1">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="showAllArticle.action?pageNum=${requestScope.page.pageNum+1}&&manage=1">下一页</a>    
             </c:if>
<%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>             
  			<c:if test="${requestScope.page.pageNum == requestScope.page.totalPage&&requestScope.page.pageNum !=1}">
                <a href="showAllArticle.action?pageNum=${requestScope.page.pageNum-1}&&manage=1">上一页</a>
                 <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">
                     <c:if test="${requestScope.page.pageNum == i}">
                        ${i}
                     </c:if>
                     <c:if test="${requestScope.page.pageNum != i}">
                        <a href="showAllArticle.action?pageNum=${i}&&manage=1">${i}</a>                                        
                     </c:if>                
                </c:forEach>
            </c:if> 
            </div>
            </div>
        </div>
     </div>
</body>
</html>