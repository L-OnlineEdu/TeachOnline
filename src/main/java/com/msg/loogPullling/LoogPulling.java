package com.msg.loogPullling;

import com.pojo.Message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface LoogPulling{
     void onConnectionStart(HttpServletRequest req, HttpServletResponse resp);
     void onConnectionStop(HttpServletRequest req, HttpServletResponse resp);
     void onMessage(HttpServletRequest req, HttpServletResponse resp);
     void onConnectionClose();
     void sendMessageToUser(int received,Message message);
}