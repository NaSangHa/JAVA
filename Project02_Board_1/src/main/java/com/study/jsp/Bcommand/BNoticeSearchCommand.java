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

public class BNoticeSearchCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
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
		
		String search_method = request.getParameter("search_method");
		String search_content = request.getParameter("search_content");

		
		BPageInfo pinfo = board_dao.articlePage(nPage);
		request.setAttribute("page", pinfo);		
		nPage = pinfo.getCurPage();	// 현재 페이지
		
		
		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("cpage", nPage);
		
		ArrayList<Board_DTO> search_dtos = board_dao.searchNotice(nPage, search_method, search_content);
		request.setAttribute("slist", search_dtos);
		
		for(Board_DTO e: search_dtos)
		{
			System.out.println("검색결과 search_dtos : " + e.getbId());
			System.out.println("검색결과 search_dtos : " + e.getbName());
			System.out.println("검색결과 search_dtos : " + e.getbTitle());
			System.out.println("검색결과 search_dtos : " + e.getbContent());
		}
		
		System.out.println("for문 끝!");
			
	
	}

}
