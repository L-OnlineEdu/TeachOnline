package com.dao;

import com.tools.DBHelper;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class ScoreDao {

   /* public List findBySid(int sid){
        Session session = DBHelper.currentSession();
        String hql = "from Score where scoreId = ?";
        Query query = session.createQuery(hql);
        query.setParameter(0,sid);
        return query.list();
    }*/
}
