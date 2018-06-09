package com.action;

import com.dao.Dao;
import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Course;
import com.pojo.SystemMessage;
import com.pojo.User;
import com.tool.TemporalMsgs;
import com.tool.Utils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Namespace("/")
@ParentPackage("json-default")
@Controller
@Scope("prototype")
public class CourseAction extends ActionSupport {

    @Autowired
    private TemporalMsgs temporalMsgs;

    private String courseName;
    private List courses;
    private Integer teaId;
    private Integer courseId;
    private List students;
    private List<User> onlineStu;
    private List<User> offlineStu;
    private Boolean courseStatu;

    @Action(value = "/tea/beginCourse", results = {
            @Result(name = "success", location = "/tea/two.jsp")
    })
    public String beginCourse(){
        User teacher = Utils.getUser();
        Dao dao = new Dao();
        Course course = new Course();
        course.setCourseName(courseName);
        course.setTeacher(teacher);
        Date day=new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        course.setDate(df.format(day));
        dao.add(course);
        UserDao userDao = new UserDao();

        /*
        * 记录课程和学生状态
        * */
        offlineStu = userDao.selectByRole();
        Utils.COURSE_OPING = true;
        onlineStu = SaveAted.users;

        for (int i = 0; i < onlineStu.size(); i++){
            for (int j = 0; j < offlineStu.size(); j++){
                if(onlineStu.get(i).getUid() == offlineStu.get(j).getUid()){
                    offlineStu.remove(j);
                }
            }
        }
        courseId = course.getId();

        SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_Cour,
                teacher,0,"teaId:"+teacher.getUid());
        temporalMsgs.sendMessage(systemMessage);
        return SUCCESS;
    }

    @Action(value = "/stu/findHistCou",results = {
            @Result(name = "success",type="json")
    })
    public String findHistCou(){
        Dao dao = new Dao();
        courses = dao.selectAll("Course");
        return SUCCESS;
    }

    @Action(value = "/stu/checkCourStatu",results = {
            @Result(name = "success",type="json")
    })
    public String findCouStatu(){
        if(Utils.COURSE_OPING){
            User teacher = (User)new Dao().select(User.class, Utils.TEACHER_ID);
            SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_Cour,
                    teacher,0,"teaId:"+teacher.getUid());
            temporalMsgs.sendMessage(systemMessage);
        }
        return SUCCESS;
    }

    @Action(value = "/stu/joinCourse", results = {
            @Result(name = "success",type = "json")
    })
    public String joinCourse(){
        User student = Utils.getUser();
        int i = 0;
        for (User user :
                SaveAted.users) {
            if(user.getUid() == student.getUid())
                i ++;
        }
        if(i == 0)
            SaveAted.users.add(student);

        SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_JoinCours,
                student,Utils.TEACHER_ID, "stuName:"+student.getUserName()+":stuid:"+student.getUid());
        temporalMsgs.sendMessage(systemMessage);
        return SUCCESS;
    }

    @Action(value = "/stu/exitCourse", results = {
            @Result(name = "success",type = "json")
    })
    public String exitCourse(){
        User student = Utils.getUser();
        for (User user :
                SaveAted.users) {
            if(user.getUid() == student.getUid()){
                SaveAted.users.remove(user);
                System.out.println(user.getUserName()+"------->离开课堂");
                SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_Exit,
                        student,Utils.TEACHER_ID, "stuName:"+student.getUserName()+":stuid:"+student.getUid());
                temporalMsgs.sendMessage(systemMessage);
                return SUCCESS;
            }
        }
        return SUCCESS;
    }

    @Action(value = "/stu/allOnlineStu", results = {
            @Result(name = "success",type = "json")
    })
    public String allOnlineStu(){
        onlineStu = SaveAted.users;
        for (User user :
                SaveAted.users) {
            System.out.println(user.getUserName()+"+11111111");
        }
        UserDao userDao = new UserDao();
        offlineStu = userDao.selectByRole();

        for (int i = 0; i < onlineStu.size(); i++){
            for (int j = 0; j < offlineStu.size(); j++){
                if(onlineStu.get(i).getUid() == offlineStu.get(j).getUid()){
                    offlineStu.remove(j);
                }
            }
        }
        return SUCCESS;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public List getCourses() {
        return courses;
    }

    public void setCourses(List courses) {
        this.courses = courses;
    }

    public Integer getTeaId() {
        return teaId;
    }

    public void setTeaId(Integer teaId) {
        this.teaId = teaId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public List getStudents() {
        return students;
    }

    public void setStudents(List students) {
        this.students = students;
    }

    public List getOnlineStu() {
        return onlineStu;
    }

    public void setOnlineStu(List onlineStu) {
        this.onlineStu = onlineStu;
    }

    public List getOfflineStu() {
        return offlineStu;
    }

    public void setOfflineStu(List offlineStu) {
        this.offlineStu = offlineStu;
    }

    public Boolean getCourseStatu() {
        return courseStatu;
    }

    public void setCourseStatu(Boolean courseStatu) {
        this.courseStatu = courseStatu;
    }
}
