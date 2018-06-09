package com.pojo;

import javax.persistence.*;

@Entity
public class Questionnaire {
  private int questionId;
  private String questionTitle;
  private String questionItems;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "qid", nullable = false)
    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }
    @Basic
    @Column(name = "qtt", nullable = true)
    public String getQuestionTitle() {
        return questionTitle;
    }

    public void setQuestionTitle(String questionTitle) {
        this.questionTitle = questionTitle;
    }
    @Basic
    @Column(name = "qitm", nullable = true)
    public String getQuestionItems() {
        return questionItems;
    }

    public void setQuestionItems(String questionItems) {
        this.questionItems = questionItems;
    }

}
