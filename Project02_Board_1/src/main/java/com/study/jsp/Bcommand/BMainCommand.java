package com.study.jsp.Bcommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.Board_DAO;
import com.study.jsp.dao.FreeBoard_DAO;
import com.study.jsp.dto.Board_DTO;
import com.study.jsp.dto.FreeBoard_DTO;

public class BMainCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
	
		Board_DAO board_dao = Board_DAO.getInstance();
		FreeBoard_DAO free_board_dao = FreeBoard_DAO.getInstance();
	
		
		ArrayList<Board_DTO> newNotice_dtos = board_dao.newNotice();
		ArrayList<FreeBoard_DTO> hotFreeBoard_dtos = free_board_dao.hotFreeBoard();
		
		System.out.println("[newNotice_dtos] : " + newNotice_dtos);
		System.out.println("[hotFreeBoard_dtos] : " + hotFreeBoard_dtos);
		
		
		request.setAttribute("newNotice_dtos", newNotice_dtos);
		request.setAttribute("hotFreeBoard_dtos", hotFreeBoard_dtos);
		
	}

}
