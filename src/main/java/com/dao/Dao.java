package com.dao;

import com.pojo.AttendanceInfo;
import com.pojo.AttendanceRec;
import com.tools.DBHelper;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Dao {
    public void add(Object o){
        Transaction tx= null;
        Session session= DBHelper.getSession();
        try {
            tx = session.beginTransaction();
            session.save(o);
            tx.commit();
        }catch (Exception e){
            e.printStackTrace();
            if (tx!=null){
                e.printStackTrace();
                tx.rollback();
            }
        }finally {
            DBHelper.closeSession();
        }

    }

    public void del(Object o){
        Transaction tx=null;
        Session session= DBHelper.getSession();
        try{
            tx=session.beginTransaction();
            session.delete(o);
            tx.commit();
        }catch (Exception e){
            if (tx!=null){
                e.printStackTrace();
                tx.rollback();
            }
        }finally {
            DBHelper.closeSession();
        }
    }
    public Object select(Class T,int id){
        Object o=null;
        Session session= DBHelper.getSession();
        try{
            o=session.find(T,id);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
           // DBHelper.closeSession();
        }
        return o;
    }
    public List selectAll(String q){
        List list=null;
        Session session= DBHelper.getSession();
        try{
            Query query=session.createQuery("from "+q);
            list=query.list();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            //DBHelper.closeSession();
        }

       // session.close();
        return list;
    }


    public void update(Object o){
        Transaction tx=null;
        Session session= DBHelper.getSession();
        try{
            tx = session.beginTransaction();
            session.update(o);
            tx.commit();
            System.out.println("zxcvbnm");

        }catch (Exception e){
            System.out.println("qwertyuio");
            e.printStackTrace();
            if (tx!=null){
                e.printStackTrace();
                tx.rollback();
            }
        }finally {
            DBHelper.closeSession();
        }
    }
    public AttendanceRec findARByCid(Integer cid) {
        Session session= DBHelper.getSession();
        String hql = "from AttendanceRec where cid = ?";
        Query query = session.createQuery(hql);
        query.setParameter(0, cid);
        AttendanceRec attendanceRec = (AttendanceRec) query.uniqueResult();
        //DBHelper.closeSession();
        return attendanceRec;
    }

    public AttendanceInfo findAIByUid(Integer uid, Integer arid){
        Session session= DBHelper.getSession();
        String hql = "from AttendanceInfo where sid = ? and arid = ?";
        Query query = session.createQuery(hql);
        query.setParameter(0, uid);
        query.setParameter(1, arid);
        AttendanceInfo attendanceInfo = (AttendanceInfo) query.uniqueResult();
        //DBHelper.closeSession();
        return attendanceInfo;
    }
}
