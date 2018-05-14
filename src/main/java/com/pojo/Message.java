package com.pojo;

import javax.persistence.*;

@Entity
@Table(name = "message",catalog = "teachOn")
public class Message {

    private int mid;
    private String types;
    private User sender;
    private String message;
    private int receiveId;
    private String sendTime;

    public static final int  MessageType_Broadcast=1;
    public static final int MessageType_GroupMsg=2;
    public static final int MessageType_PersonalMsg=3;
    public static final int MessageType_SystemMsg=4;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mid",unique = true,nullable = false)
    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    @Column(name = "type")
    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }

    @OneToOne
    @JoinColumn(name = "uid")
    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    @Column(name = "message")
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Column(name = "receiveId")
    public int getReceiveId() {
        return receiveId;
    }

    public void setReceiveId(int receiveId) {
        this.receiveId = receiveId;
    }
    @Column
    public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

    @Override
    public String toString() {
        return "Message{" +
                "sender=" + sender +
                ", message='" + message + '\'' +
                ", receiveId=" + receiveId +
                ", sendTime='" + sendTime + '\'' +
                '}';
    }
}
