package com.action;

import com.dao.Dao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Group;
import com.pojo.User;
import com.tool.Utils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import java.util.ArrayList;
import java.util.List;
@Namespace("/")
@ParentPackage("json-default")
public class GroupAction extends ActionSupport{
    private String msg;
    private List groupList;
    private List groupMembers;
    private int groupId;

    /*加载小组内成员 */
    @Action(value = "loadGroupMem",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String loadGroupMember(){
        User u= Utils.getUser();
        if (u!=null){
            Dao dao=new Dao();
            if (groupId!=0){

                Group g= (Group) dao.select(Group.class,groupId);
                groupMembers=g.getUsers();
            }else {
                groupMembers=dao.selectAll("User");
            }

            msg="success";
        }else {
            msg="error";
        }
        return SUCCESS;
    }
    /*加载用户的小组*/ /*教师加载全部小组*/
    @Action(value = "loadAllGroup",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String loadGroups(){
        User u= Utils.getUser();
        if (u!=null){
           if (u.getRole().equals("tea")){
            groupList=new Dao().selectAll("Group");
           }else
            groupList=u.getGroups();
            msg="success";
        }else {
            msg="error";
        }

        return SUCCESS;
    }
    /*加入学习小组*/
    @Action(value = "joinGroup",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String joinGroup(){
        User u=Utils.getUser();
        if (u==null){
            Dao dao=new Dao();
            List group=u.getGroups();
            if (group==null)
                group=new ArrayList();
                group.add(dao.select(Group.class,groupId));
            u.setGroups(group);
            dao.update(u);
            msg="success";
        }else {
            msg="error";
        }
        return SUCCESS;
    }
    /*退出学习小组*/
    @Action(value = "leaveGroup",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String exitGroup(){
        User u=Utils.getUser();
        if (u==null){
            Dao d=new Dao();
            Group group= (Group) d.select(Group.class,groupId);
            u.getGroups().remove(group);
            d.update(u);
            msg="success";
        }else {
            msg="error";
        }

        return SUCCESS;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List getGroupList() {
        return groupList;
    }

    public void setGroupList(List groupList) {
        this.groupList = groupList;
    }

    public List getGroupMembers() {
        return groupMembers;
    }

    public void setGroupMembers(List groupMembers) {
        this.groupMembers = groupMembers;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }
}
