package com.action;

import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Message;
import com.pojo.User;
import com.tool.TemporalMsgs;
import com.tool.Utils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Controller
@Scope("prototype")
@Namespace("/")
@ParentPackage("json-default")
public class MessageAction extends ActionSupport{
    private int senderUid;
    private int receiveid;
    private int msgtype;
    private String msg;
    private int code;
    private List msgList;
    private Message received;
    @Autowired
    private TemporalMsgs temporalMsgs;



    @Action(value = "sendM",results = {
          @Result(name = SUCCESS,type = "json"),
          @Result(name = ERROR,type = "json")
    })
    public String sendMessage(){
        System.out.println(temporalMsgs);
        if (msg!=null){

            User sender= Utils.getUser();
            Message message=new Message();
            message.setMessage(msg);
            message.setSender(sender);
            message.setReceiveId(receiveid);
            message.setTypes(msgtype+"");
            message.setSendTime(new Date()+"");
            temporalMsgs.sendMessage(message);

        }

        return SUCCESS;
    }
    @Action(value = "receM",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String receiveMessage(){
        long inTime = new Date().getTime();
        Boolean bool = true;
        while (bool) {
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if(receiveid==0){
                if (Utils.getUser()!=null)
                receiveid=Utils.getUser().getUid();
                else{
                    msg="unlogin";
                    System.out.println(msg);
                    break;
                   // return ERROR;
                }

            }
            //Message incommingMsg = (Message) TemporalMsgs.getMsgMap().get(receiveid);

            List storedList=temporalMsgs.getMessageList(receiveid);

            if(storedList!=null&&storedList.size()>0){
                bool = false;
               // received=incommingMsg;
                msgList=new ArrayList();
                msgList.addAll(storedList);
                temporalMsgs.removeMessage(Utils.getUser().getUid());
                System.out.println("incommingMsg:" +msgList);
                msg="success";
            }else{
                if(new Date().getTime() - inTime > 10000){
                    bool = false;
                }
                msg="fail";
                System.out.println("NoMsg"+inTime);
            }
        }
        return SUCCESS;
    }


    @Action(value = "/longpolling",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String looginPooling(){
        return  SUCCESS;
    }








    public int getSenderUid() {
        return senderUid;
    }

    public void setSenderUid(int senderUid) {
        this.senderUid = senderUid;
    }

    public int getReceiveid() {
        return receiveid;
    }

    public void setReceiveid(int receiveid) {
        this.receiveid = receiveid;
    }

    public int getMsgtype() {
        return msgtype;
    }

    public void setMsgtype(int msgtype) {
        this.msgtype = msgtype;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List getMsgList() {
        return msgList;
    }

    public void setMsgList(List msgList) {
        this.msgList = msgList;
    }

    public Message getReceived() {
        return received;
    }

    public void setReceived(Message received) {
        this.received = received;
    }
}
