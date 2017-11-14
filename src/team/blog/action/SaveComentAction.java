package team.blog.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import team.blog.dao.CommentDao;
import team.blog.po.Article;
import team.blog.po.Comment;
import team.blog.service.ArticleService;
import team.blog.service.ComentService;
import team.blog.util.HibernateUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SaveComentAction extends ActionSupport{
	public String execute()throws Exception{
		ActionContext context = ActionContext.getContext(); 
		HttpSession session = ServletActionContext.getRequest().getSession();
	    HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
	    String userid="";
	    if(session.getAttribute("user")!=null){
	    	userid=(String) session.getAttribute("user");
	    }
	    else{
	    	userid=request.getRemoteAddr();
	    }
	    int id=Integer.parseInt(request.getParameter("articleid"));
	    String content= request.getParameter("content");
	    ComentService service=new ComentService();
	    service.saveComment(content, userid,id);
	    request.setAttribute("id", id);

		return SUCCESS;
		
	}
	

}
