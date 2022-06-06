package com.study.jsp.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.study.jsp.comments.BCommand;
import com.study.jsp.comments.BCommand_Int;
import com.study.jsp.comments.RegCommentCommand;
import com.study.jsp.comments.RegFCommentCommand;

@WebServlet("*.comments")
public class Frontcontroller_comments extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public Frontcontroller_comments()
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		doAction(request, response);
	}
	
	public void sendJson(HttpServletResponse response, String json_data) throws ServletException, IOException
	{
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(json_data);
		writer.close();
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		BCommand command = null;
		BCommand_Int command_Int = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		HttpSession session = null;
		session = request.getSession();
		int curPage = 1;
		if(session.getAttribute("cpage") != null)
		{
			curPage = (int)session.getAttribute("cpage");
		}
		
		// -------------------------------------------------------
		
		if(com.equals("/reg_comment.comments")) // reg_comment.comments
		{
			System.out.println("[입장] : reg_comment.comments");
			command = new RegCommentCommand();
			command.execute(request, response);
			
			String json_data = "{\"code\" : \"success\", \"desc\" : \"댓글이 등록 되었습니다.\"}";
			sendJson(response, json_data);
			
			return;
			
			//viewPage = "login.jsp";
		}
		else if(com.equals("/reg_fcomment.comments")) // reg_fcomment.comments
		{
			System.out.println("[입장] : reg_fcomment.comments");
			command = new RegFCommentCommand();
			command.execute(request, response);
			
			String json_data = "{\"code\" : \"success\", \"desc\" : \"댓글이 등록 되었습니다.\"}";
			sendJson(response, json_data);
			
			return;
			
			//viewPage = "login.jsp";
		}
		
		
	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
