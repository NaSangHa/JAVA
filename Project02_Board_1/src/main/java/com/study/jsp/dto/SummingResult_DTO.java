package com.study.jsp.dto;

public class SummingResult_DTO
{
	private String dates;
	private String max;
	private String sum;
	
	public SummingResult_DTO()
	{

	}
	
	public SummingResult_DTO(String dates, String max, String sum)
	{
		super();
		this.dates = dates;
		this.max = max;
		this.sum = sum;
	}

	public String getDates()
	{
		return dates;
	}

	public void setDates(String dates)
	{
		this.dates = dates;
	}

	public String getMax()
	{
		return max;
	}

	public void setMax(String max)
	{
		this.max = max;
	}

	public String getSum()
	{
		return sum;
	}

	public void setSum(String sum)
	{
		this.sum = sum;
	}
	
	

	
}
