package com.study.jsp.Mcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.dao.Member_DAO;
import com.study.jsp.dto.Member_DTO;

public class MyInfoModifyCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		
		String eMail = request.getParameter("eMail");
		String eMail_sub = request.getParameter("eMail_sub");
		
		eMail = eMail + eMail_sub;
		
		System.out.println("[Test] 수정 id : " + id);
		System.out.println("[Test] 수정 pw : " + pw);
		System.out.println("[Test] 수정 name : " + name);
		System.out.println("[Test] 수정 phone1 : " + phone1);
		System.out.println("[Test] 수정 phone2 : " + phone2);
		System.out.println("[Test] 수정 phone3 : " + phone3);
		System.out.println("[Test] 수정 phone : " + phone);
		System.out.println("[Test] 수정 eMail : " + eMail);
		
		Member_DAO member_dao = Member_DAO.getInstance();
		member_dao.myInfoModify(id, pw, name, phone, eMail);
		
		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("member_dto_name", name);
		
	}


}
