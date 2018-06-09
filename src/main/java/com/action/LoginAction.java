package com.action;

import com.dao.ScoreDao;
import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Score;
import com.pojo.ScoreReport;
import com.pojo.User;
import com.tool.TemporalMsgs;
import com.tool.Utils;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@Scope("prototype")
@Namespace("/")
@ResultPath("/")
@ParentPackage("json-default")
public class LoginAction extends ActionSupport {
    private String userName;
    private String passWd;
    private Map infoMap;
    @Autowired
    TemporalMsgs temporalMsgs;
    private Boolean courseFlag;

    @Action(value = "/home/login",results = {
            @Result(name = SUCCESS,location = "/tea/home.jsp"),
            @Result(name = "STU",location ="/stu/stuhome.jsp",params = {"namespace","/stu"}),
            @Result(name = ERROR,type = "redirectAction",location = "login",params = {"namespace","/"})
    })
    public String login(){
        courseFlag = Utils.COURSE_OPING;
        if(userName!=null&&passWd!=null){
            UserDao userDao=new UserDao();
            User vu=userDao.selectByUName(userName);
           if (vu==null){
               return ERROR;
           }
           else {

               if (vu.getPassWord().equals(passWd)){
                   Utils.saveUser(vu);
                   if (vu.getRole().equals("stu"))
                       return "STU";
                   else{
                       Utils.TEACHER_ID = vu.getUid();
                        return SUCCESS;
                   }
               }
               else {
                    return ERROR;
               }

           }

        }
            return ERROR;
        //return SUCCESS;
    }

    @Action(value = "/feedStu",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String feedStu(){
        infoMap=new HashMap();
        ScoreDao dao=new ScoreDao();
        Score myScore=dao.getLastScore();
        List <Score>scores=dao.selectAll("Score");
        infoMap.put("myScore",myScore.getScore());
        int onlineNum=temporalMsgs.getOnlineNumber();
        infoMap.put("onlineDiscuss",onlineNum);
        List warnList=dao.selectAll("Warn where sid="+Utils.getUser().getUid());
        if (warnList!=null)
              infoMap.put("warnNums",warnList.size());
        else  infoMap.put("warnNums",0);
        infoMap.put("warnList",warnList);
        infoMap.put("lastExam",Utils.isThereBeExams());
        List scoreResprtList=new ArrayList();
        for (Score score:scores){
            ScoreReport scoreReport=new ScoreReport();
            scoreReport.setScore(score.getScore());
            scoreReport.setStu(score.getStudent().getUserName());
            scoreReport.setTea(score.getExam().getTeacher().getUserName());

            Timestamp startT=Timestamp.valueOf(score.getExam().getStartTimes());
            Timestamp endT=Timestamp.valueOf(score.getEndTime());
            int minutes= (int) ((endT.getTime()-startT.getTime())/60000);
            scoreReport.setTime(minutes+"");
            scoreResprtList.add(scoreReport);
        }

        infoMap.put("scoreReportList",scoreResprtList);

        return SUCCESS;
    }



    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWd() {
        return passWd;
    }

    public void setPassWd(String passWd) {
        this.passWd = passWd;
    }

    public Map getInfoMap() {
        return infoMap;
    }

    public void setInfoMap(Map infoMap) {
        this.infoMap = infoMap;
    }
	  public Boolean getCourseFlag() {
        return courseFlag;
    }

    public void setCourseFlag(Boolean courseFlag) {
        this.courseFlag = courseFlag;
    }
}
