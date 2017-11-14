package team.blog.service;

import team.blog.dao.ArticleDao;
import team.blog.po.Article;

public class ArticleService {
	public ArticleDao dao=new ArticleDao();
	/**
	 * 删除文章
	 */
	public void delete(int id){
		dao.delete(id);
	}
	/**
	 * 存储文章
	 */
	public void savaArticle(Article article){
		dao.save(article);
		
	}
	/**
	 * 获取文章
	 * @return 
	 */
	public Article getArticle(int id){
		Article art=dao.getById(id);
		return art;
		
	}
	/**
	 * 更新文章
	 */
	public void updateArticle(Article art){
		dao.update(art);
	}
	/**
	 * 将type转换为类型
	 */
	public String turn(int type){
		switch (type) {
		case 1:
			return "移动开发";
		case 2:
			return "web前端";
		case 3:
			return "架构设计";
		case 4:
			return "编程语言";
		case 5:
			return "互联网";
		case 6:
		    return "数据库";
		case 7:
			return "系统运维";
		case 8:
			return "云计算";
		case 9:
			return "研发管理";
		default:
		    return "综合";

		
		}
	}

}
