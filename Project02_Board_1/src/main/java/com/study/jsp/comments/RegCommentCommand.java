package com.study.jsp.comments;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.Comments_DAO;



public class RegCommentCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String bId = request.getParameter("bId");
		String id = request.getParameter("id");
		String cContent = request.getParameter("cContent");
		
		System.out.println("[Test] RegCommentCommand / bId : " + bId);
		System.out.println("[Test] RegCommentCommand / id : " + id);
		System.out.println("[Test] RegCommentCommand / cContent : " + cContent);
		
		
		Comments_DAO comments_dao = Comments_DAO.getInstance();
		comments_dao.insertComment(bId, id, cContent);
	}
}
