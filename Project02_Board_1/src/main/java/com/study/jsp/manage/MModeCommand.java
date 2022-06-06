package com.study.jsp.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.Board_DAO;
import com.study.jsp.dao.FreeBoard_DAO;
import com.study.jsp.dao.Member_DAO;



public class MModeCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		Board_DAO board_dao = Board_DAO.getInstance();
		FreeBoard_DAO freeboard_dao = FreeBoard_DAO.getInstance();
		Member_DAO member_dao = Member_DAO.getInstance();
			
		int bronze_member = member_dao.bronzeMember();
		int silver_member = member_dao.silverMember();
		int gold_member = member_dao.goldMember();
		
		int count_FreeBoard = freeboard_dao.countFreeBoard();
		int count_Board = board_dao.countBoard();
		
		request.setAttribute("bronze_member", bronze_member);
		request.setAttribute("silver_member", silver_member);
		request.setAttribute("gold_member", gold_member);
		request.setAttribute("count_FreeBoard", count_FreeBoard);
		request.setAttribute("count_Board", count_Board);
		
	}
}
