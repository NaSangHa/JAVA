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

public class BNoticeWriteCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bFile = request.getParameter("bFile");
		
		System.out.println("[Test] 공지사항 bName : " + bName);
		System.out.println("[Test] 공지사항 bTitle : " + bTitle);
		System.out.println("[Test] 공지사항 bContent : " + bContent);
		System.out.println("[Test] 공지사항 bFile : " + bFile);
		
		
		Board_DAO board_dao = Board_DAO.getInstance();
		board_dao.insertNotice(bName, bTitle, bContent, bFile);
	}

}
