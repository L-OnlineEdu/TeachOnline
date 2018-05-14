package com.tools;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository
public class DBHelper {
    @Resource
    private static  SessionFactory sessionFactory;

    static {
        try {
            Configuration configuration = new Configuration();
            configuration.configure();

            sessionFactory= configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }
/*
    public static Session getSession() throws HibernateException {
        return sessionFactory.openSession();
    }

    */

    // ThreadLocal可以隔离多个线程的数据共享，因此不再需要对线程同步
    public static final ThreadLocal<Session> session
            = new ThreadLocal<Session>();
    //创建Session
    public static Session currentSession()
            throws HibernateException
    {
        //通过线程对象.get()方法安全创建Session
        Session s = session.get();
        // 如果该线程还没有Session,则创建一个新的Session
        if (s == null)
        {
            s = sessionFactory.openSession();
            // 将获得的Session变量存储在ThreadLocal变量session里
            session.set(s);
        }
        return s;
    }
    //关闭Session
    public static void closeSession()
            throws HibernateException
    {
        Session s = session.get();
        if (s != null)
            s.close();
        session.set(null);
    }
}
