package com.study.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.study.jsp.dto.BPageInfo;
import com.study.jsp.dto.Board_DTO;


public class Board_DAO
{
	private static Board_DAO instance = new Board_DAO();
	DataSource dataSource = null;
	
	public static final int MEMBERS_LOGIN_SUCCESS = 1;
	public static final int MEMBERS_LOGIN_FAIL = 1;
	public static final int ID_DOUBLE = 0;
	public static final int ID_NOT_DOUBLE = 1;

	int listCount = 10;
	int pageCount = 10;

	private Board_DAO()
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

	public static Board_DAO getInstance()
	{
		return instance;
	}

	public ArrayList<Board_DTO> list(int curPage)
	{
		ArrayList<Board_DTO> dtos = new ArrayList<Board_DTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		// 첫 게시뭉
		int nStart = (curPage - 1) * listCount + 1;
		// 마지막 게시물
		int nEnd = (curPage - 1) * listCount + listCount;
		
		try
		{
			con = dataSource.getConnection();
			
			String query = "select * "
						+ "from ("
						+ 		"select rownum num, A.* "
						+ "		 from (select * from board order by bgroup desc, bstep asc ) A "
						+ "		 where rownum <= ? "
						+ ") B "
						+ "where B.num >= ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nEnd);
			pstmt.setInt(2, nStart);
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next())
			{
				int bId = resultSet.getInt("bId");
				String bName = resultSet.getString("bName");
				String bTitle = resultSet.getString("bTitle");
				String bContent = resultSet.getString("bContent");
				Timestamp bDate = resultSet.getTimestamp("bDate");
				int bHit = resultSet.getInt("bHit");
				int bGroup = resultSet.getInt("bGroup");
				int bStep = resultSet.getInt("bStep");
				int bIndent = resultSet.getInt("bIndent");
				String bFile = resultSet.getString("bFile");
				int bLike = resultSet.getInt("bLike");
				int bHate = resultSet.getInt("bHate");
				
				Board_DTO dto = new Board_DTO(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent, bFile, bLike, bHate);
				
				dtos.add(dto);
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
		
		return dtos;
		
	}

	public BPageInfo articlePage(int curPage)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		int listCount = 10;	// 한 페이지당 보여중 게시물의 갯수
		int pageCount = 10;	// 하단에 보여줄 페이지 리스트의 갯수
		
		int totalCount = 0;	// 총 게시물의 갯수
		try
		{
			con = dataSource.getConnection();
			
			String query = "select count(*) as total from mvc_board";
			pstmt = con.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next())
			{
				totalCount = resultSet.getInt("total");
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
		
		// totalCount = 54
		// listCount = 5;	// 한 페이지당 보여중 게시물의 갯수
		// pageCount = 3;	// 하단에 보여줄 페이지 리스트의 갯수
		
		// 총 페이지 수
		int totalPage = totalCount / listCount;
		if(totalCount % listCount > 0)
		{
			totalPage++;
		}
		
		// 현재 페이지
		int myCurPage = curPage;
		if(myCurPage > totalPage)
		{
			myCurPage = totalPage;
		}
		if(myCurPage < 1)
		{
			myCurPage = 1;
		}
		
		// 시작페이지
		int startPage = ((myCurPage - 1) / pageCount ) * pageCount + 1;
		
		// 끝페이지
		int endPage = startPage + pageCount - 1;
		if (endPage > totalPage)
		{
			endPage = totalPage;			
		}
		
		BPageInfo pinfo = new BPageInfo();
		pinfo.setTotalCount(totalCount);
		pinfo.setListCount(listCount);
		pinfo.setTotalPage(totalPage);
		pinfo.setCurPage(myCurPage);
		pinfo.setPageCount(pageCount);
		pinfo.setStartPage(startPage);
		pinfo.setEndPage(endPage);
		
		return pinfo;
		
	}

	public Board_DTO contentView(String strID)
	{
		// upHit(strID);
		
		Board_DTO board_dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try
		{
			con = dataSource.getConnection();
			
			String query = "select * from board where bId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(strID));
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next())
			{
				int bId = resultSet.getInt("bId");
				String bName = resultSet.getString("bName");
				String bTitle = resultSet.getString("bTitle");
				String bContent = resultSet.getString("bContent");
				Timestamp bDate = resultSet.getTimestamp("bDate");
				int bHit = resultSet.getInt("bHit");
				int bGroup = resultSet.getInt("bGroup");
				int bStep = resultSet.getInt("bStep");
				int bIndent = resultSet.getInt("bIndent");
				String bFile = resultSet.getString("bFile");
				int bLike = resultSet.getInt("bLike");
				int bHate = resultSet.getInt("bHate");
				
				board_dto = new Board_DTO(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent, bFile, bLike, bHate);
	
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
		
		return board_dto;
	}

	public void notice_modify(String bId, String bTitle, String bContent, String bFile)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			con = dataSource.getConnection();
			
			String query = "update board set bTitle = ?, bContent = ?, bFile = ? where bId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bTitle);
			pstmt.setString(2, bContent);
			pstmt.setString(3, bFile);
			pstmt.setString(4, bId);
			
			int rn = pstmt.executeUpdate();
			System.out.println("[Test] 수정 성공");
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

	public void insertNotice(String bName, String bTitle, String bContent, String bFile)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			con = dataSource.getConnection();
			
			String query = "insert into board (bId, bName, bTitle, bContent, bGroup, bStep, bIndent, bFile) values (board_seq.nextval, ?, ?, ?, board_seq.currval, 0, 0, ?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setString(4, bFile);
			
			int rn = pstmt.executeUpdate();
			System.out.println("[Test] 등록 성공");
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
	
}
