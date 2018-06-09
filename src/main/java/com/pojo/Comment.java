package com.pojo;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class Comment {
    private int cid;
    private Integer puid;
    private Integer ruid;
    private Integer result;
    private Integer type;

    @Id
    @Column(name = "cid", nullable = false)
    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    @Basic
    @Column(name = "puid", nullable = true)
    public Integer getPuid() {
        return puid;
    }

    public void setPuid(Integer puid) {
        this.puid = puid;
    }

    @Basic
    @Column(name = "ruid", nullable = true)
    public Integer getRuid() {
        return ruid;
    }

    public void setRuid(Integer ruid) {
        this.ruid = ruid;
    }

    @Basic
    @Column(name = "result", nullable = true)
    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    @Basic
    @Column(name = "type", nullable = true)
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Comment comment = (Comment) o;
        return cid == comment.cid &&
                Objects.equals(puid, comment.puid) &&
                Objects.equals(ruid, comment.ruid) &&
                Objects.equals(result, comment.result) &&
                Objects.equals(type, comment.type);
    }

    @Override
    public int hashCode() {

        return Objects.hash(cid, puid, ruid, result, type);
    }
}
