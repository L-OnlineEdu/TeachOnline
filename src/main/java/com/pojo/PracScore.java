package com.pojo;

import javax.persistence.*;

@Entity
@Table(name = "pracscore")
public class PracScore {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;
    @OneToOne
    @JoinColumn(name = "sid")
    private User student;

    @Column
    private String endTime;
    @OneToOne
    @JoinColumn(name = "praid")
    private Practice practice;
    @Column
    private int score;
    @Column
    private String detials;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getStudent() {
        return student;
    }

    public void setStudent(User student) {
        this.student = student;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Practice getPractice() {
        return practice;
    }

    public void setPractice(Practice practice) {
        this.practice = practice;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getDetials() {
        return detials;
    }

    public void setDetials(String detials) {
        this.detials = detials;
    }
}
