package team.blog.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * 这是一个hibernate工具类
 * @author george
 *
 */

public class HibernateUtils {
	private static SessionFactory sessionFactory;
	static {
//		Configuration cfg =new Configuration();
//		cfg.configure("hibernate.hbm.xml");
		sessionFactory=new Configuration()//初始化SessionFctory
		.configure()//
		.buildSessionFactory();
	}
	/**
	 * 获取全局唯一的SessionFactory
	 */
	public static SessionFactory returnSessionfactory(){
		return sessionFactory;
	}
	/**
	 * 从全局唯一的SessionFactory返回一个session
	 */
	public static Session openSession(){
		return sessionFactory.openSession();
	}

}
