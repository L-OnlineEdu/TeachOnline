package com.action;

import com.dao.Dao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.SystemMessage;
import com.pojo.User;
import com.pojo.Warn;
import com.tool.TemporalMsgs;
import com.tool.Utils;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Scope("prototype")
@Namespace("/")
@ResultPath("/")
@ParentPackage("json-default")
public class WarnAction extends ActionSupport{
 private int beWarned;
 private int punish;
 private String reason;
 private String msg;
 private List warnList;
 private int warnid;
 @Autowired
 private TemporalMsgs temporalMsgs;

    @Action(value = "warn",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String warn(){
        User teacher= Utils.getUser();
        SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_Warn,teacher,beWarned,reason);
        if (punish>0){
            Dao dao=new Dao();
            Warn warn=new Warn();
            warn.setTeacher(teacher);
            warn.setStudent((User) dao.select(User.class,beWarned));
            warn.setPointsOff(punish);
            warn.setWarnMessage(reason);
            dao.add(warn);
            systemMessage.setMessage("收到了来自"+teacher.getUserName()+"的警告并扣除了"+punish+"分"+"(警告原因:"+reason+")");
        }else {
            systemMessage.setMessage("收到了来自"+teacher.getUserName()+"的警告"+"(警告原因:"+reason+")");
        }
        temporalMsgs.sendMessage(systemMessage);
        msg="success";
        return SUCCESS;
    }


    @Action(value = "allWarns",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String warnInfo(){
        //warnList=new ArrayList();
        Dao dao=new Dao();
        warnList=dao.selectAll("Warn");


        msg="success";
        return SUCCESS;
    }

    @Action(value = "delWarn",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String delWarn(){
        //warnList=new ArrayList();
        Dao dao=new Dao();
        if (warnid!=0){
            Warn x= (Warn) dao.select(Warn.class,warnid);
            if (x!=null){
                dao.del(x);
                msg="success";
            }else {
                System.out.println(warnid);
            }

        }else {
            msg="error";
        }

        return SUCCESS;
    }



    public int getBeWarned() {
        return beWarned;
    }

    public void setBeWarned(int beWarned) {
        this.beWarned = beWarned;
    }

    public int getPunish() {
        return punish;
    }

    public void setPunish(int punish) {
        this.punish = punish;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List getWarnList() {
        return warnList;
    }

    public void setWarnList(List warnList) {
        this.warnList = warnList;
    }

    public int getWarnid() {
        return warnid;
    }

    public void setWarnid(int warnid) {
        this.warnid = warnid;
    }
}
