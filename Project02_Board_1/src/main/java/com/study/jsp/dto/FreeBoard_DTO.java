package com.study.jsp.dto;

import java.sql.Timestamp;

public class FreeBoard_DTO
{
	private int fbId;
	private String fbName;
	private String fbTitle;
	private String fbContent;
	private Timestamp fbDate;
	private int fbHit;
	private int fbGroup;
	private int fbStep;
	private int fbIndent;
	private String fbFile;
	private int fbLike;
	private int fbHate;
	
	public FreeBoard_DTO(int fbId, String fbName, String fbTitle, String fbContent, Timestamp fbDate, int fbHit,
			int fbGroup, int fbStep, int fbIndent, String fbFile, int fbLike, int fbHate)
	{
		super();
		this.fbId = fbId;
		this.fbName = fbName;
		this.fbTitle = fbTitle;
		this.fbContent = fbContent;
		this.fbDate = fbDate;
		this.fbHit = fbHit;
		this.fbGroup = fbGroup;
		this.fbStep = fbStep;
		this.fbIndent = fbIndent;
		this.fbFile = fbFile;
		this.fbLike = fbLike;
		this.fbHate = fbHate;
	}

	public int getFbId()
	{
		return fbId;
	}

	public void setFbId(int fbId)
	{
		this.fbId = fbId;
	}

	public String getFbName()
	{
		return fbName;
	}

	public void setFbName(String fbName)
	{
		this.fbName = fbName;
	}

	public String getFbTitle()
	{
		return fbTitle;
	}

	public void setFbTitle(String fbTitle)
	{
		this.fbTitle = fbTitle;
	}

	public String getFbContent()
	{
		return fbContent;
	}

	public void setFbContent(String fbContent)
	{
		this.fbContent = fbContent;
	}

	public Timestamp getFbDate()
	{
		return fbDate;
	}

	public void setFbDate(Timestamp fbDate)
	{
		this.fbDate = fbDate;
	}

	public int getFbHit()
	{
		return fbHit;
	}

	public void setFbHit(int fbHit)
	{
		this.fbHit = fbHit;
	}

	public int getFbGroup()
	{
		return fbGroup;
	}

	public void setFbGroup(int fbGroup)
	{
		this.fbGroup = fbGroup;
	}

	public int getFbStep()
	{
		return fbStep;
	}

	public void setFbStep(int fbStep)
	{
		this.fbStep = fbStep;
	}

	public int getFbIndent()
	{
		return fbIndent;
	}

	public void setFbIndent(int fbIndent)
	{
		this.fbIndent = fbIndent;
	}

	public String getFbFile()
	{
		return fbFile;
	}

	public void setFbFile(String fbFile)
	{
		this.fbFile = fbFile;
	}

	public int getFbLike()
	{
		return fbLike;
	}

	public void setFbLike(int fbLike)
	{
		this.fbLike = fbLike;
	}

	public int getFbHate()
	{
		return fbHate;
	}

	public void setFbHate(int fbHate)
	{
		this.fbHate = fbHate;
	}
	
	
	
	
}
