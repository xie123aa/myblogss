package team.blog.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.jgroups.tests.adaptjms.Request;

import team.blog.po.Article;
import team.blog.po.Bloger;
import team.blog.service.ArticleService;
import team.blog.service.ShowArticleService;
import team.blog.util.Page;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class LoginAction extends ActionSupport{
	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	HttpServletRequest request = ServletActionContext.getRequest();
	 HttpSession session = ServletActionContext.getRequest().getSession();
	/**
	 * 主方法
	 */
	public String execute() throws Exception {

		Bloger user = new Bloger();
		user.setUsername(username);
		user.setPassword(password);
		String blog=null;
		if( (String) session.getAttribute("user")!= null){
			 blog=(String) session.getAttribute("user");
			 System.out.println(blog);
			 if(blog.equals("博主")){
				 ShowArticleService s=new ShowArticleService();
					Page pb=s.findAllArtcleWithPage(1, 5);
					request.setAttribute("page", pb);
					List<Article> list=pb.getList();
					request.setAttribute("list", list);
					request.setAttribute("type", 10);
				 return SUCCESS;
			 }
		}
		
		//获得request

		if(user.getUsername().equals("xie123")||user.getPassword().equals("123456")) {
			request.setAttribute("url", "user/getBlogInfo.action");
			request.setAttribute("info", "登陆成功");
			request.setAttribute("type", 0);
		//带入数据到前端，不必了，通过其他action
//			ShowArticleService service=new ShowArticleService();
//			Page pb=service.findAllArtcleWithPage(1, 5);
//			request.setAttribute("page", pb);
//			List<Article> list=pb.getList();
//			System.out.println(list.get(2).getContent());
//			request.setAttribute("list", list);
//			
			
			//将username保存到session范围中
//			HttpSession session =request.getSession();
//			Map session = ActionContext.getContext().getSession();
//			session.setAttribute("username", username);	
//			session.put("username", username);
		   
			session.setAttribute("user", "博主");
			ShowArticleService s=new ShowArticleService();
			Page pb=s.findAllArtcleWithPage(1, 5);
			request.setAttribute("page", pb);
			List<Article> list=pb.getList();
			request.setAttribute("list", list);
			return SUCCESS;
		} else {
			request.setAttribute("url", "login.jsp");
			request.setAttribute("info", "登陆失败");
			return ERROR;
		}
	}

}
