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

import com.study.jsp.chat.BCommand;
import com.study.jsp.chat.BCommand_Int;




@WebServlet("*.chat")
public class Frontcontroller_chat extends HttpServlet
{
	private static final long serialVersionUID = 1L;


	public Frontcontroller_chat()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public void sendJson(HttpServletResponse response, String json_data) throws ServletException, IOException
	{
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println(json_data);
		writer.close();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doAction(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		doAction(request, response);
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
		
		if(com.equals("/chatRoom.chat")) // chatRoom.chat
		{
			System.out.println("[확인] : chatRoom.chat");
			
			//command = new MModeCommand();
			//command.execute(request, response);
			
			viewPage = "chatRoom.jsp";
			
//			String json_data = "{\"code\" : \"success\", \"desc\" : \"회원가입에 성공하였습니다.\"}";
//			sendJson(response, json_data);		
//			return;
			
		}
		

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
