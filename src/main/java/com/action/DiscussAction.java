package com.action;

import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Message;
import com.pojo.SystemMessage;
import com.pojo.User;
import com.tool.TemporalMsgs;
import com.tool.Utils;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Date;

@Namespace("/")
@ParentPackage("json-default")
@Controller
@Scope("prototype")
public class DiscussAction extends ActionSupport {
    private int messagetype;
    private int senderUid;
    private int receverid;
    private int beAsked;
    private String messageDetial;
    private String msg;
    @Autowired
    private TemporalMsgs temporalMsgs;
 /*   讨论：提供小组讨论、单独讨论、课堂讨论、举手、教师提问功能*/

    @Action(value = "discux",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String sendMessage(){
        if (messageDetial!=null){
            User sender= Utils.getUser();
            Message message=new Message();
            message.setMessage(messageDetial);
            message.setSender(sender);
            message.setReceiveId(receverid);
            message.setTypes(messagetype+"");
            message.setSendTime(new Date()+"");
         temporalMsgs.sendMessage(message);
           // System.out.println("map:"+temporalMsgs.getMsgMap());
        }
        return SUCCESS;
    }





    //提问
    @Action(value = "askQ",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String askQ(){
        User sender= Utils.getUser();
       // User userBeAsked= (User) new Dao().select(User.class,beAsked);
        SystemMessage message=new SystemMessage(SystemMessage.SystemMessageType_AskQ,sender,beAsked,messageDetial);
       temporalMsgs.sendMessage(message);
       // System.out.println("map:"+temporalMsgs.getMsgMap());
        return SUCCESS;
    }


    //回答
    @Action(value = "ansQ",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String ansQ(){
        User sender= Utils.getUser();
        // User userBeAsked= (User) new Dao().select(User.class,beAsked);
        SystemMessage message=new SystemMessage(SystemMessage.SystemMessageType_AnsQ,sender,receverid,messageDetial);
        temporalMsgs.sendMessage(message);
        // System.out.println("map:"+temporalMsgs.getMsgMap());
        msg="success";
        return SUCCESS;
    }



    //举手
    @Action(value = "hdup",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String handsUp(){
        User sender= Utils.getUser();
      //  User userBeAsked= (User) new Dao().select(User.class,beAsked);
       /* Message message=new Message();
        message.setMessage("handsUp:"+userBeAsked);
        message.setSender(sender);
        message.setReceiveId(receverid);
        message.setTypes(Message.MessageType_SystemMsg+"");*/
        SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_HandsUp,sender,beAsked,messageDetial);
       temporalMsgs.sendMessage(systemMessage);
       // System.out.println("map:"+temporalMsgs.getMsgMap());
        msg="success";
        return SUCCESS;
    }

    public int getMessagetype() {
        return messagetype;
    }

    public void setMessagetype(int messagetype) {
        this.messagetype = messagetype;
    }

    public int getSenderUid() {
        return senderUid;
    }

    public void setSenderUid(int senderUid) {
        this.senderUid = senderUid;
    }

    public int getReceverid() {
        return receverid;
    }

    public void setReceverid(int receverid) {
        this.receverid = receverid;
    }

    public int getBeAsked() {
        return beAsked;
    }

    public void setBeAsked(int beAsked) {
        this.beAsked = beAsked;
    }

    public String getMessageDetial() {
        return messageDetial;
    }

    public void setMessageDetial(String messageDetial) {
        this.messageDetial = messageDetial;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
