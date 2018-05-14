package com.tool;

import com.dao.Dao;
import com.msg.loogPullling.LoogPulling;
import com.pojo.Group;
import com.pojo.Message;
import com.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public class PushLongPooling implements PushMsg {

    @Autowired
    @Qualifier("loogPullPushConn")
    private LoogPulling loogPulling;

    public void sendPersonalMessage(Message message, int receverUid) {

        if (receverUid==0)
            receverUid=message.getReceiveId();

        loogPulling.sendMessageToUser(receverUid,message);

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

}
