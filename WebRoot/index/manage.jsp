<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <!--使用jsp标准库要引入taglib，不同功能对应不同的引用  -->
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
a{TEXT-DECORATION:none}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<div id=title"><%@include file="blogmanage.jsp" %></div>
<h1 >发布的文章</h1>
<body>
<table border="0">
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

   <br>
	</c:forEach>
</table>
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
			<script>
			    var isAnonymous = document.getElementById("isanonymous").value;
                var nickname = document.getElementById("nickname").value;
                if (isAnonymous == true) {
                    nickname = "匿名";
                }
			var length;
			length = 6;
			document.getElementById("demo").innerHTML = "段落已修改。";
			</script>
</body>
</html>