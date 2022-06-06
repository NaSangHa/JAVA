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
import com.study.jsp.dto.SummingResult_DTO;


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
		
		// 첫 게시물
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
			
			String query = "select count(*) as total from board";
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

	public BPageInfo searchArticlePage(String search_method, String search_content, int curPage)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		int listCount = 10;	// 한 페이지당 보여중 게시물의 갯수
		int pageCount = 10;	// 하단에 보여줄 페이지 리스트의 갯수
		int totalCount = 0;	// 총 게시물의 갯수
		
		// 첫 게시물
		int nStart = (curPage - 1) * listCount + 1;
		// 마지막 게시물
		int nEnd = (curPage - 1) * listCount + listCount;
		
		System.out.println("[nStart] : " + nStart);
		System.out.println("[nEnd] : " + nEnd);
		System.out.println("[search_method] : " + search_method);
		System.out.println("[search_content] : " + search_content);
		
		
		try
		{
			if(search_method.equals("bTitle"))
			{
				con = dataSource.getConnection();
				
				System.out.println("==========[bTitle로 검색]==========");
				
				String query = "select count(*) as total from board where bTitle like ? order by bDate desc";
				
				System.out.println("[PointCheck1]");
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search_content + "%");
//				pstmt.setInt(2, nEnd);
//				pstmt.setInt(3, nStart);
				
				System.out.println("[PointCheck2]");
				
				resultSet = pstmt.executeQuery();
				
				if(resultSet.next())
				{
					totalCount = resultSet.getInt("total");
					System.out.println("[totalCount] : " + totalCount);
				}
				
			}
			else if(search_method.equals("bName"))
			{		
				con = dataSource.getConnection();
				
				System.out.println("==========[bName로 검색]==========");
				String query = "select count(*) as total from board where bName like ? order by bDate desc";
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search_content + "%");
//				pstmt.setInt(2, nEnd);
//				pstmt.setInt(3, nStart);
				resultSet = pstmt.executeQuery();	
				
				if(resultSet.next())
				{
					totalCount = resultSet.getInt("total");
				}
			}
			else if(search_method.equals("bContent"))
			{
				con = dataSource.getConnection();
				
				System.out.println("==========[bContent로 검색]==========");
				String query = "select count(*) as total from board where bContent like ? order by bDate desc";
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search_content + "%");
//				pstmt.setInt(2, nEnd);
//				pstmt.setInt(3, nStart);
				resultSet = pstmt.executeQuery();
				
				if(resultSet.next())
				{
					totalCount = resultSet.getInt("total");
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
	
	public Board_DTO contentView(String strID, String Name, String loginName)
	{
		upHit(strID, Name, loginName);			
		
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
	
	public void deleteNotice(String bId)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			con = dataSource.getConnection();
			
			String query = "delete from board where bId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bId);
			
			int rn = pstmt.executeUpdate();
			System.out.println("[Test] 삭제 성공");
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
	
	public ArrayList<Board_DTO> searchNotice(int curPage, String search_method, String search_content)
	{

		
		ArrayList<Board_DTO> dtos = new ArrayList<Board_DTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;	
		
		// 첫 게시물
		int nStart = (curPage - 1) * listCount + 1;
		// 마지막 게시물
		int nEnd = (curPage - 1) * listCount + listCount;
		
		try
		{
			con = dataSource.getConnection();
			
			if(search_method.equals("bTitle"))
			{
				String query = "select * "
						+ "from ("
						+ 		"select rownum num, A.* "
						+ "		 from (select * from board where bTitle like ? order by bDate desc) A "
						+ "		 where rownum <= ? "
						+ ") B "
						+ "where B.num >= ?";
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search_content + "%");
				pstmt.setInt(2, nEnd);
				pstmt.setInt(3, nStart);
				resultSet = pstmt.executeQuery();				
			}
			else if(search_method.equals("bName"))
			{				
				String query = "select * "
						+ "from ("
						+ 		"select rownum num, A.* "
						+ "		 from (select * from board where bName like ? order by bDate desc) A "
						+ "		 where rownum <= ? "
						+ ") B "
						+ "where B.num >= ?";
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search_content + "%");
				pstmt.setInt(2, nEnd);
				pstmt.setInt(3, nStart);
				resultSet = pstmt.executeQuery();				
			}
			else if(search_method.equals("bContent"))
			{
				String query = "select * "
						+ "from ("
						+ 		"select rownum num, A.* "
						+ "		 from (select * from board where bContent like ? order by bDate desc) A "
						+ "		 where rownum <= ? "
						+ ") B "
						+ "where B.num >= ?";
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search_content + "%");
				pstmt.setInt(2, nEnd);
				pstmt.setInt(3, nStart);
				resultSet = pstmt.executeQuery();					
			}
			
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
	
	public void upHit(String bId, String name, String loginName)
	{
		
		if(name.equals(loginName))
		{
			System.out.println("[알림] 게시글 작성자과 로그인 이름이 같아, 조회수가 증가하지 않습니다.");
			return;
		}
		if(name.equals("0")||loginName.equals("0"))
		{
			System.out.println("[알림] 수정은 조회수가 증가하면 안됩니다.");
			return;
		}
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			con = dataSource.getConnection();
			
			String query = "update board set bHit = bHit + 1 where bId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bId);
			
			int rn = pstmt.executeUpdate();
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
	
	public ArrayList<Board_DTO> newNotice()
	{
		ArrayList<Board_DTO> dtos = new ArrayList<Board_DTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
				
		try
		{
			con = dataSource.getConnection();
			
			String query = "select * from (select rownum num, A.* from (select * from board order by bDate desc, bId desc) A where rownum <= 5 ) B where B.num >= 1";
			
			pstmt = con.prepareStatement(query);
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

	public int countBoard()
	{
		int total = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
				
		try
		{
			con = dataSource.getConnection();
			
			String query = "select count(*) as total from board";
			
			pstmt = con.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next())
			{
				total = resultSet.getInt("total");

				return total;
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
		
		return total;
	}

	public ArrayList<SummingResult_DTO> summingBoard(String start, String end)
	{
		ArrayList<SummingResult_DTO> summingResult = new ArrayList<SummingResult_DTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
				
		try
		{
			con = dataSource.getConnection();
			
			String query = "select dates, sum(bHit) as sum, max(bHit) as max "
					+ "from (select To_date(bDate, 'YYYY.MM.DD') as dates, bHit from board where bDate between ? and ?) "
					+ "group by dates order by dates desc";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
			
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next())
			{
				String dates = resultSet.getString("dates");
				String sum = resultSet.getString("sum");
				String max = resultSet.getString("max");

				SummingResult_DTO dto = new SummingResult_DTO(dates, max, sum);
				
				summingResult.add(dto);
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
		
		return summingResult;
		
	}
}
