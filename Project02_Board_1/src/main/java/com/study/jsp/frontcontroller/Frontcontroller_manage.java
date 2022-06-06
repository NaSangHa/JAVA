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

import com.study.jsp.manage.BCommand;
import com.study.jsp.manage.BCommand_Int;
import com.study.jsp.manage.BCommand_String;
import com.study.jsp.manage.CheckCaptchaCommand;
import com.study.jsp.manage.DeleteMemberCommand;
import com.study.jsp.manage.GetCaptchaKeyCommand;
import com.study.jsp.manage.GradeDownCommand;
import com.study.jsp.manage.GradeUpCommand;
import com.study.jsp.manage.LoadIdSessionCommand;
import com.study.jsp.manage.MModeCommand;
import com.study.jsp.manage.MemberManageCommand;
import com.study.jsp.manage.SummingBoardCommand;
import com.study.jsp.manage.SummingFreeBoardCommand;

@WebServlet("*.manage")
public class Frontcontroller_manage extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public Frontcontroller_manage()
	{
		super();
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
		BCommand_String command_String = null;
		
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
		
		if(com.equals("/mMode.manage")) // mMode.manage
		{
			System.out.println("[확인] : mMode.manage");
			
			command = new MModeCommand();
			command.execute(request, response);
			
			viewPage = "mMode.jsp";
			
//			String json_data = "{\"code\" : \"success\", \"desc\" : \"회원가입에 성공하였습니다.\"}";
//			sendJson(response, json_data);		
//			return;
			
		}
		else if(com.equals("/memberManage.manage")) // memberManage.manage
		{
			System.out.println("[확인] : memberManage.manage");
			
			command = new MemberManageCommand();
			command.execute(request, response);
			
			viewPage = "mMode_memberManage.jsp";
						
		}
		else if(com.equals("/gradeUp.manage")) // gradeUp.manage
		{
			System.out.println("[확인] : gradeUp.manage");
			
			command = new GradeUpCommand();
			command.execute(request, response);
			
			viewPage = "memberManage.manage";
						
		}
		else if(com.equals("/gradeDown.manage")) // gradeDown.manage
		{
			System.out.println("[확인] : gradeDown.manage");
			
			command = new GradeDownCommand();
			command.execute(request, response);
			
			viewPage = "memberManage.manage";
			
		}
		else if(com.equals("/deleteMember.manage")) // deleteMember.manage
		{
			System.out.println("[확인] : deleteMember.manage");
		
			command = new DeleteMemberCommand();
			command.execute(request, response);
			
			viewPage = "memberManage.manage";
		}
		else if(com.equals("/boardManage.manage")) // boardManage.manage
		{
			System.out.println("[확인] : boardManage.manage");
			
			viewPage = "mMode_boardManage.jsp";
		}
		else if(com.equals("/summingBoard.manage")) // summingBoard.manage
		{
			System.out.println("[확인] : summingBoard.manage");
			
			command = new SummingBoardCommand();
			command.execute(request, response);
			
			viewPage = "mMode_boardSumming.jsp";
		}
		else if(com.equals("/freeBoardManage.manage")) // freeBoardManage.manage
		{
			System.out.println("[확인] : freeBoardManage.manage");
						
			viewPage = "mMode_freeBoardManage.jsp";
		}
		else if(com.equals("/summingFreeBoard.manage")) // summingFreeBoard.manage
		{
			System.out.println("[확인] : summingFreeBoard.manage");
			
			command = new SummingFreeBoardCommand();
			command.execute(request, response);
			
			viewPage = "mMode_freeBoardSumming.jsp";
		}
		else if(com.equals("/getCaptchaKey.manage")) // checkCaptcha.manage
		{
			System.out.println("[확인] : getCaptchaKey.manage");
			
			command_String = new GetCaptchaKeyCommand();
			String key = command_String.execute(request, response);
			
			sendJson(response, key);		
			return;
		}
		else if(com.equals("/checkCaptcha.manage")) // checkCaptcha.manage
		{
			System.out.println("[확인] : checkCaptcha.manage");
			
			command_String = new CheckCaptchaCommand();
			String result = command_String.execute(request, response);
			
			sendJson(response, result);		
			return;
			// viewPage = "deleteMember.manage";
		}
		else if(com.equals("/popUp.manage")) // checkCaptcha.manage
		{
			System.out.println("[확인] : popUp.manage");
			command = new LoadIdSessionCommand();
			command.execute(request, response);
			
			viewPage = "popUp.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
