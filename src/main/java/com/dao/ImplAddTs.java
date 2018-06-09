package com.dao;

import com.tools.DBHelper;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Collection;

public class ImplAddTs extends BaseDaoImpl {


    public Boolean save(Object entity) {
        Transaction ts=null;
        Session session= DBHelper.getSession();
        try {
            ts=session.beginTransaction();
            super.save(entity);
            ts.commit();
        }catch (HibernateException e){
            ts.rollback();
        }finally {
            DBHelper.closeSession();
        }
     return true;
    }

    @Override
    public void delete(Object entity) {
        Transaction ts=null;
        Session session= DBHelper.getSession();
        try {
            ts=session.beginTransaction();
            super.delete(entity);
            ts.commit();
        }catch (HibernateException e){
            ts.rollback();
        }finally {
            DBHelper.closeSession();
        }

    }
    @Override
    public void update(Object entity) {
        Transaction ts=null;
        Session session= DBHelper.getSession();
        try {
            ts=session.beginTransaction();
            super.update(entity);
            ts.commit();
        }catch (HibernateException e){
            ts.rollback();
        }finally {
            DBHelper.closeSession();
        }
    }
    @Override
    public void saveOrUpdate(Object entity) {
        Transaction ts=null;
        Session session= DBHelper.getSession();
        try {
            ts=session.beginTransaction();
            super.saveOrUpdate(entity);
            ts.commit();
        }catch (HibernateException e){
            ts.rollback();
        }finally {
            DBHelper.closeSession();
        }
    }

    public void saveAllt(Collection<?> entities) {
        Transaction ts=null;
        Session session= DBHelper.getSession();
        try {
            ts=session.beginTransaction();
            super.saveAll(entities);
            ts.commit();
        }catch (HibernateException e){
            ts.rollback();
        }finally {
            DBHelper.closeSession();
        }
    }

    public void deleteAllt(Collection<?> entities) {
        Transaction ts=null;
        Session session= DBHelper.getSession();
        try {
            ts=session.beginTransaction();
            super.deleteAll(entities);
            ts.commit();
        }catch (HibernateException e){
            ts.rollback();
        }finally {
            DBHelper.closeSession();
        }
    }

    public void updateAllt(Collection<?> entities) {

        Transaction ts=null;
        Session session= DBHelper.getSession();
        try {
            ts=session.beginTransaction();
            super.updateAll(entities);
            ts.commit();
        }catch (HibernateException e){
            ts.rollback();
        }finally {
            DBHelper.closeSession();
        }
    }
    public void saveOrUpdateAllt(Collection<?> entities) {
        Transaction ts=null;
        Session session= DBHelper.getSession();
        try {
            ts=session.beginTransaction();
            super.saveOrUpdateAll(entities);
            ts.commit();
        }catch (HibernateException e){
            ts.rollback();
        }finally {
            DBHelper.closeSession();
        }

    }

}
