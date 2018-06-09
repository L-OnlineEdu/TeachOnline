package com.dao;

import com.pojo.Exam;
import com.tools.DBHelper;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class ExamDao extends Dao {
    public Exam getLastExam(){
        Session session= DBHelper.getSession();
        String hql="from Exam order by eid desc ";
        Query q=session.createQuery(hql);
        q.setFirstResult(0);
        q.setMaxResults(1);
        return (Exam) q.uniqueResult();
    }
}
