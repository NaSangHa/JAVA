package com.study.jsp.Mcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.Member_DAO;

public class JoinCommand implements BCommand
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
		
		String gender = request.getParameter("gender");
		String eMail = request.getParameter("eMail");
		String eMail_sub = request.getParameter("eMail_sub");
		
		eMail = eMail + eMail_sub;
		
		
		System.out.println("[Test] id : " + id);
		System.out.println("[Test] pw : " + pw);
		System.out.println("[Test] name : " + name);
		System.out.println("[Test] phone1 : " + phone1);
		System.out.println("[Test] phone2 : " + phone2);
		System.out.println("[Test] phone3 : " + phone3);
		System.out.println("[Test] phone : " + phone);
		System.out.println("[Test] gender : " + gender);
		System.out.println("[Test] eMail : " + eMail);
		
		
		Member_DAO dao = Member_DAO.getInstance();
		dao.insertMember(id, pw, name, phone, eMail, gender);
	}

}
