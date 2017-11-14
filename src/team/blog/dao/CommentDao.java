package team.blog.dao;
/**
 * ����DAO�������ο�ֻ�ܷ������۲���Ҫɾ�����޸ģ������Ȩ�޸�����Ա�ɡ�
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
	 * ��������
	 * @param obj
	 */
	public void save(Comment obj){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();//����һ������
				Timestamp d = new Timestamp(System.currentTimeMillis());
				obj.setCommentDate(d);
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
			 Object obj=session.get(Comment.class, id);//��ȡ��������󡣶�λ�������
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
	public void update(Comment obj){
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
	public Comment getById(int i){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Comment comment=(Comment)session.get(Comment.class, i);
			 //��Ӳ���
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
	 * ����ʱ���id��ȡ����,
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
			 
			 //��Ӳ���
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
	 * ����ʱ���ȡ��������:�ù������ڻ�ȡ������Ϣ�����������ۣ�����ʱ�併��
	 */
	public List<Comment> geAllComment(){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Query query=session.createQuery("from Comment com order by com.commentDate desc");
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
	public List<Comment> queryByPage(int pageNum, int pagesize) {
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		try{
			 tx=session.beginTransaction();
			  
			 Query query=session.createQuery("from Comment art order by art.commentDate desc");
				query.setMaxResults(pagesize);
				//�������
				query.setFirstResult(pageNum);
			 List<Comment> commentlist=query.list();
			 
			 //��Ӳ���
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
