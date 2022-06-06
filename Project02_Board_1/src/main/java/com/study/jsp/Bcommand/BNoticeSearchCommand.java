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
		
		System.out.println("search_method" + search_method);
		System.out.println("search_content" + search_content);
		
		
		BPageInfo pinfo = board_dao.searchArticlePage(search_method, search_content, nPage);
		//BPageInfo pinfo = board_dao.articlePage(nPage);
		

		request.setAttribute("page", pinfo);		
		nPage = pinfo.getCurPage();	// 현재 페이지
		
		ArrayList<Board_DTO> search_dtos = board_dao.searchNotice(nPage, search_method, search_content);
		request.setAttribute("list", search_dtos);

		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("cpage", nPage);
		session.setAttribute("search_method", search_method);
		session.setAttribute("search_content", search_content);
		
		
		// 검색된 게시글 모음	

		
	
	}

}
