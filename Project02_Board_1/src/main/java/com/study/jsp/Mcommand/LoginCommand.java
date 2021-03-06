package com.study.jsp.Mcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.dao.Member_DAO;
import com.study.jsp.dto.Member_DTO;

public class LoginCommand implements BCommand_Int
{
	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println("[폼에서 받아온] id : " + id);
		System.out.println("[폼에서 받아온] pw : " + pw);
		
		if(id.equals("guest") && pw.equals("0"))
		{
			System.out.println("네이버로 로그인 되었습니다.");
			
			HttpSession session = null;
			session = request.getSession();
			session.setAttribute("member_dto_id", id);
			
			return 2;
		}
		
		
		Member_DAO dao = Member_DAO.getInstance();
		
		int loginResult = dao.pwCheck(id, pw);
		
		if(loginResult == 1)
		{
			Member_DTO member_dto = dao.loginMember(id);
			
			HttpSession session = null;
			session = request.getSession();
			session.setAttribute("member_dto_id", member_dto.getId());
			session.setAttribute("member_dto_name", member_dto.getName());
			session.setAttribute("member_dto_grade", member_dto.getGrade());
			
			System.out.println("로그인에 성공하였습니다.");
			//response.sendRedirect("loginOk.member");
			
			return 1;
		}
		else
		{
			System.out.println("로그인에 실패하였습니다.");
			//response.sendRedirect("login.jsp");
			
			return 0;
		}
		
	}


}

