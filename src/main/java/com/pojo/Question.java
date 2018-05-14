package com.pojo;

import javax.persistence.*;

@Entity
@Table(name = "question")
public class Question {

    private int questionId;
    private String title;
    private String answers;
    private int type;
    private String rightAnswer;
    private int pid;

    public static  final int QuestionType_SingleChoice=1;
    public static  final int QuestionType_TrueORFalse=2;
    public static  final int QuestionType_Other=0;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "questionid",unique = true,nullable = false)
    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "answer")
    public String getAnswers() {
        return answers;
    }

    public void setAnswers(String answers) {
        this.answers = answers;
    }
    @Column(name = "type")
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Column(name = "rightAnswer")
    public String getRightAnswer() {
        return rightAnswer;
    }

    public void setRightAnswer(String rightAnswer) {
        this.rightAnswer = rightAnswer;
    }

    @Column
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
}
