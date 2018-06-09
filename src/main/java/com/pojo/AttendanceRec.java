package com.pojo;

import java.sql.Date;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "atedrec")
public class AttendanceRec {

	private Integer id;
	private Date date;
	private Course course;
	private Set<AttendanceInfo> attendanceInfos;
	
	public AttendanceRec() {
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	@ManyToOne
	@JoinColumn(name="cid")
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	@OneToMany
	@JoinColumn(name="arid")
	public Set<AttendanceInfo> getAttendanceInfos() {
		return attendanceInfos;
	}

	public void setAttendanceInfos(Set<AttendanceInfo> attendanceInfos) {
		this.attendanceInfos = attendanceInfos;
	}
	
	
	
}
