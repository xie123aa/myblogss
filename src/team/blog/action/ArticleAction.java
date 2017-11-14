package team.blog.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import team.blog.po.Article;
import team.blog.service.ArticleService;
import team.blog.service.ComentService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleAction extends ActionSupport{
	ActionContext context = ActionContext.getContext();  
	
    HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
    ActionContext actionContext = ActionContext.getContext();
    		  
    HttpSession session = ServletActionContext.getRequest().getSession();
    ArticleService s=new ArticleService();
	public String delete()throws Exception{
		
	    session.setAttribute("manage", 1);

	    int id=Integer.parseInt(request.getParameter("id"));

	    s.delete(id);
	    

		
		return SUCCESS;
		
	}
	/**
	 * 发布文章
	 * @return
	 * @throws Exception
	 */
	public String publish()throws Exception{
		String publish="publish";
		Article article=new Article();
		
		String content=request.getParameter("content");
		article.setContent(content);
		String title=request.getParameter("title");
		article.setTitle(title);
		int type=Integer.parseInt(request.getParameter("type"));
		//转换类型
		String turntype=s.turn(type);
		article.setType(turntype);
		s.savaArticle(article);

		

		
		return publish;
		
	}
	/**
	 * 修改文章
	 */
	public String amend()throws Exception{
		String amend="amend";
		int id=Integer.parseInt(request.getParameter("id"));
		Article art=new Article();
		art=s.getArticle(id);
		request.setAttribute("art", art);

		

		
		return amend;
		
	}
	/**
	 * 修改文章
	 */
	public String update()throws Exception{
		String update="update";
		int id=Integer.parseInt(request.getParameter("id"));
		Article art=new Article();
		art=s.getArticle(id);
		String content=request.getParameter("content");
		art.setContent(content);
		String title=request.getParameter("title");
		art.setTitle(title);
		int type=Integer.parseInt(request.getParameter("type"));
		String turntype=s.turn(type);
		art.setType(turntype);
		Timestamp d = new Timestamp(System.currentTimeMillis());
		art.setDate(d);
		s.updateArticle(art);

		

		
		return update;
		
	}
}
