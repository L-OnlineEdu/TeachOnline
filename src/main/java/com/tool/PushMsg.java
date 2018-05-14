package com.tool;

import com.pojo.Message;
import org.springframework.stereotype.Component;


public interface PushMsg {
    void sendPersonalMessage(Message message, int checkKey);
    void sendBrocastMessage(Message m);
    void sendGroupMessage(Message m);
    void sendSystemMessage(Message message);
}
