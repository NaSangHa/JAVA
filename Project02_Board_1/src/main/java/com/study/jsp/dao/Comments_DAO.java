package com.study.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.study.jsp.dto.Comments_DTO;


public class Comments_DAO
{
	private static Comments_DAO instance = new Comments_DAO();
	DataSource dataSource = null;
	
	private Comments_DAO()
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

	public static Comments_DAO getInstance()
	{
		return instance;
	}
	
	public void insertComment(String bId, String id, String cContent)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			con = dataSource.getConnection();
			
			String query = "insert into comments (bId, id, cContent) values (?, ?, ? )";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bId);
			pstmt.setString(2, id);
			pstmt.setString(3, cContent);
			
			int rn = pstmt.executeUpdate();
			System.out.println("[Test] 댓글 등록 성공");
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
	public ArrayList<Comments_DTO> getComment(String show_bId)
	{
		ArrayList<Comments_DTO> comment_dtos = new ArrayList<Comments_DTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
				
		try
		{
			con = dataSource.getConnection();
			
			String query = "select * from comments where bId = ? order by cDate desc";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, show_bId);
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next())
			{
				String bId = resultSet.getString("bId");
				String id = resultSet.getString("id");
				String cContent = resultSet.getString("cContent");
				Timestamp cDate = resultSet.getTimestamp("cDate");
				int cLike = resultSet.getInt("cLike");
				int cHate = resultSet.getInt("cHate");

				
				Comments_DTO comments_dto = new Comments_DTO(bId, id, cContent, cDate, cLike, cHate);
				
				comment_dtos.add(comments_dto);
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
		
		return comment_dtos;
	}
	
	
}
