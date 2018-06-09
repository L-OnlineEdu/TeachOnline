package com.action;

import com.opensymphony.xwork2.ActionSupport;
import com.pojo.SystemMessage;
import com.pojo.User;
import com.tool.TemporalMsgs;
import com.tool.Utils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Namespace("/")
@ParentPackage("json-default")
@Controller
@Scope("prototype")
public class AtedMsgAction extends ActionSupport {

    private Integer atedRecid;

    @Action(value = "/stu/atedMsg",results = {
            @Result(name = "success",type = "json")
    })
    public String atedMsg(){
        System.out.println("-------");
        User currentUser = Utils.getUser();
        for (User user :
                SaveAted.users) {
            if(user.getUid() != currentUser.getUid())
                SaveAted.users.add(currentUser);
        }
        SaveAted.atedRecid = atedRecid;
        System.out.println(SaveAted.users+"---"+SaveAted.atedRecid);
        return SUCCESS;
    }

    public Integer getAtedRecid() {
        return atedRecid;
    }

    public void setAtedRecid(Integer atedRecid) {
        this.atedRecid = atedRecid;
    }
}
