<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    %>
    <%@ page import="team.blog.util.Page"%>
    <%@ page import="team.blog.po.Article"%>
    <%@ page import="java.util.List"%>
    <!--使用jsp标准库要引入taglib，不同功能对应不同的引用  -->
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>


	#nav {
    background-color:red;
    color:white;
	height:530px;
	width:180px;
	float:left;
	margin:0;padding:0;
    }
    #content {
    width:1000px;
    height:637px;
    float:left;	 
    text-align:center;
    font-size:35px;
 	margin:0;padding:0;	 
	}
	#foot {
	background-color:#FFA500;
	clear:both;
	text-align:center;
	font-size:25px;	
	margin:0;padding:0;
	}
	a{TEXT-DECORATION:none}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>这个页面用来展示文章</title>

</head>
<body>

<div ><%@include file="include.jsp" %></div>

<br>
<br>
<br>
<!--以IP标记用户  -->
<div id="nav"><%@include file="sort.jsp" %></div>

<!--获得分页器中取得的数据，循环遍历 ，需添加链接-->
<div id="content">
	
	
			<c:forEach  items="${requestScope.list}" var="i" begin="0" end="5">
   
   	<a href="showArticle.action?id=${i.id}" id="neirong" > <c:out value="${i.title}"/></a>
   	<div style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间:${i.date}&nbsp;点击数:${i.clickhit}&nbsp;评论数:${i.replyhit}</div>
<br>
	</c:forEach>
	
</div>			
			
			
<div id="foot">			
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
             

</body>
</html>