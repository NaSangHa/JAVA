package com.study.jsp.dto;

import java.sql.Timestamp;

public class Comments_DTO
{
	private String bId;
	private String id;
	private String cContent;
	private Timestamp cDate;
	private int cLike;
	private int cHate;
	
	
	public Comments_DTO()
	{
		
	}

	public Comments_DTO(String bId, String id, String cContent, Timestamp cDate, int cLike, int cHate)
	{
		super();
		this.bId = bId;
		this.id = id;
		this.cContent = cContent;
		this.cDate = cDate;
		this.cLike = cLike;
		this.cHate = cHate;
	}

	public String getbId()
	{
		return bId;
	}

	public void setbId(String bId)
	{
		this.bId = bId;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getcContent()
	{
		return cContent;
	}

	public void setcContent(String cContent)
	{
		this.cContent = cContent;
	}

	public Timestamp getcDate()
	{
		return cDate;
	}

	public void setcDate(Timestamp cDate)
	{
		this.cDate = cDate;
	}

	public int getcLike()
	{
		return cLike;
	}

	public void setcLike(int cLike)
	{
		this.cLike = cLike;
	}

	public int getcHate()
	{
		return cHate;
	}

	public void setcHate(int cHate)
	{
		this.cHate = cHate;
	}
	
	
	
	
	
	
}
