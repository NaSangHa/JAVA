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

import com.study.jsp.Bcommand.BCommand;
import com.study.jsp.Bcommand.BCommand_Int;
import com.study.jsp.Bcommand.BFreeBoardCommand;
import com.study.jsp.Bcommand.BFreeBoardDeleteCommand;
import com.study.jsp.Bcommand.BFreeBoardModifyCommand;
import com.study.jsp.Bcommand.BFreeBoardViewCommand;
import com.study.jsp.Bcommand.BFreeBoardWriteCommand;
import com.study.jsp.Bcommand.BNoticeCommand;
import com.study.jsp.Bcommand.BNoticeDeleteCommand;
import com.study.jsp.Bcommand.BNoticeModifyCommand;
import com.study.jsp.Bcommand.BNoticeSearchCommand;
import com.study.jsp.Bcommand.BNoticeViewCommand;
import com.study.jsp.Bcommand.BNoticeWriteCommand;


@WebServlet("*.board")
public class Frontcontroller_board extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public Frontcontroller_board()
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
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
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
		if (session.getAttribute("cpage") != null)
		{
			curPage = (int) session.getAttribute("cpage");
		}

		// -------------------------------------------------------

		if (com.equals("/notice.board")) // notice.board
		{
			System.out.println("[확인] : notice.board");
			command = new BNoticeCommand();
			command.execute(request, response);

			viewPage = "notice.jsp";
		} 
		else if (com.equals("/notice_view.board")) // notice_view.board
		{
			System.out.println("[확인] : notice_view.board");
			command = new BNoticeViewCommand();
			command.execute(request, response);
						
			viewPage = "notice_view.jsp";
		} 
		else if (com.equals("/notice_modify_view.board")) // notice_modify_view.board
		{
			System.out.println("[확인] : notice_modify_view.board");
			command = new BNoticeViewCommand(); // 아이디에 대해서 DTO 가져오기
			command.execute(request, response);
					
			viewPage = "notice_modify_view.jsp";
		} 
		else if (com.equals("/notice_modify.board")) // notice_modify.board
		{
			System.out.println("[확인] : notice_modify.board");
			command = new BNoticeModifyCommand();
			command.execute(request, response);
			
			command = new BNoticeViewCommand(); // 아이디에 대해서 DTO 가져오기
			command.execute(request, response);
			
			String json_data = "{\"code\" : \"success\", \"desc\" : \"수정에 성공하였습니다.\"}";
			sendJson(response, json_data);
		} 
		else if (com.equals("/notice_write.board")) // notice_write.board
		{
			System.out.println("[확인] : notice_write.board");
			command = new BNoticeWriteCommand();
			command.execute(request, response);
			
			String json_data = "{\"code\" : \"success\", \"desc\" : \"등록에 성공하였습니다.\"}";
			sendJson(response, json_data);
		} 
		else if (com.equals("/notice_delete.board")) // notice_delete.board
		{
			System.out.println("[확인] : notice_delete.board");
			command = new BNoticeDeleteCommand();
			command.execute(request, response);
			
			viewPage = "notice.board?page=" + session.getAttribute("cpage");
		} 
		else if (com.equals("/search_notice.board")) // search_notice.board
		{
			System.out.println("[확인] : search_notice.board");
			command = new BNoticeSearchCommand();
			command.execute(request, response);
						
			viewPage = "notice_searchResult.jsp";
		} 
		//-----------------------------------------------------------------------
		else if (com.equals("/freeBoard.board")) // freeBoard.board
		{
			System.out.println("[확인] : freeBoard.board");
			command = new BFreeBoardCommand();
			command.execute(request, response);
			
			viewPage = "freeBoard.jsp";
		}
		else if (com.equals("/freeBoard_write.board")) // freeBoard_write.board
		{
			System.out.println("[확인] : freeBoard_write.board");
			command = new BFreeBoardWriteCommand();
			command.execute(request, response);
			
			String json_data = "{\"code\" : \"success\", \"desc\" : \"등록에 성공하였습니다.\"}";
			sendJson(response, json_data);
		}
		else if (com.equals("/freeBoard_view.board")) // freeBoard_view.board
		{
			System.out.println("[확인] : freeBoard_view.board");
			command = new BFreeBoardViewCommand();
			command.execute(request, response);
						
			viewPage = "freeBoard_view.jsp";
		}
		else if (com.equals("/freeBoard_modify_view.board")) // freeBoard_modify_view.board
		{
			System.out.println("[확인] : freeBoard_modify_view.board");
			command = new BFreeBoardViewCommand(); // 아이디에 대해서 DTO 가져오기
			command.execute(request, response);
					
			viewPage = "freeBoard_modify_view.jsp";
		} 
		else if (com.equals("/freeBoard_modify.board")) // freeBoard_modify.board
		{
			System.out.println("[확인] : freeBoard_modify.board");
			command = new BFreeBoardModifyCommand();
			command.execute(request, response);
			
			command = new BFreeBoardViewCommand(); // 아이디에 대해서 DTO 가져오기
			command.execute(request, response);
			
			String json_data = "{\"code\" : \"success\", \"desc\" : \"수정에 성공하였습니다.\"}";
			sendJson(response, json_data);
		} 
		else if (com.equals("/freeBoard_delete.board")) // freeBoard_delete.board
		{
			System.out.println("[확인] : freeBoard_delete.board");
			command = new BFreeBoardDeleteCommand();
			command.execute(request, response);
			
			viewPage = "freeBoard.board?page=" + session.getAttribute("cpage");
		} 
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}
}
