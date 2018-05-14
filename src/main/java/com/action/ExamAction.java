package com.action;

import com.dao.Dao;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.*;
import com.tool.TemporalMsgs;
import com.tool.Utils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("prototype")
@Namespace("/")
@ParentPackage("json-default")
public class ExamAction extends ActionSupport{
   /* 测验：提供选择试卷、试卷推送、答题、自动判卷、成绩汇总功能*/
   private List paperList;
   private List questionList;
   private String msg;
   private int paperid;
   private String answers;
   private int rightNum;
   private int wrongNum;
   private int score;
   private int examTime;

   @Autowired
   private TemporalMsgs temporalMsgs;

   //显示所有试卷
   @Action(value = "papers",results = {
           @Result(name = SUCCESS,type = "json"),
           @Result(name = ERROR,type = "json")
   })
   public String allPaper(){
       Dao dao=new Dao();
       paperList=dao.selectAll( "Paper");
       if (paperList!=null)
           msg="success";
       else
           msg="paper not exist";
       return SUCCESS;
   }
   //展示试卷
   @Action(value = "displaypaper",results = {
           @Result(name = SUCCESS,type = "json"),
           @Result(name = ERROR,type = "json")
   })
   public String displayPaper(){
       Dao dao=new Dao();
       Paper paper= (Paper) dao.select(Paper.class,paperid);
       if (paper!=null){
            questionList= paper.getQuestions();
            msg="success";
       }else {
           msg="null";
       }
       return SUCCESS;
   }
    //推送试卷
    @Action(value = "/tea/pushpaper",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
   public String pushPaper(){

        User sender= Utils.getUser();
        if (sender!=null){

            SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_PaperPush,sender,0,"paperId:"+paperid+"examTime:"+examTime);
            temporalMsgs.sendMessage(systemMessage);
            msg="success";
            Dao dao=new Dao();
            Exam exam=new Exam();
            exam.setStartTimes(new Timestamp(System.currentTimeMillis())+"");
            exam.setTeacher(sender);
            exam.setPaper((Paper) dao.select(Paper.class,paperid));
            exam.setExamTime(examTime);
            dao.add(exam);
        }else {
            msg="error";
        }

       return SUCCESS;
   }
    //完成试卷
    @Action(value = "finishpaper",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String finishPaper(){

        User sender= Utils.getUser();
        SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_PaperFinish,sender,0,"paperscore:"+score);
        temporalMsgs.sendMessage(systemMessage);

        return SUCCESS;
    }

    //批改试卷计算成绩
    @Action(value = "correctpaper",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
   public String correctPaper(){
       Paper p= (Paper) new Dao().select(Paper.class,paperid);
       questionList=p.getQuestions();
       Map <Integer,String> ansMap=new HashMap();
       answers=answers.substring(1,answers.length());
       String ans[]=answers.split(",");
       for (String ss:ans){
           String [] ssx= ss.split(":");
           ansMap.put(Integer.parseInt(ssx[0]),ssx[1]);
       }
       for(Map.Entry<Integer,String> entry:ansMap.entrySet()){
           String answer=entry.getValue();
           Question q= (Question) questionList.get(entry.getKey());
           String rightAnswer=q.getRightAnswer();
           int qtype=q.getType();
           if (qtype==Question.QuestionType_Other){
               if (answer.indexOf(rightAnswer)>-1){
                   rightNum+=1;
               }
           }else {
               if (answer.equals(rightAnswer)){
                   rightNum+=1;
               }
           }
           score=rightNum;
       }
       wrongNum=questionList.size()-rightNum;

       if (answers!=null)
        {
           msg="success";
       }else {
           msg="error";
       }

       return SUCCESS;
   }



   /*view */
   //学生考试
   @Action(value = "/stu/takeExam",results = {
           @Result(name = SUCCESS,location = "/stu/stu.jsp"),
   })
   public String takeExam(){
       return SUCCESS;
   }



   /*getter and setter*/

    public int getRightNum() {
        return rightNum;
    }

    public void setRightNum(int rightNum) {
        this.rightNum = rightNum;
    }

    public int getWrongNum() {
        return wrongNum;
    }

    public void setWrongNum(int wrongNum) {
        this.wrongNum = wrongNum;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List getPaperList() {
        return paperList;
    }

    public void setPaperList(List paperList) {
        this.paperList = paperList;
    }

    public int getPaperid() {
        return paperid;
    }

    public void setPaperid(int paperid) {
        this.paperid = paperid;
    }

    public List getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List questionList) {
        this.questionList = questionList;
    }

    public String getAnswers() {
        return answers;
    }

    public void setAnswers(String answers) {
        this.answers = answers;
    }

    public int getExamTime() {
        return examTime;
    }

    public void setExamTime(int examTime) {
        this.examTime = examTime;
    }
}
