package com.study.jsp.Bcommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.FComments_DAO;
import com.study.jsp.dto.FComments_DTO;



public class ShowFCommentCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String fbId = request.getParameter("fbId");
		System.out.println("[Test] ShowFCommentCommand / bId : " + fbId);
	
		FComments_DAO fcomments_dao = FComments_DAO.getInstance();
		ArrayList<FComments_DTO> fcomments_dtos = fcomments_dao.getComment(fbId);
		
		System.out.println("[ShowFCommentCommand] fcomments_dtos" + fcomments_dtos);
		request.setAttribute("fcomments", fcomments_dtos);
	}
}
