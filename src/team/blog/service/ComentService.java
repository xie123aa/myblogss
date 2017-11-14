package team.blog.service;

import java.util.List;

import team.blog.dao.ArticleDao;
import team.blog.dao.CommentDao;
import team.blog.po.Article;
import team.blog.po.Comment;
import team.blog.util.Page;

public class ComentService {
	ArticleDao articledao=new ArticleDao();
	CommentDao dao=new CommentDao();
	public List<Comment> getComment(int id){
		
		List<Comment> list=dao.getByTime(id);
		return list;
	}
	/**
	 * ±£¥Ê∆¿¬€
	 * @param content
	 * @param userid
	 * @param id
	 */
	public void saveComment(String content,String userid,int id){
		Comment conmment=new Comment();
		conmment.setUserid(userid);
		conmment.setContent(content);
		Article article=new Article();
			
		article=articledao.getById(id);
		article.setReplyhit(article.getReplyhit()+1);
		conmment.setArticle(article);
		articledao.update(article);
		CommentDao dao=new CommentDao();
			dao.save(conmment);
		
		
	}
	public Page<Comment> findAllComment(int pageNum,int pageSize)
	{
		List<Comment> co=dao.geAllComment();
		int totalRecord=co.size();
		Page pb=new Page(pageNum, pageSize, totalRecord);
		int startindex=pb.getStartIndex();
		List<Comment> comment=dao.queryByPage(startindex, pageSize);
		pb.setList(comment);
		return pb;
	}
	public void delete(int id) {
		dao.delete(id);
	}
	public Comment getOnly(int id)
	{
		Comment comment=dao.getById(id);
		return comment;
	}
}
