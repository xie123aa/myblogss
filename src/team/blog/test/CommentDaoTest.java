package team.blog.test;

import java.sql.Timestamp;
import java.util.List;

import org.junit.Test;

import team.blog.dao.ArticleDao;
import team.blog.dao.CommentDao;
import team.blog.po.Article;
import team.blog.po.Comment;

/**
 * ����ConmentDao�Ĺ���
 * @author george
 *
 */

public class CommentDaoTest {
	CommentDao dao=new CommentDao();
	ArticleDao dao1=new ArticleDao();

	@Test
	public void testSave() {
		 Comment comment=new Comment();
		 comment.setArticle(dao1.getById(3));
		 comment.setContent("��������2");
		 comment.setUserid("192.168.1.3");
		Timestamp d = new Timestamp(System.currentTimeMillis());
		comment.setCommentDate(d);
		
		dao.save(comment);
	}
	
	
	@Test
	public void testUpdate() {
		Comment article=new Comment();
		article=dao.getById(2);//Ҫ���²�����Ҫ��ȡ��������ʵ�壨ͨ��ID���л�ȡ��
		article.setContent("dsadsahdlafh");
		dao.update(article);
	}

	@Test
	public void testGetById() {
		Comment article=new Comment();
		article=dao.getById(2);
		System.out.println(article.getContent());
	}
	@Test
	public void testDelete(){
		dao.delete(1);

		
	}
	@Test
	public void testgetcomment(){
		List articlelist=dao.getByTime(3);
		for(int i=0;i<articlelist.size();i++)
		{	
			Comment a=new Comment();
			 a=(Comment)articlelist.get(i);
			System.out.println(a.getContent());
		}
	}
}
