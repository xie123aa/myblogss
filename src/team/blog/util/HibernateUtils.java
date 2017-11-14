package team.blog.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * ����һ��hibernate������
 * @author george
 *
 */

public class HibernateUtils {
	private static SessionFactory sessionFactory;
	static {
//		Configuration cfg =new Configuration();
//		cfg.configure("hibernate.hbm.xml");
		sessionFactory=new Configuration()//��ʼ��SessionFctory
		.configure()//
		.buildSessionFactory();
	}
	/**
	 * ��ȡȫ��Ψһ��SessionFactory
	 */
	public static SessionFactory returnSessionfactory(){
		return sessionFactory;
	}
	/**
	 * ��ȫ��Ψһ��SessionFactory����һ��session
	 */
	public static Session openSession(){
		return sessionFactory.openSession();
	}

}
