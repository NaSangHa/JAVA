package com.study.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.study.jsp.dto.FComments_DTO;


public class FComments_DAO
{
	private static FComments_DAO instance = new FComments_DAO();
	DataSource dataSource = null;
	
	private FComments_DAO()
	{
		try
		{
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e)
		{
			e.printStackTrace();
		}

	}

	public static FComments_DAO getInstance()
	{
		return instance;
	}
	
	public void insertComment(String fbId, String id, String fcContent)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			con = dataSource.getConnection();
			
			String query = "insert into free_comments (fbId, id, fcContent) values (?, ?, ? )";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fbId);
			pstmt.setString(2, id);
			pstmt.setString(3, fcContent);
			
			int rn = pstmt.executeUpdate();
			System.out.println("[Test] 자유게시판 댓글 등록 성공");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
	public ArrayList<FComments_DTO> getComment(String show_fbId)
	{
		ArrayList<FComments_DTO> fcomment_dtos = new ArrayList<FComments_DTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
				
		try
		{
			System.out.println("[Test] FComments_getComment 입장");
			con = dataSource.getConnection();
			
			String query = "select * from free_comments where fbId = ? order by fcDate desc";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(show_fbId));
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next())
			{
				System.out.println("[Test] FComments_getComment_resultSet 입장");
				
				String fbId = resultSet.getString("fbId");
				String id = resultSet.getString("id");
				String fcContent = resultSet.getString("fcContent");
				Timestamp fcDate = resultSet.getTimestamp("fcDate");
				int fcLike = resultSet.getInt("fcLike");
				int fcHate = resultSet.getInt("fcHate");
				
				
//				System.out.println("[자유게시판 댓글 테스트]" + fbId);
//				System.out.println("[자유게시판 댓글 테스트]" + id);
//				System.out.println("[자유게시판 댓글 테스트]" + fcContent);
//				System.out.println("[자유게시판 댓글 테스트]" + fcDate);
//				System.out.println("[자유게시판 댓글 테스트]" + fcLike);
//				System.out.println("[자유게시판 댓글 테스트]" + fcHate);

				
				FComments_DTO fcomments_dto = new FComments_DTO(fbId, id, fcContent, fcDate, fcLike, fcHate);
				
				fcomment_dtos.add(fcomments_dto);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(resultSet != null) resultSet.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		return fcomment_dtos;
	}
	
	
}
