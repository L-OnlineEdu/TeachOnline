package com.dao;

import com.pojo.AttendanceInfo;
import com.tools.DBHelper;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AttendInfoDao extends Dao{

    public List<AttendanceInfo> selectAttenInfos(int arid){
        Session session= DBHelper.getSession();
        Query q=session.createQuery("from AttendanceInfo  where arid=?");
        q.setParameter(0, arid);
        return q.list();
    }

}
