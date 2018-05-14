package com.tool;

import com.dao.Dao;
import com.pojo.Group;
import com.pojo.Message;
import com.pojo.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TemporalMsgs {

    private static Map<Integer,Object> msgMap=new HashMap<>();
    private static TemporalMsgs temporalMsgs;
    private TemporalMsgs(){}

    public static Map<Integer,Object> getMsgMap() {
        return msgMap;
    }
    public static Boolean hasNewMessage(int uid){
        if (msgMap.containsKey(uid))
        return false;
        else return true;
    }

    public static void sendPersonalMessage(Message message,int checkKey) {

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

    public static void sendMessage(Message message) {
       // sendPersonalMessage(message,0);
        int type=message.getTypes()==null?0: Integer.parseInt(message.getTypes());

        switch (type){
            case Message.MessageType_PersonalMsg:
                if (message.getReceiveId()!=0)
                sendPersonalMessage(message,0);
                else
                    System.err.println("receiveId不能为0");

                break;
            case Message.MessageType_Broadcast:
               /* if (message.getReceiveId()!=0)*/
                    sendBrocastMessage(message);
                /*else
                    System.err.println("receiveId不能为0");*/
                break;
            case Message.MessageType_GroupMsg:
                if (message.getReceiveId()!=0)
                    sendGroupMessage(message);
                else
                    System.err.println("receiveId不能为0");
                break;
            case Message.MessageType_SystemMsg:
                     sendSystemMessage(message);
                break;
            default:
                if (message.getReceiveId()!=0)
                    sendPersonalMessage(message,0);
                 else
                    System.err.println("receiveId不能为0");
                break;
        }

    }

    public static void sendBrocastMessage(Message m){
        List allMembers=new Dao().selectAll("User");

        if (m.getTypes().equals(Message.MessageType_Broadcast+"")||m.getTypes().equals(Message.MessageType_SystemMsg+"")){
            for (Object o:allMembers){
                User u= (User) o;
                sendPersonalMessage(m,u.getUid());
            }
        }

    }
    public static void sendGroupMessage(Message m){
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
    public static void sendSystemMessage(Message message){
        if (message.getReceiveId()==0){
            sendBrocastMessage(message);
        }else {
            sendPersonalMessage(message,0);
        }
    }
    public static void removeMessage(int uid){
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


    public static List getMessageList(int receiveID) {
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





  /*  public static Boolean hasPersonalMessage(int uid){
        return false;
    }

    public static Boolean hasGroupMessage(int gid){
        return false;
    }
    public static Boolean hasNewBrocastMessage(){
        return false;
    }
    public static Boolean hasNewSystemMessage(){
        return false;
    }*/



    public static TemporalMsgs getTemporalMsgs() {
        if (temporalMsgs==null){
            temporalMsgs=new TemporalMsgs();
        }
        return temporalMsgs;
    }
}
