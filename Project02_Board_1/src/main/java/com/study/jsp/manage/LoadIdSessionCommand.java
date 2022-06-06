package com.study.jsp.manage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.dao.Board_DAO;
import com.study.jsp.dto.Board_DTO;



public class LoadIdSessionCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String id = request.getParameter("id");
		
		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("delete_id", id);
			
		
	}
}
