package com.study.jsp.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.Board_DAO;
import com.study.jsp.dao.FreeBoard_DAO;
import com.study.jsp.dao.Member_DAO;



public class DeleteMemberCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String id = request.getParameter("id");
		
		//Board_DAO board_dao = Board_DAO.getInstance();
		//FreeBoard_DAO freeboard_dao = FreeBoard_DAO.getInstance();
		
		Member_DAO member_dao = Member_DAO.getInstance();
		member_dao.deleteMember(id);	
		
	}
}
