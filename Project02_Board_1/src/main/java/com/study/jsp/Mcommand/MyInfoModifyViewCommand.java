package com.study.jsp.Mcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.dao.Member_DAO;
import com.study.jsp.dto.Member_DTO;

public class MyInfoModifyViewCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
	{
		String id = request.getParameter("id");
		System.out.println("[폼에서 받아온] id : " + id);
		
		Member_DAO member_dao = Member_DAO.getInstance();
		Member_DTO member_dto = member_dao.loginMember(id);
		
		System.out.println("[로그인 결과] : " + member_dto);
		
		request.setAttribute("myInfo", member_dto);		
		request.setAttribute("myInfo_id", member_dto.getId());		
		request.setAttribute("myInfo_name", member_dto.getName());		
		request.setAttribute("myInfo_grade", member_dto.getGrade());		
		request.setAttribute("myInfo_phone", member_dto.getPhone());		
		request.setAttribute("myInfo_eMail", member_dto.geteMail());		
		request.setAttribute("myInfo_gender", member_dto.getGender());				
	}


}
