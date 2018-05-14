package com.pojo;

import javax.persistence.*;
import java.util.List;
@Entity
@Table(name = "paper")
public class Paper {
    private int pid;
    private String pname;
    private List<Question> questions;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pid",unique = true,nullable = false)
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    @Column(name = "pname")
    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    @OneToMany
    @JoinColumn(name = "pid")
    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }
}
