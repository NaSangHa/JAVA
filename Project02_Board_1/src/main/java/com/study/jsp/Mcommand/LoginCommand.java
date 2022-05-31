package com.study.jsp.Mcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.dao.Member_DAO;
import com.study.jsp.dto.Member_DTO;

public class LoginCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println("[폼에서 받아온] id : " + id);
		System.out.println("[폼에서 받아온] pw : " + pw);
		
		
		Member_DAO dao = Member_DAO.getInstance();
		Member_DTO member_dto = dao.loginMember(id);
		
		System.out.println("[로그인 결과] : " + member_dto);
		
		if(member_dto != null) 
		{
			HttpSession session = null;
			session = request.getSession();
			session.setAttribute("member_dto_id", member_dto.getId());
			session.setAttribute("member_dto_name", member_dto.getName());
			
			System.out.println("로그인에 성공하였습니다.");
			response.sendRedirect("loginOk.member");
		}
		else
		{
			System.out.println("로그인에 실패하였습니다.");
			response.sendRedirect("login.jsp");
		}
		
	}


}
