package com.tool;

import com.dao.ExamDao;
import com.pojo.Exam;
import com.pojo.User;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

public class Utils {
    public static String USER_KEY="user";
    public static Boolean COURSE_OPING = false;
    public static Integer TEACHER_ID = 5;
    public static void saveUser(User user){
        HttpSession session= ServletActionContext.getRequest().getSession();
        session.setAttribute(USER_KEY,user);
    }
    public static User getUser(){
        HttpSession session= ServletActionContext.getRequest().getSession();
        User u= (User) session.getAttribute(USER_KEY);
        return u;
    }
    public static Exam isThereBeExams() {
        ExamDao dao = new ExamDao();
        Exam ex = dao.getLastExam();
        List scores=dao.selectAll("Score where eid="+ex.getEid()+"AND sid="+Utils.getUser().getUid());


        if (ex != null&&(scores==null||scores.size()==0)) {
            if (ex.getStartTimes() != null && !ex.getStartTimes().equals("")) {
                Timestamp startTime = Timestamp.valueOf(ex.getStartTimes());
                // Timestamp nowTime=new Timestamp(System.currentTimeMillis());
                int second = (int) ((System.currentTimeMillis() - startTime.getTime()) / 1000);
                int restSec = ex.getExamTime() * 60 - second;

                if (restSec > 0) {
                    return ex;
                } else {
                    return null;
                }
            } else {
                return null;
            }

        }
        return null;
    }
}
