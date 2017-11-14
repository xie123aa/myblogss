package team.blog.service;

import team.blog.dao.ArticleDao;
import team.blog.po.Article;

public class HitArticleService {
	public Article GetAndUpdate(int id ){
	   ArticleDao dao=new ArticleDao();
	   Article article=new Article();
	   article=dao.getById(id);
	   article.setClickhit(article.getClickhit()+1);//µã»÷¼ÓÒ»
	   dao.update(article);
		return article;
		
	}
	

}
