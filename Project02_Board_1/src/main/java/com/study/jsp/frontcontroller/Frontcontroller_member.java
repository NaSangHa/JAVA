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

import com.study.jsp.Mcommand.BCommand;
import com.study.jsp.Mcommand.BCommand_Int;
import com.study.jsp.Mcommand.IdCheckCommand;
import com.study.jsp.Mcommand.JoinCommand;
import com.study.jsp.Mcommand.LoginCommand;

@WebServlet("*.member")
public class Frontcontroller_member extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public Frontcontroller_member()
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
		
		if(com.equals("/join.member")) // join.member
		{
			System.out.println("[확인] : join.member");
			command = new JoinCommand();
			command.execute(request, response);
			
			String json_data = "{\"code\" : \"success\", \"desc\" : \"회원가입에 성공하였습니다.\"}";
			sendJson(response, json_data);
			
			return;
			
			//viewPage = "login.jsp";
		}
		else if(com.equals("/login.member")) // login.member
		{
			System.out.println("[확인] : login.member");
			command = new LoginCommand();
			command.execute(request, response);
			
			return;
			
			//viewPage = "login.jsp";
		}
		else if(com.equals("/loginOk.member")) // login.member
		{
			System.out.println("[확인] : loginOk.member");
			
			String json_data = "{\"code\" : \"success\", \"desc\" : \"로그인에 성공하였습니다.\"}";
			sendJson(response, json_data);
			
			return;
		}
		else if(com.equals("/idCheck.member")) // login.member
		{
			System.out.println("[확인] : idCheck.member");
			
			command_Int = new IdCheckCommand();
			int result = command_Int.execute(request, response);
			
			System.out.println("[확인] result : result");
			
			String json_data = "";
			if(result == 1)
			{
				json_data = "{\"code\" : \"success\", \"desc\" : \"사용가능한 아이디 입니다.\"}";				
			}
			else
			{
				json_data = "{\"code\" : \"fail\", \"desc\" : \"이미 존재하는 아이디 입니다.\"}";
			}
			
			sendJson(response, json_data);
			
			return;
		}
		
	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
