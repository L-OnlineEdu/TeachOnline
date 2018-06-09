package com.dao;

import com.tools.DBHelper;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class BaseDaoImpl<T> implements BaseDao<T> {
    protected Class<T> entityClazz;


    @SuppressWarnings("unchecked")
    public BaseDaoImpl() {
        Type type = getClass().getGenericSuperclass();
        if (type instanceof ParameterizedType) {
            this.entityClazz = (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
        } else {
            this.entityClazz = null;
        }
    }

    protected Session getSession() {
        return DBHelper.getSession();
    }

    @SuppressWarnings("unchecked")
    public Object save(Object entity) {
        return (T) getSession().save(entity);
    }

    public void delete(Object entity) {

        getSession().delete(entity);
    }

    public void update(Object entity) {

        getSession().update(entity);
    }

    public void saveOrUpdate(Object entity) {

        getSession().saveOrUpdate(entity);
    }

    public void saveAll(Collection<?> entities) {

        for (@SuppressWarnings("rawtypes")
             Iterator localIterator = entities.iterator(); localIterator.hasNext();) {
            Object entity = localIterator.next();
            getSession().save(entity);
        }
    }

    public void deleteAll(Collection<?> entities) {

        for (@SuppressWarnings("rawtypes")
             Iterator localIterator = entities.iterator(); localIterator.hasNext();) {
            Object entity = localIterator.next();
            getSession().delete(entity);
        }
    }
    public void updateAll(Collection<?> entities) {

        for (@SuppressWarnings("rawtypes")
             Iterator localIterator = entities.iterator(); localIterator.hasNext();) {
            Object entity = localIterator.next();
            getSession().update(entity);
        }
    }
    @SuppressWarnings({ "unchecked", "hiding" })
    public <T> T get(Class<T> entityClass, Serializable id) {
        T entity= (T)getSession().get(entityClass, id);
        DBHelper.closeSession();
        return entity;
    }

    @SuppressWarnings({ "unchecked", "rawtypes", "hiding" })
    public <T> T get(CharSequence queryString, Object... params) {
        System.out.println(params[0]);
        Query qry = getSession().createQuery(queryString.toString());
        for (int i = 0; i < params.length; ++i) {

            qry.setParameter(i, params[i]);
        }
        List list = qry.setMaxResults(1).list();
        if (list.isEmpty())
            return null;
        T entity= (T)list.get(0);
        DBHelper.closeSession();
        return entity;
    }

    public void saveOrUpdateAll(Collection<?> entities) {

        for (@SuppressWarnings("rawtypes")
             Iterator localIterator = entities.iterator(); localIterator.hasNext();) {
            Object entity = localIterator.next();
            getSession().saveOrUpdate(entity);
        }
    }

    @SuppressWarnings({ "unchecked", "hiding" })
    public <T> T get(CharSequence queryString, Map<String, Object> params) {

        Query qry = getSession().createQuery(queryString.toString());
       setParameter(qry, params);
        @SuppressWarnings("rawtypes")
        List list = qry.setMaxResults(1).list();
        if (list.isEmpty())
            return null;
        T entity= (T)list.get(0);
        DBHelper.closeSession();
        return entity;
    }
    @SuppressWarnings({ "unchecked", "hiding" })
    public <T> List<T> findList(CharSequence queryString, Object... params) {
        Query query = getSession().createQuery(queryString.toString());
        for (int i = 0; i < params.length; ++i) {
            query.setParameter(i, params[i]);
        }
        List<T> entities=query.list();
        DBHelper.closeSession();
        return entities;
    }

    @SuppressWarnings({ "unchecked", "hiding" })
    public <T> List<T> findList(CharSequence queryString, Map<String, Object> params) {
        Query query = getSession().createQuery(queryString.toString());
        setParameter(query, params);
        List<T> entities=query.list();
        DBHelper.closeSession();
        return entities;
    }

    protected Query setParameter(Query query, Map<String, Object> parameterMap) {
        for (@SuppressWarnings("rawtypes")
             Iterator iterator = parameterMap.keySet().iterator(); iterator.hasNext();) {
            String key = (String) iterator.next();
            query.setParameter(key, parameterMap.get(key));
        }
        return query;
    }

}
