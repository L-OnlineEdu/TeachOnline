package com.action;

import com.dao.AttendInfoDao;
import com.dao.Dao;
import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.AttendanceInfo;
import com.pojo.AttendanceRec;
import com.pojo.Course;
import com.pojo.User;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.sql.Date;
import java.util.List;


@Namespace("/")
@ParentPackage("json-default")
@Controller
@Scope("prototype")
public class AttendanceInfoAction extends ActionSupport {

    private Integer courseId;
    private List<AttendanceInfo> attendanceInfos = new ArrayList<>();
    private List<User> offlineStus = new ArrayList<>();
    private Integer arid;

    @Action(value = "/tea/recordAted",results = {
            @Result(name="success",type="json")
    })
    public String recordAted(){
        Dao dao1 = new Dao();
        Course currentCourse = (Course) dao1.select(Course.class, courseId);
        AttendanceRec attendanceRec = (AttendanceRec)dao1.findARByCid(courseId);
        if(attendanceRec == null){
            System.out.println("if语句进来了");
            attendanceRec = new AttendanceRec();
            attendanceRec.setCourse(currentCourse);
            attendanceRec.setDate(new Date(System.currentTimeMillis()));
            dao1.add(attendanceRec);
            arid = attendanceRec.getId();
        }
        arid = attendanceRec.getId();
        Dao dao2 = new Dao();
        for (User user :
                SaveAted.users) {
            if (dao2.findAIByUid(user.getUid(), attendanceRec.getId()) == null){
                Dao dao = new Dao();
                AttendanceInfo attendanceInfo = new AttendanceInfo();
                attendanceInfo.setStudent(user);
                attendanceInfo.setAttendanceRec(attendanceRec);
                dao.add(attendanceInfo);
            }
        }
        return SUCCESS;
    }

    @Action(value = "/tea/selectRec",results = {
            @Result(name="success",type="json")
    })
    public String selectRec(){
        AttendInfoDao dao = new AttendInfoDao();
        attendanceInfos = dao.selectAttenInfos(arid);
        List<User> students = new UserDao().selectByRole();
        for (User stu:
                students) {
            int i = 0;
            for (AttendanceInfo attinfo:
                 attendanceInfos) {
                if (stu.getUid() == attinfo.getStudent().getUid())
                    i ++;
            }
            if(i == 0)
                offlineStus.add(stu);
        }
        for (AttendanceInfo attendInfo:
             attendanceInfos) {
            System.out.println(attendInfo.getId()+"---"+attendInfo.getStudent().getUserName());
        }
        return SUCCESS;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public List<AttendanceInfo> getAttendanceInfos() {
        return attendanceInfos;
    }

    public void setAttendanceInfos(List<AttendanceInfo> attendanceInfos) {
        this.attendanceInfos = attendanceInfos;
    }

    public Integer getArid() {
        return arid;
    }

    public void setArid(Integer arid) {
        this.arid = arid;
    }

    public List<User> getOfflineStus() {
        return offlineStus;
    }

    public void setOfflineStus(List<User> offlineStus) {
        this.offlineStus = offlineStus;
    }
}
