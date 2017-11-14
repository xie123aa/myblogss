package team.blog.service;

import team.blog.dao.ArticleDao;
import team.blog.po.Article;

public class ArticleService {
	public ArticleDao dao=new ArticleDao();
	/**
	 * ɾ������
	 */
	public void delete(int id){
		dao.delete(id);
	}
	/**
	 * �洢����
	 */
	public void savaArticle(Article article){
		dao.save(article);
		
	}
	/**
	 * ��ȡ����
	 * @return 
	 */
	public Article getArticle(int id){
		Article art=dao.getById(id);
		return art;
		
	}
	/**
	 * ��������
	 */
	public void updateArticle(Article art){
		dao.update(art);
	}
	/**
	 * ��typeת��Ϊ����
	 */
	public String turn(int type){
		switch (type) {
		case 1:
			return "�ƶ�����";
		case 2:
			return "webǰ��";
		case 3:
			return "�ܹ����";
		case 4:
			return "�������";
		case 5:
			return "������";
		case 6:
		    return "���ݿ�";
		case 7:
			return "ϵͳ��ά";
		case 8:
			return "�Ƽ���";
		case 9:
			return "�з�����";
		default:
		    return "�ۺ�";

		
		}
	}

}
