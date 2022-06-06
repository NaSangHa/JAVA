package com.study.jsp.comments;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.dao.FComments_DAO;



public class RegFCommentCommand implements BCommand
{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String fbId = request.getParameter("fbId");
		String id = request.getParameter("id");
		String fcContent = request.getParameter("fcContent");
		
		System.out.println("[Test] RegCommentCommand / bId : " + fbId);
		System.out.println("[Test] RegCommentCommand / id : " + id);
		System.out.println("[Test] RegCommentCommand / cContent : " + fcContent);
		
		
		FComments_DAO fcomments_dao = FComments_DAO.getInstance();
		fcomments_dao.insertComment(fbId, id, fcContent);
	}
}
