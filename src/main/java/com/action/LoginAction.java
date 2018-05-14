package com.action;

import com.dao.UserDao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.User;
import com.tool.Utils;
import org.apache.struts2.convention.annotation.*;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


@Controller
@Scope("prototype")
@Namespace("/")
@ResultPath("/")
@ParentPackage("json-default")
public class LoginAction extends ActionSupport {
    private String userName;
    private String passWd;


    @Action(value = "/tea/login",results = {
            @Result(name = SUCCESS,location = "/tea/home.jsp"),
            @Result(name = ERROR,type = "redirectAction",location = "login",params = {"namespace","/"})
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
