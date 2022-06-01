package com.study.jsp.Bcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.FreeBoard_DAO;

public class BFreeBoardWriteCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String fbName = request.getParameter("fbName");
		String fbTitle = request.getParameter("fbTitle");
		String fbContent = request.getParameter("fbContent");
		String fbFile = request.getParameter("fbFile");
		
		
		FreeBoard_DAO free_board_dao = FreeBoard_DAO.getInstance();
		free_board_dao.insertFreeBoard(fbName, fbTitle, fbContent, fbFile);
	}

}
