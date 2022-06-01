package com.study.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.study.jsp.dto.Member_DTO;


public class Member_DAO
{
	private static Member_DAO instance = new Member_DAO();
	DataSource dataSource = null;
	
	public static final int MEMBERS_LOGIN_SUCCESS = 1;
	public static final int MEMBERS_LOGIN_FAIL = 0;
	public static final int ID_DOUBLE = 0;
	public static final int ID_NOT_DOUBLE = 1;

	int listCount = 5;
	int pageCount = 10;

	private Member_DAO()
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

	public static Member_DAO getInstance()
	{
		return instance;
	}

	public int insertMember(String id, String pw, String name, String phone, String eMail, String gender)
	{
		int ri = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into members (id, pw, name, phone, eMail, gender ) values (?, ?, ?, ?, ?, ?)";

		try
		{
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, phone);
			pstmt.setString(5, eMail);
			pstmt.setString(6, gender);

			ri = pstmt.executeUpdate();

		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			try
			{
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2)
			{
				e2.printStackTrace();
			}
		}

		return ri;
	}

	public int pwCheck(String id, String pw)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		try
		{
			con = dataSource.getConnection();
			
			String query = "select pw from members where id = ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next())
			{
				String upw = resultSet.getString("pw");
				
				if(upw.equals(pw)) 
				{
					System.out.println("[Test] 비밀번호가 일치합니다.");
					
					return MEMBERS_LOGIN_SUCCESS;
				}
				
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
		
		return MEMBERS_LOGIN_FAIL;
	}
	
	public Member_DTO loginMember(String uid)
	{

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		Member_DTO member_dto = null;
		
		String login_result = "";
		

		try
		{
			con = dataSource.getConnection();
			
			String query = "select * from members where id = ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, uid);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next())
			{
				String id = resultSet.getString("id");
				String pw = resultSet.getString("pw");
				String name = resultSet.getString("name"); 
				String phone = resultSet.getString("phone");
				String eMail = resultSet.getString("eMail");
				String gender = resultSet.getString("gender");
				int grade = resultSet.getInt("grade");
				Timestamp joinDate = resultSet.getTimestamp("joinDate");
				
				member_dto = new Member_DTO(id, pw, name, phone, eMail, gender, grade, joinDate);
				
				
				
				return member_dto;
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
		
		return member_dto;
		
	}

	public int idCheck(String id)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		String login_result = "";
		

		try
		{
			con = dataSource.getConnection();
			
			String query = "select id from members where id = ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next())
			{
				String result = resultSet.getString("id");				
				
				return ID_DOUBLE;
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
		
		return ID_NOT_DOUBLE;
	}

	public void myInfoModify(String id, String pw, String name, String phone, String eMail)
	{
		int ri = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		try
		{
			System.out.println("[Test] MyInfo 수정 입장하였습니다.");
			
			String query = "update members set pw = ?, name = ?, phone = ?, eMail = ? where id = ?";
			
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			pstmt.setString(4, eMail);
			pstmt.setString(5, id);

			ri = pstmt.executeUpdate();
			
			System.out.println("[Test] MyInfo 수정에 성공하였습니다.");

		} catch (Exception e)
		{
			e.printStackTrace();
		} finally
		{
			try
			{
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2)
			{
				e2.printStackTrace();
			}
		}
	}
}
