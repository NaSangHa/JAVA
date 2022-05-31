package com.study.jsp.dto;

import java.sql.Timestamp;

public class Member_DTO
{
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String eMail;
	private String gender;
	private int grade;
	private Timestamp joinDate;

	public Member_DTO()
	{
	}

	public Member_DTO(String id, String pw, String name, String phone, String eMail, String gender, int grade,
			Timestamp joinDate)
	{
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.eMail = eMail;
		this.gender = gender;
		this.grade = grade;
		this.joinDate = joinDate;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getPw()
	{
		return pw;
	}

	public void setPw(String pw)
	{
		this.pw = pw;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public String geteMail()
	{
		return eMail;
	}

	public void seteMail(String eMail)
	{
		this.eMail = eMail;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public int getGrade()
	{
		return grade;
	}

	public void setGrade(int grade)
	{
		this.grade = grade;
	}

	public Timestamp getJoinDate()
	{
		return joinDate;
	}

	public void setJoinDate(Timestamp joinDate)
	{
		this.joinDate = joinDate;
	}

}
