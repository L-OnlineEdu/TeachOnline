package com.msg.webSocket;


import com.dao.Dao;
import com.google.gson.Gson;
import com.pojo.Message;
import com.pojo.SystemMessage;
import com.pojo.User;
import com.tool.TemporalMsgs;
import com.tool.Utils;
import com.tool.WebSocketPush;
import com.tools.SpringTool;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

// 进行配置  websocket 通过下面的地址链接服务器
@Component
@ServerEndpoint(value = "/ws/chat" ,configurator = HttpSessionConfigurator.class)
public class Push {

    private static final Log log = LogFactory.getLog(Push.class);
    private User u;
    private Session session;
    private HttpSession httpSession;//httpsession  手动添加进来的值
    private static final AtomicInteger connectionIds = new AtomicInteger(0);    //统计及在线人数



    private TemporalMsgs temporalMsgs;

    public TemporalMsgs getTemporalMsgs() {
        return temporalMsgs;
    }

    public void setTemporalMsgs(TemporalMsgs temporalMsgs) {
        this.temporalMsgs = temporalMsgs;
    }

    //当MyWebSocketHandler类被加载时就会创建该Map，随类而生
    public static final Map<Integer, Session> userSocketSessionMap;

    static {
        userSocketSessionMap = new HashMap<Integer,Session>();
    }

    /*当websocket的客户端连接到服务器时候，这个方法就会执行，并且传递一个session会话对象来
     我们拿到这话session，就是可以给客户端发送消息*/
    @OnOpen
    public void start(Session session,EndpointConfig config) {
        this.session = session;
        this.httpSession = (HttpSession) config.getUserProperties()
                .get(HttpSession.class.getName());
         u= (User) httpSession.getAttribute(Utils.USER_KEY);
        if (u!=null){
         int uid=u.getUid();
        //if (userSocketSessionMap.get(uid) == null) {
            userSocketSessionMap.put(uid,session);
       // }
        //获取离线消息
        temporalMsgs= (TemporalMsgs) SpringTool.getBean("temporalMsgs");
            List unreadList=temporalMsgs.readUnSentMessages(uid);
        if (unreadList!=null&&unreadList.size()>0){
            for (Object m:unreadList){
                Message message= (Message) m;
                temporalMsgs.sendMessage(message);
            }
            temporalMsgs.removeMessage(uid);
        }
            User sysUser=new User();
            sysUser.setUserName("系统消息");
            sendMessageToUser(uid,new SystemMessage(SystemMessage.SystemMessageType_ConnectionEstablished,sysUser,0,"succes"));
        }else {
            //未登录
            System.out.println("未登录");
            try {
                session.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /*客户端被关闭时候，就会自动会调用这个方法*/
    @OnClose
    public void end() {
        if (u!=null){
            if (userSocketSessionMap.containsKey(u.getUid())){
                userSocketSessionMap.remove(u.getUid());
                System.out.println("----连接关闭----");

            }
        }else {
            System.out.println("未登录，连接关闭");

        }


    }

    /*客户端给服务器发送消息，这个方法会自动调用，并且可以拿到发送过来的数据*/
    @OnMessage
    public void incoming(String message) {
       if (message.length()==0)
           return;
        Message msg=new Gson().fromJson(message,Message.class);

        Timestamp now = new Timestamp(System.currentTimeMillis());
        msg.setSendTime(now+"");
        //将信息保存至数据库
        Dao d=new Dao();
        d.add(message);

        //发送Socket信息
        Gson gson=new Gson();
        Message m=gson.fromJson(message,Message.class);
      /*  WebApplicationContext context =
                WebApplicationContextUtils.getRequiredWebApplicationContext(
                        ServletActionContext.getServletContext()
                );

        TemporalMsgs temporalMsgs = (TemporalMsgs) context.getBean("temporalMsgs");
      */
        temporalMsgs.sendMessage(m);


    }

    /*发生了异常自动执行*/
    @OnError
    public void onError(Throwable t) throws Throwable {
        log.error("Chat Error: " + t.toString(), t);
    }


    public Boolean sendMessageToUser(int uid,Message message) {
    if (temporalMsgs==null){
        temporalMsgs= (TemporalMsgs) SpringTool.getBean("temporalMsgs");
    }

        if (userSocketSessionMap.containsKey(uid)){
            Session session = userSocketSessionMap.get(uid);
            if (session != null && session.isOpen()) {
                try {
                    Gson gson=new Gson();
                    String ss=gson.toJson(message);
                    session.getBasicRemote().sendText(ss);
                    return true;
                }catch (IOException e) {//如果这个client不在线
                    log.debug("Chat Error: 向用户发送消息失败", e);
                    userSocketSessionMap.remove(uid);
                    try {
                       session.close();
                    } catch (IOException e1) {
                        // Ignore
                    }
                }
            }else {
                System.out.println("失败");
            }
        }else {
            System.out.print("用户不在线");
            if (temporalMsgs.getMyPush() instanceof WebSocketPush){
                System.out.println("使用离线发送");
                ((WebSocketPush)temporalMsgs.getMyPush()).sendOnNotOnline(message,uid);
            }

            //log.debug("Chat Error: 向用户发送消息失败");

        }
        return false;
    }





}