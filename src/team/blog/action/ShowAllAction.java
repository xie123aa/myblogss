package team.blog.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import team.blog.po.Article;
import team.blog.service.ArticleService;
import team.blog.service.ShowArticleService;
import team.blog.util.Page;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import freemarker.template.utility.Execute;

public class ShowAllAction extends ActionSupport {
	int pageSize=5;//��ҳ����ʾ��С���������ݿ��в�ѯ�ļ�¼��Ŀ
	int pageNum=1;//��ǰҳ���ҳ��
	public  String execute(){
//		HttpServletRequest request = ServletActionContext.getRequest();
//	HttpSession session =request.getSession();
		ActionContext context = ActionContext.getContext();  
	    HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);  
//		session.setAttribute("ip", request.getRemoteAddr());
	    HttpSession session = ServletActionContext.getRequest().getSession();
	    request.setAttribute("user", request.getRemoteAddr());
		//����IP�Ƿ���
		ShowArticleService service=new ShowArticleService();
		if(request.getParameter("pageNum")==null){
			pageNum=1;
		}
		else{
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}

//		if(Integer.valueOf(request.getParameter("pageNum"))!=1)//�ظ��������
//		{
//			pageNum=Integer.valueOf(request.getParameter("pageNum"));//�����¼Ҫ��ǰ�˵���
//		}
		Page pb=service.findAllArtcleWithPage(pageNum, pageSize);
		request.setAttribute("page", pb);
		List<Article> list=pb.getList();
		request.setAttribute("list", list);
		//���ҵ������2�ˣ�һ�θ��οͣ�һ�θ�����������ִ����ͬ��ҵ���߼������ز�ͬ����ͼ
		String value=request.getParameter("manage");
		String manage="manage";
		if(value!=null)
		{
			return manage;
		}
		
//		
		return SUCCESS;
		
		
	}
	//ͨ����������չʾ����
	
	
	public  String sort(){

		ActionContext context = ActionContext.getContext();  
	    HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);  
		ShowArticleService service=new ShowArticleService();
		if(request.getParameter("pageNum")==null){
			pageNum=1;
		}
		else{
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		String sort="sort";
		int type=Integer.parseInt(((String)request.getParameter("type")));
		request.setAttribute("type", type);
		if(type==10){
			Page pb=service.findAllArtcleWithPage(pageNum, pageSize);
			request.setAttribute("page", pb);
			List<Article> list=pb.getList();
			request.setAttribute("list", list);
			return sort;
			
		}
		ArticleService s=new ArticleService();
		String turntype=s.turn(type);
		
		Page pb=service.findAllArtcleWithType(pageNum, pageSize,turntype);
		request.setAttribute("page", pb);
		List<Article> list=pb.getList();
		request.setAttribute("list", list);
		//���ҵ������2�ˣ�һ�θ��οͣ�һ�θ�����������ִ����ͬ��ҵ���߼������ز�ͬ����ͼ
		return sort;
		
		
	}
	/**
	 * �ο�ִ�е�ҵ���߼�
	 */
	public  String sort2(){

		ActionContext context = ActionContext.getContext();  
	    HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);  
		ShowArticleService service=new ShowArticleService();
		if(request.getParameter("pageNum")==null){
			pageNum=1;
		}
		else{
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		String sort2="sort2";
		int type=Integer.parseInt(((String)request.getParameter("type")));
		request.setAttribute("type", type);
		if(type==10){
			Page pb=service.findAllArtcleWithPage(pageNum, pageSize);
			request.setAttribute("page", pb);
			List<Article> list=pb.getList();
			request.setAttribute("list", list);
			return sort2;
			
		}
		ArticleService s=new ArticleService();
		String turntype=s.turn(type);
		
		Page pb=service.findAllArtcleWithType(pageNum, pageSize,turntype);
		request.setAttribute("page", pb);
		List<Article> list=pb.getList();
		request.setAttribute("list", list);
		//���ҵ������2�ˣ�һ�θ��οͣ�һ�θ�����������ִ����ͬ��ҵ���߼������ز�ͬ����ͼ
		return sort2;
		
		
	}

}
