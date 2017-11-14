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
<div id=title"><%@include file="blogmanage.jsp" %></div>
<title>Insert title here</title>
</head>
<body>
<h1>评论管理</h1>
<table border="0">
<tr>
        <th>内容</th>
        <th>作者</th>
        <th>时间</th>
        <th>评论文章</th>
        <th>操作</th>  
         
 </tr>
	<c:forEach  items="${requestScope.list}" var="i" varStatus="loop">
   

    <tr>
        <td>${i.content}</td>
        <td>${i.userid}</td>
        <td>${i.commentDate}</td>
		<td><a href="${pageContext.request.contextPath }/showArticle.action?id=${requestScope.art[loop.count-1].id}">${requestScope.art[loop.count-1].title}</a></td>
        <td><a href="${pageContext.request.contextPath }/removecomment.action?id=${i.id}">删除</a>   <a href="reply.action?id=${i.id}">回复</a> 
        </td>
        
    </tr>

   <br>
	</c:forEach>
</table>
共有${requestScope.page.totalPage}页,当前为第${requestScope.page.pageNum}页
<!--首页，下一页  -->			
			<a href="getcomment.action?pageNum=1">首页</a>
			
<!--翻页时进行判断jsp标准标签库	 -->
<%--如果只有一页没有上一页下一页 --%>
             <c:if test="${requestScope.page.pageNum ==1&&requestScope.page.pageNum==requestScope.page.totalPage}">
                <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">
                    <c:if test="${requestScope.page.pageNum == i}">
                         ${i}
                    </c:if>                
                    <c:if test="${requestScope.page.pageNum != i}">
                         <a href="getcomment.action?pageNum=${i}">${i}</a>                                        
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
                         <a href="getcomment.action?pageNum=${i}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="getcomment.action?pageNum=${requestScope.page.pageNum+1}">下一页</a>                    
             </c:if>
 <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
            <c:if test="${requestScope.page.pageNum > 1 && requestScope.page.pageNum < requestScope.page.totalPage}">
                 <a href="getcomment.action?pageNum=${requestScope.page.pageNum-1}">上一页</a>
                <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">    
                    <c:if test="${requestScope.page.pageNum == i}">
                         ${i}
                    </c:if>            
                    <c:if test="${requestScope.page.pageNum != i}">
                         <a href="getcomment.action?pageNum=${i}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="getcomment.action?pageNum=${requestScope.page.pageNum+1}">下一页</a>    
             </c:if>
<%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>             
  			<c:if test="${requestScope.page.pageNum == requestScope.page.totalPage&&requestScope.page.pageNum !=1}">
                <a href="getcomment.action?pageNum=${requestScope.page.pageNum-1}">上一页</a>
                 <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">
                     <c:if test="${requestScope.page.pageNum == i}">
                        ${i}
                     </c:if>
                     <c:if test="${requestScope.page.pageNum != i}">
                        <a href="getcomment.action?pageNum=${i}">${i}</a>                                        
                     </c:if>                
                </c:forEach>
            </c:if>  
			

</body>
</html>