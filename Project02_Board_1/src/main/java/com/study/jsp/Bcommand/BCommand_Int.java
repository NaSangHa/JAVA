package com.study.jsp.Bcommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BCommand_Int
{
	public int execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
}
