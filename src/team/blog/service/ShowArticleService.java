package team.blog.service;

import java.util.List;

import team.blog.dao.ArticleDao;
import team.blog.po.Article;
import team.blog.util.Page;

public class ShowArticleService {
	//查询所有文章
	public Page<Article> findAllArtcleWithPage(int pageNum,int pageSize)
	{
		ArticleDao dao=new ArticleDao();
		List<Article> allArticle=dao.getByTime();
		int totalRecord=allArticle.size();
		Page pb=new Page(pageNum, pageSize, totalRecord);
		int stratIndex=pb.getStartIndex();
		pb.setList(dao.queryByPage(stratIndex, pageSize));
		return pb;
	}
	//按类别查询文章
	public Page<Article> findAllArtcleWithType(int pageNum,int pageSize,String type)
	{
		ArticleDao dao=new ArticleDao();
		List<Article> allArticle=dao.getByType(type);
		int totalRecord=allArticle.size();
		Page pb=new Page(pageNum, pageSize, totalRecord);
		int stratIndex=pb.getStartIndex();
		pb.setList(dao.queryByType(stratIndex, pageSize,type));
		return pb;
	}

}
