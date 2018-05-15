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

import java.util.List;

@Namespace("/")
@ParentPackage("json-default")
public class ExamAction extends ActionSupport{
   /* 测验：提供选择试卷、试卷推送、答题、自动判卷、成绩汇总功能*/
   private List paperList;
   private List questionList;
   private String msg;
   private int paperid;
   private List answers;
   private int rightNum;
   private int wrongNum;
   private int score;

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
    @Action(value = "pushpaper",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
   public String pushPaper(){

        User sender= Utils.getUser();
        if (sender!=null){
            SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_PaperPush,sender,0,"paperId:"+paperid);
            TemporalMsgs.sendMessage(systemMessage);
            msg="success";
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
        TemporalMsgs.sendMessage(systemMessage);

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
       if (questionList.size()==answers.size()){

           for (int i=0;i<questionList.size();i++){
               String answer= (String) answers.get(i);
               Question q= (Question) questionList.get(i);
               String rightAnswer=q.getRightAnswer();
               int qtype=q.getType();
               if (qtype==Question.QuestionType_Other){
                   if (answer.indexOf(rightAnswer)>-1){
                       rightNum+=1;
                   }else {
                       wrongNum+=1;
                   }
               }else {
                   if (answer.equals(rightAnswer)){
                       rightNum+=1;
                   }else {
                       wrongNum+=1;
                   }
               }
               score=rightNum;
              // score=rightNum/answers.size()*100;
           }
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

    public List getAnswers() {
        return answers;
    }

    public void setAnswers(List answers) {
        this.answers = answers;
    }
}
