package com.pojo;

import javax.persistence.*;

@Entity
@Table(name = "atedinfo")
public class AttendanceInfo {

	private Integer id;
	private User student;
	private AttendanceRec attendanceRec;
	
	public AttendanceInfo() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public AttendanceInfo(Integer id, User student,
			AttendanceRec attendanceRec) {
		super();
		this.id = id;
		this.student = student;
		this.attendanceRec = attendanceRec;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne(targetEntity = User.class)
	@JoinColumn(name="sid")
	public User getStudent() {
		return student;
	}
	public void setStudent(User student) {
		this.student = student;
	}
	
	@ManyToOne
	@JoinColumn(name="arid")
	public AttendanceRec getAttendanceRec() {
		return attendanceRec;
	}
	public void setAttendanceRec(AttendanceRec attendanceRec) {
		this.attendanceRec = attendanceRec;
	}
	
	
}
