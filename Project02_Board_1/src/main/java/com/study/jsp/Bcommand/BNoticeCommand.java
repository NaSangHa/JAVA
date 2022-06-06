package com.study.jsp.Bcommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.dao.Board_DAO;
import com.study.jsp.dto.BPageInfo;
import com.study.jsp.dto.Board_DTO;

public class BNoticeCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		System.out.println("[test] BNoticeCommand 입장");
		
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
		
		Board_DAO board_dao = Board_DAO.getInstance();
		BPageInfo pinfo = board_dao.articlePage(nPage);
		request.setAttribute("page", pinfo);		
		
		nPage = pinfo.getCurPage();	// 현재 페이지
		
		// System.out.println("[test] nPage: " + nPage);
		
		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("cpage", nPage);
		
		ArrayList<Board_DTO> Board_dtos = board_dao.list(nPage);
		request.setAttribute("list", Board_dtos);
		
		System.out.println("[test] Board_dtos: " + Board_dtos);
	}

}
