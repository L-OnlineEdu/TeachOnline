package com.tool;

import com.pojo.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TemporalMsgs {

    private static int mid=0;
    private TemporalMsgs(){}

    @Autowired
    @Qualifier("webSocketPush")//webSocketPush //pushLongPooling
    private PushMsg myPush;

    public PushMsg getMyPush() {
        return myPush;
    }

    public void setMyPush(PushMsg myPush) {
        this.myPush = myPush;
    }

    public  void sendMessage(Message message) {
       // sendPersonalMessage(message,0);
        int type=message.getTypes()==null?0: Integer.parseInt(message.getTypes());
        mid++;
        message.setMid(mid);

        switch (type){
            case Message.MessageType_PersonalMsg:
                if (message.getReceiveId()!=0) 
                    myPush.sendPersonalMessage(message,0);
                else
                    System.err.println("receiveId不能为0");

                break;
            case Message.MessageType_Broadcast:
               /* if (message.getReceiveId()!=0)*/
                    myPush.sendBrocastMessage(message);
                /*else
                    System.err.println("receiveId不能为0");*/
                break;
            case Message.MessageType_GroupMsg:
                if (message.getReceiveId()!=0)
                    myPush.sendGroupMessage(message);
                else
                    System.err.println("receiveId不能为0");
                break;
            case Message.MessageType_SystemMsg:
                    myPush.sendSystemMessage(message);
                break;
            default:
                if (message.getReceiveId()!=0)
                    myPush.sendPersonalMessage(message,0);
                 else
                    System.err.println("receiveId不能为0");
                break;
        }

    }

    public  void removeMessage(int uid){
        if (myPush instanceof PoolPush){
            ((PoolPush) myPush).removeMessage(uid);
        }else {
            ((WebSocketPush) myPush).removeMessage(uid);
        }
    }


    public  List getMessageList(int receiveID) {
        if (myPush instanceof PoolPush){
            return ((PoolPush) myPush).getMessageList(receiveID);
        }else {
            return  readUnSentMessages(receiveID);
        }
    }


    public List readUnSentMessages(int uid) {
        if (myPush instanceof WebSocketPush){
           return  ((WebSocketPush) myPush).readUnSentMessages(uid);
        }
        return null;
    }
}
