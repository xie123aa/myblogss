package team.blog.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import team.blog.po.Article;
import team.blog.po.Comment;
import team.blog.service.ComentService;
import team.blog.service.HitArticleService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ShowArticle extends ActionSupport {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public String execute() throws Exception{
		
		
		ActionContext context = ActionContext.getContext(); 
		HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
		String value=request.getParameter("id");
		if(value==null)//从网页和服务器传递来的ID参数进行获取，parametrer与attribute进行区分
		{
			id=(Integer) request.getAttribute("id");
		}
		else{
			id=Integer.valueOf(request.getParameter("id"));
		}
		
		HitArticleService hit=new HitArticleService();
		Article article=hit.GetAndUpdate(id);
		request.setAttribute("article", article);
		//获取评论
		ComentService service=new ComentService();
		List<Comment> comment =service.getComment(id);//依据ID获取评论
		request.setAttribute("comment",comment);
		request.setAttribute("size", comment.size());
		request.setAttribute("id", id);
		return SUCCESS;
		
	}
	
	



}
