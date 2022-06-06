package com.study.jsp.manage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.Board_DAO;
import com.study.jsp.dto.SummingResult_DTO;



public class SummingBoardCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String startYear = request.getParameter("startYear");
		String startMonth = request.getParameter("startMonth");
		String startDay = request.getParameter("startDay");
		String start = startYear + "/" + startMonth + "/" + startDay;
		
		
		String endYear = request.getParameter("endYear");
		String endMonth = request.getParameter("endMonth");
		String endDay = request.getParameter("endDay");
		String end = endYear + "/" + endMonth + "/" + endDay;
		
		
		System.out.println("[startYear] : " + startYear);
		System.out.println("[startMonth] : " + startMonth);
		System.out.println("[startDay] : " + startDay);
		System.out.println("[start] : " + start);
		
		System.out.println("[endYear] : " + endYear);
		System.out.println("[endMonth] : " + endMonth);
		System.out.println("[endDay] : " + endDay);
		System.out.println("[end] : " + end);

		
		Board_DAO board_dao = Board_DAO.getInstance();
		ArrayList<SummingResult_DTO> summingResult = board_dao.summingBoard(start, end);
		
		request.setAttribute("summingResult", summingResult);

		request.setAttribute("startYear", startYear);
		request.setAttribute("startMonth", startMonth);
		request.setAttribute("startDay", startDay);
		
		request.setAttribute("endYear", endYear);
		request.setAttribute("endMonth", endMonth);
		request.setAttribute("endDay", endDay);
				
		request.setAttribute("start", start);
		request.setAttribute("end", end);

		
	}
}
