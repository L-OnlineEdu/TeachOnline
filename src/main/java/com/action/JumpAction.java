package com.action;

import com.dao.ExamDao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Exam;
import com.pojo.User;
import com.tool.Utils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import java.sql.Timestamp;

@Namespace("/")
@ResultPath("/")
public class JumpAction extends ActionSupport {
    private User user;
    private String msg;
    private int pid;
    private String pname;
    private String examtime;


    @Action(value = "/login",results = {
            @Result(name = SUCCESS,location = "/login.jsp"),
    })
    public String login(){
        return SUCCESS;
    }

    @Action(value = "/tea/discuss",results = {
            @Result(name = SUCCESS,location = "/tea/discuss.jsp"),
            @Result(name = ERROR,type = "redirectAction",location = "login",params = {"namespace","/"})
    })
    public String discuss(){
        user=Utils.getUser();
         if (user==null)
                return ERROR;
        return SUCCESS;
    }

    @Action(value = "/tea/paperPushed",results = {
            @Result(name = SUCCESS,location = "/tea/afterPush.jsp"),
            @Result(name = ERROR,type = "redirectAction",location = "login",params = {"namespace","/"})
    })
    public String afterPush(){
        user=Utils.getUser();
        if (user==null){
            return ERROR;
        }else{
            ExamDao dao=new ExamDao();
            Exam ex=dao.getLastExam();
            if (ex!=null){
                pid=ex.getPaper().getPid();
                pname=ex.getPaper().getPname();
                if (ex.getStartTimes()!=null&&!ex.getStartTimes().equals("")){
                    Timestamp startTime=Timestamp.valueOf(ex.getStartTimes());
                   // Timestamp nowTime=new Timestamp(System.currentTimeMillis());
                    int second= (int) ((System.currentTimeMillis()-startTime.getTime())/1000);
                    int restSec=ex.getExamTime()*60-second;

                    if (restSec>=0){
                        int hh=restSec/3600;
                        int mm=(restSec-hh*3600)/60;
                        int ss=restSec%60;
                        examtime=(hh<10?"0"+hh:hh)+":"+(hh<10?"0"+mm:mm)+":"+(ss<10?"0"+ss:ss);
                    }else {
                        examtime="00:00:00";
                    }
                }
                else {
                    examtime="00:00:00";
                }

            }
            return SUCCESS;
        }
    }




    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getExamtime() {
        return examtime;
    }

    public void setExamtime(String examtime) {
        this.examtime = examtime;
    }
}
