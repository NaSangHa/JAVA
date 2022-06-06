package com.study.jsp.manage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.Member_DAO;
import com.study.jsp.dto.Member_DTO;



public class MemberManageCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Member_DAO member_dao = Member_DAO.getInstance();
			
		ArrayList<Member_DTO> bronzeMember = member_dao.getBronzeMember();
		ArrayList<Member_DTO> silverMember = member_dao.getSilverMember();
		ArrayList<Member_DTO> goldMember = member_dao.getGoldMember();

		
		request.setAttribute("bronzeMember", bronzeMember);
		request.setAttribute("silverMember", silverMember);
		request.setAttribute("goldMember", goldMember);
		
	}
}
