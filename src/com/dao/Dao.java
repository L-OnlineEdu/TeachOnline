package com.dao;

import com.tools.DBHelper;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class Dao {
    protected Session session;
    public Dao(){
        session= DBHelper.currentSession();
    }
    public void add(Object o){
        Transaction tx= null;
        try {
            session.beginTransaction();
            session.save(o);
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

    public void del(Object o){
        Transaction tx=null;
        try{
            session.beginTransaction();
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
        try{
            o=session.find(T,id);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            //session.close();
        }
        return o;
    }
    public List selectAll(String q){
        List list=null;
        try{
            Query query=session.createQuery("from "+q);
            list=query.list();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
           // DBHelper.closeSession();
        }

       // session.close();
        return list;
    }


    public void update(Object o){
        Transaction tx=null;
        try{
            session.beginTransaction();
            session.saveOrUpdate(o);
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



}
