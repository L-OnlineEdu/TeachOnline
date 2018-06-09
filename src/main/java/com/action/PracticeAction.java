package com.action;

import com.dao.Dao;
import com.dao.UserDao;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("prototype")
@Namespace("/")
@ParentPackage("json-default")
public class PracticeAction extends ActionSupport{
   private List paperList;
   private List questionList;
   private String msg;
   private int paperid;
   private String answers;
   private int rightNum;
   private int wrongNum;
   private int scores;
   private int practiceTime;
   private int practiceid;
   private String practiceTimeStr;

   private Integer quesId;
   private Question question;

   private String asw;

   @Autowired
   private TemporalMsgs temporalMsgs;

    @Action(value = "/tea/pushQues",results = {
            @Result(name = SUCCESS,type = "json")
            /*@Result(name = SUCCESS,location = "/tea/index.html")*/
    })
    public String pushQues(){
        User sender= Utils.getUser();
        SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_Pushques,
                sender,0,"quesId:"+quesId);
        temporalMsgs.sendMessage(systemMessage);
        return SUCCESS;
    }

    @Action(value = "/stu/selectQues",results = {
            @Result(name = SUCCESS,type = "json"),
    })
    public String selectQues(){
        Dao dao = new Dao();
        question = (Question) dao.select(Question.class,quesId);
        return SUCCESS;
    }

    @Action(value = "/stu/submitAsw",results = {
            @Result(name = SUCCESS,type = "json"),
    })
    public String submitAsw(){
        User student = Utils.getUser();
        int num = new UserDao().selectByRole().size();
        if (asw.equals("A"))
            SaveAted.numA ++;
        else if (asw.equals("B"))
            SaveAted.numB ++;
        else if (asw.equals("C"))
            SaveAted.numC ++;
        else if (asw.equals("D"))
            SaveAted.numD ++;
        SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_SubAsw,
                student,Utils.TEACHER_ID, "num:"+num+":numA:"+SaveAted.numA
                +":numB:"+SaveAted.numB+":numC:"+SaveAted.numC+":numD:"+SaveAted.numD);
        temporalMsgs.sendMessage(systemMessage);

        return SUCCESS;
    }

    @Action(value = "/tea/exitQues",results = {
            @Result(name = SUCCESS,type = "json"),
    })
    public String exitQues(){
        System.out.println("---------exitQues--------++++++");
        SaveAted.numA = 0;
        SaveAted.numB = 0;
        SaveAted.numC = 0;
        SaveAted.numD = 0;
        return SUCCESS;
    }

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
    @Action(value = "/tea/pushpractice",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
    public String pushPractice(){
        User sender= Utils.getUser();
        if (sender!=null){
            Dao dao=new Dao();
            Practice practice=new Practice();
            practice.setStartTimes(new Timestamp(System.currentTimeMillis())+"");
            practice.setTeacher(sender);
            practice.setPaper((Paper) dao.select(Paper.class,paperid));
            practice.setPracticeTime(practiceTime);
            System.out.println(practice.getStartTimes()+"---"+practice.getPaper().getPid());
            dao.add(practice);
            System.out.println("eid:"+practice.getId());
            SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_PracticePush,
                    sender,0,"paperId,"+paperid+",practiceTime,"+practiceTime);
            System.out.println(systemMessage);
            temporalMsgs.sendMessage(systemMessage);
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
        SystemMessage systemMessage=new SystemMessage(SystemMessage.SystemMessageType_PaperFinish,sender,0,"paperscore:"+scores);
        temporalMsgs.sendMessage(systemMessage);

        return SUCCESS;
    }

    //批改试卷计算成绩
    @Action(value = "/stu/correctPractice",results = {
            @Result(name = SUCCESS,type = "json"),
            @Result(name = ERROR,type = "json")
    })
   public String correctPractice(){
       Dao dao = new Dao();
       Gson gson = new Gson();
       Paper p= (Paper)dao.select(Paper.class,paperid);
       questionList=p.getQuestions();
       Map<Integer, String> rightAns = new HashMap<>();
        for (int i = 0; i < questionList.size(); i ++){
            rightAns.put(((Question)questionList.get(i)).getQuestionId(),
                    ((Question)questionList.get(i)).getRightAnswer());
        }
       Map <Integer,String> ansMap=gson.fromJson( answers, new TypeToken<Map<Integer, String>>() { }.getType());

       for(Map.Entry<Integer,String> entry:ansMap.entrySet()){
           String answer=entry.getValue();
//           Question q= (Question) questionList.get(entry.getKey());
           String rightAnswer=rightAns.get(entry.getKey());
           int qtype=((Question )dao.select(Question.class, entry.getKey())).getType();
           if (qtype==Question.QuestionType_Other){
               if (answer.indexOf(rightAnswer)>-1){
                   rightNum+=1;
               }
           }else {
               if (answer.equals(rightAnswer)){
                   rightNum+=1;
               }
           }
           scores=rightNum;
       }
       wrongNum=questionList.size()-rightNum;

       Date day=new Date();
       SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

       PracScore score = new PracScore();
       score.setScore(scores);
       score.setDetials(answers);
       score.setStudent(Utils.getUser());
       score.setEndTime(df.format(day));
       score.setPractice((Practice) dao.select(Practice.class,practiceid));
       dao.add(score);

       if (answers!=null)
        {
           msg="success";
       }else {
           msg="error";
       }
       return SUCCESS;
   }

    //学生练习
    @Action(value = "/stu/takePractice",results = {
            @Result(name = SUCCESS,location = "/stu/stuPractice.jsp")
    })
    public String takePractice(){
        /*Dao dao = new Dao();
        Practice practice = (Practice) dao.select(Practice.class, practiceid);
        paperid = practice.getPaper().getPid();*/
        int restSec=practiceTime*60;

        if (restSec>=0){
            int hh=restSec/3600;
            int mm=(restSec-hh*3600)/60;
            int ss=restSec%60;
            practiceTimeStr=(hh<10?"0"+hh:hh)+":"+(hh<10?"0"+mm:mm)+":"+(ss<10?"0"+ss:ss);
        }else {
            practiceTimeStr="00:00:00";
        }
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

    public int getScores() {
        return scores;
    }

    public void setScores(int scores) {
        this.scores = scores;
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

    public int getPracticeTime() {
        return practiceTime;
    }

    public void setPracticeTime(int practiceTime) {
        this.practiceTime = practiceTime;
    }

    public int getPaperid() {
        return paperid;
    }

    public void setPaperid(int paperid) {
        this.paperid = paperid;
    }

    public int getPracticeid() {
        return practiceid;
    }

    public void setPracticeid(int practiceid) {
        this.practiceid = practiceid;
    }

    public String getPracticeTimeStr() {
        return practiceTimeStr;
    }

    public void setPracticeTimeStr(String practiceTimeStr) {
        this.practiceTimeStr = practiceTimeStr;
    }

    public Integer getQuesId() {
        return quesId;
    }

    public void setQuesId(Integer quesId) {
        this.quesId = quesId;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public String getAsw() {
        return asw;
    }

    public void setAsw(String asw) {
        this.asw = asw;
    }

}
