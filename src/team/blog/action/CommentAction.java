package team.blog.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import team.blog.po.Article;
import team.blog.po.Comment;
import team.blog.service.ArticleService;
import team.blog.service.ComentService;
import team.blog.util.HibernateUtils;
import team.blog.util.Page;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommentAction extends ActionSupport{
	int pageNum;
	int pageSize=10;
	ComentService coments=new ComentService();
	ArticleService articles=new ArticleService();
	ActionContext context = ActionContext.getContext();  
    HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);

	public String getcomment()throws Exception{
		 
		if(request.getParameter("pageNum")==null){
			pageNum=1;
		}
		else{
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		Page<Comment> pb=coments.findAllComment(pageNum, pageSize);
		request.setAttribute("page", pb);
		List<Comment> list=pb.getList();
		List<Article> art = new ArrayList<Article>();
		for(int i=0;i<list.size();i++){
			Article a=(Article)list.get(i).getArticle();
			art.add((a));		
			}
		request.setAttribute("art", art);
		request.setAttribute("list", list);
		

		
		return SUCCESS;
	
	}
	 
	
	public String delete() throws Exception{
		int commentid=Integer.parseInt(request.getParameter("id"));
		/**
		 * 文章评论减一
		 */
		int aritcleid=coments.getOnly(commentid).getArticle().getId();
		Article amend=articles.getArticle(aritcleid);
		amend.setReplyhit(amend.getReplyhit()-1);
		articles.updateArticle(amend);
		
		
		coments.delete(commentid);
		String delete="delete";
		if(request.getParameter("pageNum")==null){
			pageNum=1;
		}
		else{
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		Page<Comment> pb=coments.findAllComment(pageNum, pageSize);
		request.setAttribute("page", pb);
		List<Comment> list=pb.getList();
		List<Article> art = new ArrayList<Article>();
		for(int i=0;i<list.size();i++){
			Article a=(Article)list.get(i).getArticle();
			art.add((a));		
			}
		request.setAttribute("art", art);
		request.setAttribute("list", list);
		return delete;
		
	}
	/**
	 * 回复操作
	 */
	public String reply() throws Exception{
		int commentid=Integer.parseInt(request.getParameter("id"));

		int id=coments.getOnly(commentid).getArticle().getId();
		
		String reply="reply";
		Article article=articles.getArticle(id);

		
		request.setAttribute("article", article);
		ComentService service=new ComentService();
		List<Comment> comment =service.getComment(id);//依据ID获取评论
		request.setAttribute("comment",comment);
		request.setAttribute("size", comment.size());
		request.setAttribute("id", id);
		
		
		return reply;
		
	}
	
	
	

	

}