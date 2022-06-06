package com.study.jsp.Mcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.dao.Member_DAO;

public class PwCheckCommand implements BCommand_Int
{
	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		String id = request.getParameter("id");
		
		System.out.println("[폼에서 받아온] id : " + id);
		
		Member_DAO dao = Member_DAO.getInstance();
		
		int result = dao.idCheck(id);		
		
		return result;		
	}


}
