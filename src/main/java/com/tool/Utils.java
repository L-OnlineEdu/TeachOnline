package com.tool;

import com.pojo.User;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

public class Utils {
    public static String USER_KEY="user";
    public static void saveUser(User user){
        HttpSession session= ServletActionContext.getRequest().getSession();
        session.setAttribute(USER_KEY,user);
    }
    public static User getUser(){
        HttpSession session= ServletActionContext.getRequest().getSession();
        User u= (User) session.getAttribute(USER_KEY);
        return u;
    }
}
