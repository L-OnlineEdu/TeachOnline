package com.dao;

import com.pojo.Exam;
import com.pojo.Paper;
import org.hibernate.query.Query;

public class ExamDao extends Dao {
    public Exam getLastExam(){

        String hql="from Exam order by eid desc ";
        Query q=session.createQuery(hql);
        q.setFirstResult(0);
        q.setMaxResults(1);
        return (Exam) q.uniqueResult();
    }
}
