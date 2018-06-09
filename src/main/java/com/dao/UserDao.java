package com.dao;

import com.pojo.User;
import com.tools.DBHelper;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class UserDao extends Dao{
    public User selectByUName(String uname){
        Session session= DBHelper.getSession();
        User u=null;
        Query q=session.createQuery("from User u where u.userName=?");
        q.setParameter(0,uname);
       if(q.list().size()!=0)
        u=(User) q.list().get(0);
        return u;
    }

    public List selectByRole(){
		Session session= DBHelper.getSession();
        User u=null;
        Query q=session.createQuery("from User u where u.role='stu'");
        return q.list();
    }
}
