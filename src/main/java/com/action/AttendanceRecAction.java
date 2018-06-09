package com.action;

import com.dao.Dao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.AttendanceRec;
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

import java.sql.Date;


@Namespace("/")
@ParentPackage("json-default")
@Controller
@Scope("prototype")
public class AttendanceRecAction extends ActionSupport {
    @Autowired
    private TemporalMsgs temporalMsgs;

    private Integer courseId;
    private Integer arid;

    @Action(value = "/tea/checkAted",results = {
            @Result(name = "success",type = "json")
    })
    public String checkAted(){
        User teacher = Utils.getUser();
        if(teacher != null){
            System.out.println("0987654567898765678"+arid);
            Dao dao = new Dao();
            AttendanceRec attendanceRec = new AttendanceRec();
            attendanceRec.setCourse((Course) dao.select(Course.class, courseId));
            attendanceRec.setDate(new Date(System.currentTimeMillis()));
            dao.add(attendanceRec);
            arid = attendanceRec.getId();
            /*SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_Ated,
                    teacher,0,"atedRecId:"+attendanceRec.getId());
            temporalMsgs.sendMessage(systemMessage);*/
        }
        return SUCCESS;
    }

    public Integer getArid() {
        return arid;
    }

    public void setArid(Integer arid) {
        this.arid = arid;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }
}
