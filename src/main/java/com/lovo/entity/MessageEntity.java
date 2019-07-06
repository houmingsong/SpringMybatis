package com.lovo.entity;

import java.sql.Date;

public class MessageEntity {
	
	private Integer id;
	
	private String studentName;
	
	private String sex;
	
	private Date birthday;
	
	private Integer classNameId;
	
	private String address;
	
	private String scondition;
	
	private String tel;
	
	private String fatherName;
	
	private String fatherTel;
	
	private String motherName;
	
	private String motherTel;
	
	private String scomment;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Integer getClassNameId() {
		return classNameId;
	}

	public void setClassNameId(Integer classNameId) {
		this.classNameId = classNameId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getScondition() {
		return scondition;
	}

	public void setScondition(String scondition) {
		this.scondition = scondition;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getFatherTel() {
		return fatherTel;
	}

	public void setFatherTel(String fatherTel) {
		this.fatherTel = fatherTel;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getMotherTel() {
		return motherTel;
	}

	public void setMotherTel(String motherTel) {
		this.motherTel = motherTel;
	}

	public String getScomment() {
		return scomment;
	}

	public void setScomment(String scomment) {
		this.scomment = scomment;
	}

	@Override
	public String toString() {
		return "MessageEntity [id=" + id + ", studentName=" + studentName + ", sex=" + sex + ", birthday=" + birthday
				+ ", classNameId=" + classNameId + ", address=" + address + ", scondition=" + scondition + ", tel="
				+ tel + ", fatherName=" + fatherName + ", fatherTel=" + fatherTel + ", motherName=" + motherName
				+ ", motherTel=" + motherTel + ", scomment=" + scomment + "]";
	}
	
	
}
