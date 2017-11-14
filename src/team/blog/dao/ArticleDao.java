package team.blog.dao;


import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import team.blog.po.Article;
import team.blog.util.HibernateUtils;

/**
 * 保存文章的接口
 * @author george
 *
 */
public class ArticleDao {
	
	/**
	 * 保存文章
	 */
	public void save(Article obj){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();//返回一个事务
			 Timestamp d = new Timestamp(System.currentTimeMillis());
				obj.setDate(d);
				obj.setReplyhit(0);
				obj.setLikehit(0);
				obj.setClickhit(0);
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
	 * 删除文章
	 */
	public void delete(int id){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			 Object obj=session.get(Article.class, id);//获取到这个对象。定位这个对象
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
	 * 修改文章
	 */
	public void update(Article obj){
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
	 * 获取文章
	 */
	public Article getById(int i){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Article resoure=(Article)session.get(Article.class, i);
			 //添加操作
			tx.commit();
			return resoure;
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
	 * 依据时间获取文章:该功能用于获取博客信息，以时间降序
	 */
	public List<Article> getByTime(){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Query query=session.createQuery("from Article art order by art.date desc");
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
	public List<Article> queryByPage(int pageNum, int pagesize) {
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Query query=session.createQuery("from Article art order by art.date desc");
				query.setMaxResults(pagesize);
				//设置起点
				query.setFirstResult(pageNum);
			 List<Article> articlelist=query.list();
			 
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
	 * 依据类型获取文章总数，文章总数用于分页器
	 */
	public List<Article> getByType(String type){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Query query=session.createQuery("from Article art where art.type=? order by art.date desc").setParameter(0, type);
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
* */
	public List<Article> queryByType(int pageNum, int pagesize,String type) {
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Query query=session.createQuery("from Article art where art.type=? order by art.date desc").setParameter(0, type);
				query.setMaxResults(pagesize);
				//设置起点
				query.setFirstResult(pageNum);
			 List<Article> articlelist=query.list();
			 
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
	public void updateReply(Article obj){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			 String hql="update Article art set art.title="+obj.getTitle() +"where user.age=18";
			 Query queryupdate=session.createQuery(hql);
			 int ret=queryupdate.executeUpdate();
			 
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
	
	
}
