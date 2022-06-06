package com.study.jsp.Bcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.dao.Board_DAO;
import com.study.jsp.dto.Board_DTO;

public class BNoticeViewCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String bId = request.getParameter("bId");
		String bName = request.getParameter("bName");
		String loginName = request.getParameter("loignName");
		
		
		Board_DAO board_dao = Board_DAO.getInstance();
		Board_DTO board_dto = board_dao.contentView(bId, bName, loginName);
		
		System.out.println("[받아온 bId] : " + bId);
		System.out.println("[받아온 bName] : " + bName);
		System.out.println("[현재 로그인된] : " + loginName);

		request.setAttribute("notice_view", board_dto);
		
		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("notice_view_bId", bId);
	}

}
