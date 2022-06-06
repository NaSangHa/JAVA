package com.study.jsp.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.jsp.ApiExamCaptchaImage;
import com.study.jsp.ApiExamCaptchaNkey;
import com.study.jsp.ApiExamCaptchaNkeyResult;


public class CheckCaptchaCommand implements BCommand_String
{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String captcha_key = request.getParameter("captcha_key");
		String user_input = request.getParameter("captcha_input");
		
		System.out.println("[캡챠 키] : " + captcha_key);
		System.out.println("[사용자가 입력한 값] : " + user_input);
		
		
		ApiExamCaptchaNkey apiExamCaptchaNkey = new ApiExamCaptchaNkey();
		ApiExamCaptchaNkeyResult apiExamCaptchaNkeyResult = new ApiExamCaptchaNkeyResult();
		ApiExamCaptchaImage apiExamCaptchaImage = new ApiExamCaptchaImage();
		
		String result = apiExamCaptchaNkeyResult.resultJson(captcha_key, user_input);
		
		System.out.println("[result] : " + result);
		
		return result;
	}
}
