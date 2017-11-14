package team.blog.dao;
/**
 * 评论DAO，对于游客只能发表评论不需要删除，修改，把这个权限给管理员吧。
 */

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import team.blog.po.Article;
import team.blog.po.Comment;
import team.blog.util.HibernateUtils;

public class CommentDao {
	
	
	/**
	 * 储存评论
	 * @param obj
	 */
	public void save(Comment obj){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();//返回一个事务
				Timestamp d = new Timestamp(System.currentTimeMillis());
				obj.setCommentDate(d);
			session.save(obj);
			tx.commit();//提交
		}
		catch(RuntimeException e){
			tx.rollback();
			throw e;
		}
		finally{
		session.close();//关闭session释放资源
		}
		
	}
	/**
	 * 删除评论
	 */
	public void delete(int id){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			 Object obj=session.get(Comment.class, id);//获取到这个对象。定位这个对象
			 session.delete(obj);//删除
			  
			 
			 //添加操作
			tx.commit();
		}
		catch(RuntimeException e){
			tx.rollback();
			throw e;
		}
		finally{
		session.close();
		}
		
		
	}
	/**
	 * 修改评论
	 */
	public void update(Comment obj){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 session.update(obj);
			 //添加操作
			tx.commit();
		}
		catch(RuntimeException e){
			tx.rollback();
			throw e;
		}
		finally{
		session.close();
		}
		
	}
	/**
	 * 获取评论
	 */
	public Comment getById(int i){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Comment comment=(Comment)session.get(Comment.class, i);
			 //添加操作
			tx.commit();
			return comment;
		}
		catch(RuntimeException e){
			tx.rollback();
			throw e;
		}
		finally{
		session.close();
		}
		
	}
	/**
	 * 依据时间和id获取评论,
	 * 
	 */
	public List<Comment> getByTime(int id){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  Article article=new Article();
			  ArticleDao dao=new ArticleDao();
			  article =dao.getById(id);
			 Query query=session.createQuery("from Comment art  where art.article="+id+" order by art.commentDate desc");
			 List commentlist=query.list();
			 
			 //添加操作
			tx.commit();
			return commentlist;
		}
		catch(RuntimeException e){
			tx.rollback();
			throw e;
		}
		finally{
		session.close();
		}	
	}
	/**
	 * 依据时间获取所有评论:该功能用于获取评论信息（共多少评论），以时间降序
	 */
	public List<Comment> geAllComment(){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Query query=session.createQuery("from Comment com order by com.commentDate desc");
			 List articlelist=query.list();
			 
			 //添加操作
			tx.commit();
			return articlelist;
		}
		catch(RuntimeException e){
			tx.rollback();
			throw e;
		}
		finally{
		session.close();
		}	
	}
	
	/**
	 * 配合分页器获取文章
	 */
	public List<Comment> queryByPage(int pageNum, int pagesize) {
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Query query=session.createQuery("from Comment art order by art.commentDate desc");
				query.setMaxResults(pagesize);
				//设置起点
				query.setFirstResult(pageNum);
			 List<Comment> commentlist=query.list();
			 
			 //添加操作
			tx.commit();
			return commentlist;
		}
		catch(RuntimeException e){
			tx.rollback();
			throw e;
		}
		finally{
//		session.close();
		}								
					
	}

}
