package com.pojo;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "users")
public class User {

    private int uid;
    private String userName;
    private String passWord;
    private String role;
    private List groups;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "uid",unique = true,nullable = false)
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    @Column(name = "userName",length = 50)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Column(name = "passwd",length = 16)
    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    @Column(name = "role",length = 50)
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @ManyToMany(targetEntity = Group.class)
    @JoinTable(name = "gruops_2_users",joinColumns = @JoinColumn(name="uid"),inverseJoinColumns = @JoinColumn(name="gid"))
    public List getGroups() {
        return groups;
    }

    public void setGroups(List groups) {
        this.groups = groups;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                ", role='" + role + '\'' +
                ", groups=" + groups +
                '}';
    }
}
