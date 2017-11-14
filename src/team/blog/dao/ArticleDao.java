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
 * �������µĽӿ�
 * @author george
 *
 */
public class ArticleDao {
	
	/**
	 * ��������
	 */
	public void save(Article obj){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();//����һ������
			 Timestamp d = new Timestamp(System.currentTimeMillis());
				obj.setDate(d);
				obj.setReplyhit(0);
				obj.setLikehit(0);
				obj.setClickhit(0);
			session.save(obj);
			tx.commit();//�ύ
		}
		catch(RuntimeException e){
			tx.rollback();
			throw e;
		}
		finally{
		session.close();//�ر�session�ͷ���Դ
		}
		
	}
	/**
	 * ɾ������
	 */
	public void delete(int id){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			 Object obj=session.get(Article.class, id);//��ȡ��������󡣶�λ�������
			 session.delete(obj);//ɾ��
			  
			 
			 //��Ӳ���
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
	 * �޸�����
	 */
	public void update(Article obj){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 session.update(obj);
			 //��Ӳ���
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
	 * ��ȡ����
	 */
	public Article getById(int i){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Article resoure=(Article)session.get(Article.class, i);
			 //��Ӳ���
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
	 * ����ʱ���ȡ����:�ù������ڻ�ȡ������Ϣ����ʱ�併��
	 */
	public List<Article> getByTime(){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Query query=session.createQuery("from Article art order by art.date desc");
			 List articlelist=query.list();
			 
			 //��Ӳ���
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
	 * ��Ϸ�ҳ����ȡ����
	 */
	public List<Article> queryByPage(int pageNum, int pagesize) {
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Query query=session.createQuery("from Article art order by art.date desc");
				query.setMaxResults(pagesize);
				//�������
				query.setFirstResult(pageNum);
			 List<Article> articlelist=query.list();
			 
			 //��Ӳ���
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
	 * �������ͻ�ȡ���������������������ڷ�ҳ��
	 */
	public List<Article> getByType(String type){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Query query=session.createQuery("from Article art where art.type=? order by art.date desc").setParameter(0, type);
			 List articlelist=query.list();
			 
			 //��Ӳ���
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
* ��Ϸ�ҳ����ȡ����
* */
	public List<Article> queryByType(int pageNum, int pagesize,String type) {
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Query query=session.createQuery("from Article art where art.type=? order by art.date desc").setParameter(0, type);
				query.setMaxResults(pagesize);
				//�������
				query.setFirstResult(pageNum);
			 List<Article> articlelist=query.list();
			 
			 //��Ӳ���
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
			 //��Ӳ���
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
