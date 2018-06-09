package com.action;

import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Message;
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

import java.util.Date;

@Controller
@Scope("prototype")
@Namespace("/")
@ParentPackage("json-default")
public class QnMessageAction extends ActionSupport {
    private int receiveid;
    private String msg;
    private String rids;
    private int senderid;
    @Autowired
    private TemporalMsgs temporalMsgs;


    @Action(value = "sendTsM",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String sendTsMessage(){
        if (msg!=null){

            User sender= Utils.getUser();
            SystemMessage message=new SystemMessage(16,sender,receiveid,msg);
            System.out.println(temporalMsgs==null);
            temporalMsgs.sendMessage(message);
        }
        return SUCCESS;
    }


    @Action(value = "sendSsm",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String sendSsMessage(){
        if (msg!=null) {
            String[] rs = rids.split(";");
            for (int i = 0; i < rs.length; i++) {
                if(i==rs.length-1){
                    senderid=Integer.parseInt(rs[0]);
                }else{
                    senderid=Integer.parseInt(rs[i+1]);
                }
                receiveid= Integer.parseInt(rs[i]);
                User sender= Utils.getUser();
                Message message=new Message();
                message.setMessage(msg+senderid);
                message.setSender(sender);
                message.setReceiveId(receiveid);
                message.setTypes(3+"");
                message.setSendTime(new Date()+"");


                temporalMsgs.sendMessage(message);

            }

        }

            return SUCCESS;

    }


    public int getReceiveid() {
        return receiveid;
    }

    public void setReceiveid(int receiveid) {
        this.receiveid = receiveid;
    }


    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public TemporalMsgs getTemporalMsgs() {
        return temporalMsgs;
    }

    public void setTemporalMsgs(TemporalMsgs temporalMsgs) {
        this.temporalMsgs = temporalMsgs;
    }

    public String getRids() {
        return rids;
    }

    public void setRids(String rids) {
        this.rids = rids;
    }

    public int getSenderid() {
        return senderid;
    }

    public void setSenderid(int senderid) {
        this.senderid = senderid;
    }
}
