package com.msg.loogPullling;

import com.google.gson.Gson;
import com.pojo.Message;
import com.pojo.User;
import com.tool.TemporalMsgs;
import com.tool.Utils;
import com.tools.SpringTool;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;


@WebServlet(value="/longpolling", asyncSupported=true)
@Service
public class LoogPullPushConn  extends HttpServlet implements LoogPulling{
    private static final Map<Integer,AsyncContext> connections = new HashMap<>();

    private TemporalMsgs temporalMsgs;
    private User u;
    @Override
    public void onConnectionStart(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println("##establish##");
        HttpSession session=req.getSession();
         u= (User) session.getAttribute(Utils.USER_KEY);
        if (u!=null){
            System.out.println("###长连接建立中###");
            AsyncContext context = req.startAsync();
            context.setTimeout(0);
            connections.put(u.getUid(),context);
            System.out.println("###长连接已建立###");

        }else {
            try {
                PrintWriter out = resp.getWriter();
                out.print("unlogin");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            onConnectionClose();
        }




    }

    @Override
    public void onConnectionStop(HttpServletRequest req, HttpServletResponse resp) {
        u= (User) req.getSession().getAttribute(Utils.USER_KEY);
        onConnectionClose();
    }

    @Override
    public void onMessage(HttpServletRequest req, HttpServletResponse resp) {

        System.out.print("#");
        String msg = req.getParameter("msg");
        Gson gson=new Gson();
       Message m=gson.fromJson(msg,Message.class);
        temporalMsgs= (TemporalMsgs) SpringTool.getBean("temporalMsgs");
        temporalMsgs.sendMessage(m);

    }

    @Override
    public void onConnectionClose() {
        if (u!=null){
            connections.remove(u.getUid());
            System.out.println("用户"+u.getUid());
        }
        System.out.println("###连接断开###");
    }

    @Override
    public synchronized void sendMessageToUser(int received, Message message) {
        System.out.print("->");
        if (connections.containsKey(received)){
            System.out.println("--->发送消息");
            AsyncContext context=connections.get(received);
            HttpServletResponse response = (HttpServletResponse) context.getResponse();
            try {
                response.setCharacterEncoding("utf-8");
                PrintWriter out = response.getWriter();
                String msg=new Gson().toJson(message);
                out.print(msg);
                out.flush();
                out.close();
                context.complete();
                connections.remove(received);
                System.out.println("###连接断开###");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            System.out.println("用户不在线");
        }
        //onConnectionClose();


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        if (method.equals("onOpen")) {
            onConnectionStart(req, resp);
        } else if (method.equals("onMessage")) {
            onMessage(req, resp);
        }else if (method.equals("onClose"))
            onConnectionStop(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
