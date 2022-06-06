package com.study.jsp.Bcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.FreeBoard_DAO;
import com.study.jsp.dto.FreeBoard_DTO;

public class BFreeBoardViewCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String fbId = request.getParameter("fbId");
		String fbName = request.getParameter("fbName");
		String loginName = request.getParameter("loginName");
		
		System.out.println("[Test] BFreeBoardViewCommand 입장");
		System.out.println("[자유게시판 게시글 번호] fbId : " + fbId);
		System.out.println("[자유게시판 작성자 아이디] fbName : " + fbName);
		System.out.println("[현재 로그인 이름] loginName : " + loginName);
		
		FreeBoard_DAO free_board_dao = FreeBoard_DAO.getInstance();
		FreeBoard_DTO free_board_dto = free_board_dao.contentView(fbId, fbName, loginName);
		
		System.out.println("[Test] free_board_dto : " + free_board_dto);
		
		request.setAttribute("freeBoard_view", free_board_dto);
	}

}
