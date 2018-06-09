package com.dao;

import com.pojo.Score;
import com.tools.DBHelper;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class ScoreDao extends Dao {
    public Score getLastScore(){
        Session session= DBHelper.getSession();
        String hql="from Score s order by  s.id desc ";
        Query q=session.createQuery(hql);
        q.setFirstResult(0);
        q.setMaxResults(1);
        return (Score) q.uniqueResult();
    }
}
