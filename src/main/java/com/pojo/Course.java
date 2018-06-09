package com.pojo;

import javax.persistence.*;
import java.sql.Date;

@Entity
public class Course {

    private Integer id;
    private String courseName;
    private String date;
    private User teacher;

    public Course(){

    }

    public Course(Integer id, String courseName, User teacher){
        this.id = id;
        this.courseName = courseName;
        this.teacher = teacher;
    }


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @ManyToOne
    @JoinColumn(name="tid")
    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
    }
}
