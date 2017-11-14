package team.blog.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jgroups.tests.perf.Data;
import org.junit.Test;

import team.blog.po.Article;
import team.blog.service.ShowArticleService;
import team.blog.util.HibernateUtils;
import team.blog.util.Page;
import team.blog.dao.ArticleDao;


/**
 * 测试articledao的功能
 * @author george
 *
 */
public class ArticleDaoTest {
	ArticleDao dao=new ArticleDao();

	@Test
	public void testSave() {
		Article article=new Article();
		article.setType("web前端");
		article.setClickhit(0);
		article.setContent("杨涛12");
		Timestamp d = new Timestamp(System.currentTimeMillis());
		article.setDate(d);
		
		dao.save(article);
	}
	
	
	@Test
	public void testUpdate() {
		Article article=new Article();
		for(int i=4;i<=11;i++){
			article=dao.getById(i);//要更新操作先要获取这个对象的实体（通过ID进行获取）
			article.setTitle("儿子杨涛"+i);
			dao.update(article);
		}

	}

	@Test
	public void testGetById() {
		Article article=new Article();
		article=dao.getById(2);
		System.out.println(article.getContent());
	}
	@Test
	public void testquery(){
		Session session=(Session) HibernateUtils.openSession();
		Transaction tx=null;
		Query query=session.createQuery("from Article art order by art.date desc");
		List articlelist=query.list();
		for(int i=0;i<articlelist.size();i++)
		{	
			Article a=new Article();
			 a=(Article)articlelist.get(i);
			System.out.println(a.getContent());
		}
	
			  

		session.close();

	}
	@Test
	public void testDelete(){
		dao.delete(1);

		
	}
	@Test
	public void testQ(){
		List<Article> articlelist=dao.queryByPage(0, 5);
		for(int i=0;i<articlelist.size();i++)
		{	
			Article a=new Article();
			 a=(Article)articlelist.get(i);
			System.out.println(a.getContent());
		}

		
	}
	
	
	@Test
	public void testShow(){
		ShowArticleService s=new ShowArticleService();
		Page bn=s.findAllArtcleWithPage(1, 5);
		List<Article> list=bn.getList();
		for(int i=0;i<list.size();i++){
			Article a=list.get(i);
			System.out.println(a.getContent());
		}
		System.out.println(bn.getPageNum());
		System.out.println(bn.getTotalRecord());
		System.out.println(bn.getTotalPage());
	}
	@Test
	public void testGetByType(){
		ShowArticleService s=new ShowArticleService();
		Page pb=s.findAllArtcleWithType(2,5,"移动开发");
		List<Article> list=pb.getList();
		System.out.println(list.size());
		System.out.println(list.get(0).getContent());
	}
	@Test
	public void test111(){
		{
			Session session=(Session) HibernateUtils.openSession();
			Transaction tx=null;
			try{
				Article art=new Article();
				art.setTitle("1111");
				 tx=session.beginTransaction();
				 String hql="update Article art set art.title= 'asdad' where art.id='14'";
				 Query queryupdate=session.createQuery(hql);
				 int ret=queryupdate.executeUpdate();
				 
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
	
	

}
