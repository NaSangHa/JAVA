package com.study.jsp.Bcommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.dao.Comments_DAO;
import com.study.jsp.dto.Comments_DTO;



public class ShowCommentCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String bId = request.getParameter("bId");
		System.out.println("[Test] bId : " + bId);
	
		Comments_DAO comments_dao = Comments_DAO.getInstance();
		ArrayList<Comments_DTO> comments_dtos = comments_dao.getComment(bId);
	
		request.setAttribute("comments", comments_dtos);
	}
}
