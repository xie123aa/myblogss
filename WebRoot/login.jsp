<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
		 <h2>博客登录</h2>
            <form  action="login.action" method="post"  >
              <div>
                <label>用户名:</label>
                <input type="text" name="username" />
              </div>
              <div>
                <label>密码:</label>
                <input type="password" name="password" />
              </div>
              <div>
                <label></label>
                <div class="clear"> </div>
              </div>
              <div class="button_wrapper">
                <input name="提交" type="submit" class="button" value="登录" />
              </div>
              </form>
              <h2><a href="showAllArticle.action?pageNum=1">游客登录</a></h2>
				
</body>
</html>