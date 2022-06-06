package com.study.jsp.Mcommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.Member_DAO;
import com.study.jsp.dto.Member_DTO;

public class ManageMemberCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		Member_DAO member_dao = Member_DAO.getInstance();
		
		ArrayList<Member_DTO> members = member_dao.allMembers();
		
		int total_member = member_dao.memberCount();		
		System.out.println("[총 인원수] : " + total_member);
		request.setAttribute("total_member", total_member);

		request.setAttribute("members", members);		
				
	}


}
