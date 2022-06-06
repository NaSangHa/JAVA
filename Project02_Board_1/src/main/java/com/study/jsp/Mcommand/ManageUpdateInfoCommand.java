package com.study.jsp.Mcommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.Member_DAO;
import com.study.jsp.dto.Member_DTO;

public class ManageUpdateInfoCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		String id = request.getParameter("id");
		
		System.out.println("[수정할 회원 id] : " + id);
		
		Member_DAO member_dao = Member_DAO.getInstance();
		Member_DTO updateMember = member_dao.loginMember(id);
				
		request.setAttribute("updateMember", updateMember);
		
	}


}
