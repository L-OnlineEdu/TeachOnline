package com.pojo;

import javax.persistence.*;
import java.util.List;
@Entity
@Table(name = "groups")
public class Group {

    private int gid;
    private String gname;

    private transient List<User> users;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "gid",unique = true,nullable = false)
    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    @Column
    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    @ManyToMany(targetEntity = User.class,fetch=FetchType.EAGER)
    @JoinTable(name = "gruops_2_users",joinColumns = @JoinColumn(name="gid"),inverseJoinColumns =@JoinColumn(name="uid"))

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
