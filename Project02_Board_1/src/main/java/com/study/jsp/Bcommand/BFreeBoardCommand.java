package com.study.jsp.Bcommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.dao.FreeBoard_DAO;
import com.study.jsp.dto.BPageInfo;
import com.study.jsp.dto.FreeBoard_DTO;

public class BFreeBoardCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		System.out.println("[test] BFreeBoardCommand 입장");
		
		int nPage = 1;
		try
		{
			String sPage = request.getParameter("page");
			nPage = Integer.parseInt(sPage);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		FreeBoard_DAO free_board_dao = FreeBoard_DAO.getInstance();
		BPageInfo pinfo = free_board_dao.articlePage(nPage);
		request.setAttribute("page", pinfo);		
		nPage = pinfo.getCurPage();	// 현재 페이지
		
		// System.out.println("[test] nPage: " + nPage);
		
		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("cpage", nPage);
		
		ArrayList<FreeBoard_DTO> Free_Board_dtos = free_board_dao.list(nPage);
		request.setAttribute("list", Free_Board_dtos);
		
		System.out.println("[test] Board_dtos: " + Free_Board_dtos);
	}

}
