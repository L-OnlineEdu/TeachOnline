package com.action;

import com.dao.Dao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Question;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

@Namespace("/")
@ParentPackage("json-default")
@Controller
@Scope("prototype")
public class RealtimePracticeAction extends ActionSupport {

    private List<Question> questions;

    @Action(value = "/tea/getAllQues",results = {
            @Result(name = "success",type = "json")
    })
    public String getAllQues(){
        Dao dao = new Dao();
        questions = dao.selectAll("Question");
        System.out.println(questions);
        return SUCCESS;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }
}
