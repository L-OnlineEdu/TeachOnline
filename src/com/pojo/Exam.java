package com.pojo;

import javax.persistence.*;

@Entity
@Table(name = "exams")
public class Exam {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int eid;
    @Column
    private String startTimes;
    @OneToOne
    @JoinColumn(name = "pid")
    private Paper paper;
    @OneToOne
    @JoinColumn(name = "tid")
    private User  teacher;

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getStartTimes() {
        return startTimes;
    }

    public void setStartTimes(String startTimes) {
        this.startTimes = startTimes;
    }

    public Paper getPaper() {
        return paper;
    }

    public void setPaper(Paper paper) {
        this.paper = paper;
    }

    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
    }
}
