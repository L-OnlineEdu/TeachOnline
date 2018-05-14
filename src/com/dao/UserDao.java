package com.dao;

import com.pojo.User;
import org.hibernate.query.Query;


public class UserDao extends Dao{
    public User selectByUName(String uname){
        User u=null;
        Query q=session.createQuery("from User u where u.userName=?");
        q.setParameter(0,uname);
       if(q.list().size()!=0)
        u=(User) q.list().get(0);
        return u;
    }
}
