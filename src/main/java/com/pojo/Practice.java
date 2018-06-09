package com.pojo;

import javax.persistence.*;

@Entity
@Table(name = "practices")
public class Practice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;
    @Column
    private String startTimes;

    @Column
    private int practiceTime;

    @OneToOne
    @JoinColumn(name = "pid")
    private Paper paper;
    @OneToOne
    @JoinColumn(name = "tid")
    private User  teacher;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStartTimes() {
        return startTimes;
    }

    public void setStartTimes(String startTimes) {
        this.startTimes = startTimes;
    }

    public int getPracticeTime() {
        return practiceTime;
    }

    public void setPracticeTime(int practiceTime) {
        this.practiceTime = practiceTime;
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
