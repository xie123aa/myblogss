<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
        width: 790px;
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
    .back{
        text-align: right;
        float: right;
        display: inline;
        margin-right: 2px;
    }
    .table{
		float:top;
    }
    </style>
<body>
    <div id="blog-top" class="blog-top">
            <div class="userface" >
              <img src="${pageContext.request.contextPath }/index/image/userimg.png" width="80" height="80"/>
                
            </div>
            <div class="blogname">
                <font face="微软雅黑" size="5" color="#F8F8FF">梁姗姗的博客</font>
                <font face="微软雅黑" size="3"><a href="${pageContext.request.contextPath }/getcomment.action"> 刷新</a></font>
                <br><br>
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
    <div class="user-essay"><font size="1" color="#A9A9A9">&nbsp&nbsp博文
     <div class="back"><font size="1" color="#A9A9A9"><a href="${pageContext.request.contextPath }/login.action">返回</a> </div>
    </div>
<div style="font-size:20px;"class="table">
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
		<td ><a href="${pageContext.request.contextPath }/showArticle.action?id=${requestScope.art[loop.count-1].id}">${requestScope.art[loop.count-1].title}</a></td>
        <td><a href="${pageContext.request.contextPath }/removecomment.action?id=${i.id}">删除</a>   <a href="reply.action?id=${i.id}">回复</a> 
        </td>
        
    </tr>
	</c:forEach>
</table>
</div>
<div style="font-size:15px;" class="page">
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
            </div>
            

			
            </div>
    </div>
        
</div>
</body>
</html>