package com.study.jsp.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.ApiExamCaptchaImage;
import com.study.jsp.ApiExamCaptchaNkey;
import com.study.jsp.ApiExamCaptchaNkeyResult;


public class GetCaptchaKeyCommand implements BCommand_String
{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		//String id = request.getParameter("id");
		
		ApiExamCaptchaNkey apiExamCaptchaNkey = new ApiExamCaptchaNkey();
		ApiExamCaptchaNkeyResult apiExamCaptchaNkeyResult = new ApiExamCaptchaNkeyResult();
		ApiExamCaptchaImage apiExamCaptchaImage = new ApiExamCaptchaImage();
		
		
		String key_Json = apiExamCaptchaNkey.getKey();
		
		System.out.println(key_Json);
		
		return key_Json;
	}
}
