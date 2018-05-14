package com.pojo;

import javax.persistence.*;
@Entity
@Table(name = "warn")
public class Warn {
    private int id;
    private User teacher;
    private User student;
    private String warnMessage;
    private int pointsOff;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "wid",unique = true,nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @OneToOne
    @JoinColumn(name = "tid")
    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
    }

    @OneToOne
    @JoinColumn(name = "sid")
    public User getStudent() {
        return student;
    }

    public void setStudent(User student) {
        this.student = student;
    }

    @Column(name = "warnMessage")
    public String getWarnMessage() {
        return warnMessage;
    }

    public void setWarnMessage(String warnMessage) {
        this.warnMessage = warnMessage;
    }

    @Column(name = "points")
    public int getPointsOff() {
        return pointsOff;
    }

    public void setPointsOff(int pointsOff) {
        this.pointsOff = pointsOff;
    }
}
