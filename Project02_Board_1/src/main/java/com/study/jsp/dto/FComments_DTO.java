package com.study.jsp.dto;

import java.sql.Timestamp;

public class FComments_DTO
{
	private String fbId;
	private String id;
	private String fcContent;
	private Timestamp fcDate;
	private int fcLike;
	private int fcHate;

	public FComments_DTO(String fbId, String id, String fcContent, Timestamp fcDate, int fcLike, int fcHate)
	{
		super();
		this.fbId = fbId;
		this.id = id;
		this.fcContent = fcContent;
		this.fcDate = fcDate;
		this.fcLike = fcLike;
		this.fcHate = fcHate;
	}

	public String getFbId()
	{
		return fbId;
	}

	public void setFbId(String fbId)
	{
		this.fbId = fbId;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getFcContent()
	{
		return fcContent;
	}

	public void setFcContent(String fcContent)
	{
		this.fcContent = fcContent;
	}

	public Timestamp getFcDate()
	{
		return fcDate;
	}

	public void setFcDate(Timestamp fcDate)
	{
		this.fcDate = fcDate;
	}

	public int getFcLike()
	{
		return fcLike;
	}

	public void setFcLike(int fcLike)
	{
		this.fcLike = fcLike;
	}

	public int getFcHate()
	{
		return fcHate;
	}

	public void setFcHate(int fcHate)
	{
		this.fcHate = fcHate;
	}

}
