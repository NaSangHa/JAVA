package com.study.jsp.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.Board_DAO;
import com.study.jsp.dao.FreeBoard_DAO;
import com.study.jsp.dao.Member_DAO;



public class GradeDownCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		Member_DAO member_dao = Member_DAO.getInstance();
		String id = request.getParameter("id");
			
		member_dao.gradeDown(id);
				
	}
}
