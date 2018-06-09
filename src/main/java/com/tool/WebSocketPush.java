package com.tool;

import com.dao.Dao;
import com.msg.webSocket.Push;
import com.pojo.Group;
import com.pojo.Message;
import com.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WebSocketPush implements PushMsg {

    @Autowired
    private Push push;


    public void sendPersonalMessage(Message message, int receverUid) {

        if (receverUid==0)
            receverUid=message.getReceiveId();

        push.sendMessageToUser(receverUid,message);

    }
    public void sendBrocastMessage(Message m){
        List allMembers=new Dao().selectAll("User");

        if (m.getTypes().equals(Message.MessageType_Broadcast+"")||m.getTypes().equals(Message.MessageType_SystemMsg+"")){
            for (Object o:allMembers){
                User u= (User) o;
                sendPersonalMessage(m,u.getUid());
            }
        }

    }
    public void sendGroupMessage(Message m){
        int groupId=m.getReceiveId();
        if (m.getTypes().equals(""+Message.MessageType_GroupMsg)){
            Dao dao=new Dao();
            Group group= (Group) dao.select(Group.class,groupId);
            //Teachers
            List <User>teachers=dao.selectAll("User u where u.role='tea'");


            if (group!=null){
                List <User>userList=group.getUsers();
                for (User user:userList){
                    sendPersonalMessage(m, user.getUid());
                }
            }
            if (teachers!=null&&teachers.size()>0){
                for (User user:teachers){
                    sendPersonalMessage(m, user.getUid());
                }
            }
        }
    }
    public void sendSystemMessage(Message message){
        if (message.getReceiveId()==0){
            sendBrocastMessage(message);
        }else {
            sendPersonalMessage(message,0);
        }
    }

    private  static Map<Integer,Object> msgMap;

    static
    {
        msgMap=new HashMap();
    }


    public void sendOnNotOnline(Message message,int checkKey){

        if (checkKey==0)
            checkKey=message.getReceiveId();

        Object object = msgMap.get(checkKey);

        if (object != null) {
            List messageList = null;
            if (object instanceof List) {
                messageList = (List) object;
                messageList.add(message);
            } else {
                Message oldMessage = (Message) object;
                messageList = new ArrayList();
                messageList.add(oldMessage);
                messageList.add(message);
            }
            msgMap.put(checkKey, messageList);
        } else {
            List msgList=new ArrayList();
            /*message直接存会产生奇怪的问题？*/
            msgList.add(message);
            msgMap.put(checkKey,msgList);
        }
    }

    public  void removeMessage(int uid){
        Object object=msgMap.get(uid);
        if (object!=null){
            if (object instanceof Message){
                msgMap.remove(uid);
            }else {
                if (object instanceof List){
                    List list= (List) object;
                    list.clear();
                }
            }
        }
    }

    public List readUnSentMessages(int receiveID){
        Object object = msgMap.get(receiveID);
        if (object != null) {
            List messageList = null;
            if (object instanceof Message) {
                Message message = (Message) object;
                messageList = new ArrayList();
                messageList.add(message);
            }else {
                messageList= (List) object;
            }
            return messageList;
        } else {
            return null;
        }
    }


    public int getOnlineNumber(){
        return Push.userSocketSessionMap.size();
    }

    public Push getPush() {
        return push;
    }

    public void setPush(Push push) {
        this.push = push;
    }
}
