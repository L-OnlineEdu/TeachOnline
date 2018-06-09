package com.dao;

import com.pojo.Practice;
import com.tools.DBHelper;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class PracticeDao extends Dao {
    public Practice getLastPractice(){
        Session session= DBHelper.getSession();
        String hql="from Practice order by id desc ";
        Query q=session.createQuery(hql);
        q.setFirstResult(0);
        q.setMaxResults(1);
        return (Practice) q.uniqueResult();
    }
}
