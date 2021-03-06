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
import com.study.jsp.Mcommand.ManageMemberCommand;
import com.study.jsp.Mcommand.ManageUpdateInfoCommand;
import com.study.jsp.Mcommand.MyInfoCommand;
import com.study.jsp.Mcommand.MyInfoModifyCommand;
import com.study.jsp.Mcommand.MyInfoModifyViewCommand;

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
			System.out.println("[??????] : join.member");
			command = new JoinCommand();
			command.execute(request, response);
			
			String json_data = "{\"code\" : \"success\", \"desc\" : \"??????????????? ?????????????????????.\"}";
			sendJson(response, json_data);
			
			return;
			
			//viewPage = "login.jsp";
		}
		else if(com.equals("/login.member")) // login.member
		{
			System.out.println("[??????] : login.member");
			command_Int = new LoginCommand();
			int login_result = command_Int.execute(request, response);
			
			
			if (login_result == 1)
			{
				viewPage = "loginOk.member";
			}
			else if(login_result == 2)
			{
				viewPage = "main.board";
			}
			else
			{
				String json_data = "{\"code\" : \"fail\", \"desc\" : \"??????????????? ???????????? ????????????.\"}";
				sendJson(response, json_data);
				return;
			}			
			//viewPage = "login.jsp";
		}
		else if(com.equals("/loginOk.member")) // login.member
		{
			System.out.println("[??????] : loginOk.member");
			
			String json_data = "{\"code\" : \"success\", \"desc\" : \"???????????? ?????????????????????.\"}";
			sendJson(response, json_data);
			
			return;
		}
		else if(com.equals("/idCheck.member")) // idCheck.member
		{
			System.out.println("[??????] : idCheck.member");
			
			command_Int = new IdCheckCommand();
			int result = command_Int.execute(request, response);
			
			System.out.println("[??????] result : result");
			
			String json_data = "";
			if(result == 1)
			{
				json_data = "{\"code\" : \"success\", \"desc\" : \"??????????????? ????????? ?????????.\"}";				
			}
			else
			{
				json_data = "{\"code\" : \"fail\", \"desc\" : \"?????? ???????????? ????????? ?????????.\"}";
			}
			
			sendJson(response, json_data);
			
			return;
		}
		else if(com.equals("/myInfo.member")) // myInfo.member
		{
			System.out.println("[??????] : myInfo.member");
			
			command = new MyInfoCommand();
			command.execute(request, response);
			
			viewPage = "myInfo.jsp";
		}
		else if(com.equals("/myInfo_modify_view.member")) // myInfo_modify_view.member
		{
			System.out.println("[??????] : myInfo_modify_view.member");
			
			command = new MyInfoModifyViewCommand();
			command.execute(request, response);
			
			viewPage = "myInfo_modify_view.jsp";
		}
		else if(com.equals("/myInfo_modify.member")) // myInfo_modify.member
		{
			System.out.println("[??????] : myInfo_modify.member");
			
			command = new MyInfoModifyCommand();
			command.execute(request, response);
			
			String json_data = "{\"code\" : \"success\", \"desc\" : \"???????????? ?????????????????????.\"}";
			sendJson(response, json_data);
			
			return;
			// viewPage = "myInfo_modify_view.jsp";
		}
		else if(com.equals("/mMode_member.member")) // mMode_member.member
		{
			System.out.println("[??????] : mMode_member.member");
			
			command = new ManageMemberCommand();
			command.execute(request, response);
				
			viewPage = "mMode_member.jsp";
		}
		else if(com.equals("/mMode_updateMemberInfo.member")) // mMode_updateMemberInfo.member
		{
			System.out.println("[??????] : mMode_updateMemberInfo.member");
			
			command = new ManageUpdateInfoCommand();
			command.execute(request, response);
			
			viewPage = "mMode_updateMember.jsp";
		}
		
	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
