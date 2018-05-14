package com.action;

import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.User;
import com.tool.Utils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;

import javax.servlet.http.HttpSession;


@Namespace("/")
@ResultPath("/")
@ParentPackage("json-default")
public class LoginAction extends ActionSupport {
    private String userName;
    private String passWd;

    @Action(value = "login",results = {
            @Result(name = SUCCESS,location = "msgx.jsp"),
            @Result(name = ERROR,location = "index.jsp")
    })
    public String login(){
        if(userName!=null&&passWd!=null){
            UserDao userDao=new UserDao();
            User vu=userDao.selectByUName(userName);
           if (vu==null){
               return ERROR;
           }
           else {

               if (vu.getPassWord().equals(passWd)){
                   Utils.saveUser(vu);
                   return SUCCESS;
               }
               else {
                    return ERROR;
               }

           }

        }
            return ERROR;
        //return SUCCESS;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWd() {
        return passWd;
    }

    public void setPassWd(String passWd) {
        this.passWd = passWd;
    }
}
