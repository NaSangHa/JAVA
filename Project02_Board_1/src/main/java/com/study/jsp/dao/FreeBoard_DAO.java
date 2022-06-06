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
import com.study.jsp.dto.FreeBoard_DTO;
import com.study.jsp.dto.SummingResult_DTO;


public class FreeBoard_DAO
{
	private static FreeBoard_DAO instance = new FreeBoard_DAO();
	DataSource dataSource = null;
	
	public static final int MEMBERS_LOGIN_SUCCESS = 1;
	public static final int MEMBERS_LOGIN_FAIL = 1;
	public static final int ID_DOUBLE = 0;
	public static final int ID_NOT_DOUBLE = 1;

	int listCount = 10;
	int pageCount = 10;

	private FreeBoard_DAO()
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

	public static FreeBoard_DAO getInstance()
	{
		return instance;
	}

	public ArrayList<FreeBoard_DTO> list(int curPage)
	{
		ArrayList<FreeBoard_DTO> dtos = new ArrayList<FreeBoard_DTO>();
		
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
						+ "		 from (select * from free_board order by fbgroup desc, fbstep asc ) A "
						+ "		 where rownum <= ? "
						+ ") B "
						+ "where B.num >= ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nEnd);
			pstmt.setInt(2, nStart);
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next())
			{
				int fbId = resultSet.getInt("fbId");
				String fbName = resultSet.getString("fbName");
				String fbTitle = resultSet.getString("fbTitle");
				String fbContent = resultSet.getString("fbContent");
				Timestamp fbDate = resultSet.getTimestamp("fbDate");
				int fbHit = resultSet.getInt("fbHit");
				int fbGroup = resultSet.getInt("fbGroup");
				int fbStep = resultSet.getInt("fbStep");
				int fbIndent = resultSet.getInt("fbIndent");
				String fbFile = resultSet.getString("fbFile");
				int fbLike = resultSet.getInt("fbLike");
				int fbHate = resultSet.getInt("fbHate");
				
				FreeBoard_DTO dto = new FreeBoard_DTO(fbId, fbName, fbTitle, fbContent, fbDate, fbHit, fbGroup, fbStep, fbIndent, fbFile, fbLike, fbHate);
				
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
			
			String query = "select count(*) as total from free_board";
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
			if(search_method.equals("fbTitle"))
			{
				con = dataSource.getConnection();
				
				System.out.println("==========[fbTitle로 검색]==========");
				
				String query = "select count(*) as total from free_board where fbTitle like ? order by fbDate desc";
								
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search_content + "%");

				
				System.out.println("[PointCheck2]");
				
				resultSet = pstmt.executeQuery();
				
				if(resultSet.next())
				{
					totalCount = resultSet.getInt("total");
				}
				
			}
			else if(search_method.equals("fbName"))
			{		
				con = dataSource.getConnection();
				
				System.out.println("==========[fbName로 검색]==========");
				String query = "select count(*) as total from free_board where fbName like ? order by fbDate desc";
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search_content + "%");
				resultSet = pstmt.executeQuery();	
				
				if(resultSet.next())
				{
					totalCount = resultSet.getInt("total");
				}
			}
			else if(search_method.equals("fbContent"))
			{
				con = dataSource.getConnection();
				
				System.out.println("==========[fbContent로 검색]==========");
				String query = "select count(*) as total from free_board where fbContent like ? order by fbDate desc";
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search_content + "%");
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
	
	public FreeBoard_DTO contentView(String strID, String Name, String loginName)
	{
		upHit(strID, Name, loginName);
		
		FreeBoard_DTO free_board_dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try
		{
			con = dataSource.getConnection();
			
			String query = "select * from free_board where fbId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(strID));
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next())
			{
				int fbId = resultSet.getInt("fbId");
				String fbName = resultSet.getString("fbName");
				String fbTitle = resultSet.getString("fbTitle");
				String fbContent = resultSet.getString("fbContent");
				Timestamp fbDate = resultSet.getTimestamp("fbDate");
				int fbHit = resultSet.getInt("fbHit");
				int fbGroup = resultSet.getInt("fbGroup");
				int fbStep = resultSet.getInt("fbStep");
				int fbIndent = resultSet.getInt("fbIndent");
				String fbFile = resultSet.getString("fbFile");
				int fbLike = resultSet.getInt("fbLike");
				int fbHate = resultSet.getInt("fbHate");
				
				free_board_dto = new FreeBoard_DTO(fbId, fbName, fbTitle,fbContent, fbDate, fbHit, fbGroup, fbStep, fbIndent, fbFile, fbLike, fbHate);
	
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
		
		return free_board_dto;
	}

	public void freeBoard_modify(String fbId, String fbTitle, String fbContent, String fbFile)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			con = dataSource.getConnection();
			
			String query = "update free_board set fbTitle = ?, fbContent = ?, fbFile = ? where fbId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fbTitle);
			pstmt.setString(2, fbContent);
			pstmt.setString(3, fbFile);
			pstmt.setString(4, fbId);
			
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

	public void insertFreeBoard(String fbName, String fbTitle, String fbContent, String fbFile)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			con = dataSource.getConnection();
			
			String query = "insert into free_board (fbId, fbName, fbTitle, fbContent, fbGroup, fbStep, fbIndent, fbFile) values (free_board_seq.nextval, ?, ?, ?, free_board_seq.currval, 0, 0, ?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fbName);
			pstmt.setString(2, fbTitle);
			pstmt.setString(3, fbContent);
			pstmt.setString(4, fbFile);
			
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
	
	public void deleteFreeBoard(String fbId)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			System.out.println("[Test] fbId : " + fbId);
			con = dataSource.getConnection();
			
			String query = "delete from free_board where fbId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fbId);
			
			int rn = pstmt.executeUpdate();
			System.out.println("[Test] FreeBoard 내용 삭제 성공");
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

	public ArrayList<FreeBoard_DTO> searchNotice(int curPage, String search_method, String search_content)
	{

		
		ArrayList<FreeBoard_DTO> fdtos = new ArrayList<FreeBoard_DTO>();
		
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
			
			if(search_method.equals("fbTitle"))
			{
				String query = "select * "
						+ "from ("
						+ 		"select rownum num, A.* "
						+ "		 from (select * from free_board where fbTitle like ? order by fbDate desc) A "
						+ "		 where rownum <= ? "
						+ ") B "
						+ "where B.num >= ?";
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search_content + "%");
				pstmt.setInt(2, nEnd);
				pstmt.setInt(3, nStart);
				resultSet = pstmt.executeQuery();				
			}
			else if(search_method.equals("fbName"))
			{				
				String query = "select * "
						+ "from ("
						+ 		"select rownum num, A.* "
						+ "		 from (select * from free_board where fbName like ? order by fbDate desc) A "
						+ "		 where rownum <= ? "
						+ ") B "
						+ "where B.num >= ?";
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search_content + "%");
				pstmt.setInt(2, nEnd);
				pstmt.setInt(3, nStart);
				resultSet = pstmt.executeQuery();				
			}
			else if(search_method.equals("fbContent"))
			{
				String query = "select * "
						+ "from ("
						+ 		"select rownum num, A.* "
						+ "		 from (select * from free_board where fbContent like ? order by fbDate desc) A "
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
				
				int fbId = resultSet.getInt("fbId");
				String fbName = resultSet.getString("fbName");
				String fbTitle = resultSet.getString("fbTitle");
				String fbContent = resultSet.getString("fbContent");
				Timestamp fbDate = resultSet.getTimestamp("fbDate");
				int fbHit = resultSet.getInt("fbHit");
				int fbGroup = resultSet.getInt("fbGroup");
				int fbStep = resultSet.getInt("fbStep");
				int fbIndent = resultSet.getInt("fbIndent");
				String fbFile = resultSet.getString("fbFile");
				int fbLike = resultSet.getInt("fbLike");
				int fbHate = resultSet.getInt("fbHate");
				
				
				FreeBoard_DTO fdto = new FreeBoard_DTO(fbId, fbName, fbTitle, fbContent, fbDate, fbHit, fbGroup, fbStep, fbIndent, fbFile, fbLike, fbHate);
				
				fdtos.add(fdto);
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
		
		return fdtos;
	}
	
	public void upHit(String fbId, String fbName, String loginName)
	{
		
		if(fbName.equals(loginName))
		{
			System.out.println("[알림] 게시글 작성자과 로그인 이름이 같아, 조회수가 증가하지 않습니다.");
			return;
		}
		if(fbName.equals("0")||loginName.equals("0"))
		{
			System.out.println("[알림] 수정은 조회수가 증가하면 안됩니다.");
			return;
		}
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			con = dataSource.getConnection();
			
			String query = "update free_board set fbHit = fbHit + 1 where fbId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fbId);
			
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

	public ArrayList<FreeBoard_DTO> hotFreeBoard()
	{
		ArrayList<FreeBoard_DTO> dtos = new ArrayList<FreeBoard_DTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
				
		try
		{
			con = dataSource.getConnection();
			
			String query = "select * from (select rownum num, A.* from (select * from free_board order by fbHit desc, fbId desc) A where rownum <= 5 ) B where B.num >= 1";
			
			pstmt = con.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next())
			{
				int fbId = resultSet.getInt("fbId");
				String fbName = resultSet.getString("fbName");
				String fbTitle = resultSet.getString("fbTitle");
				String fbContent = resultSet.getString("fbContent");
				Timestamp fbDate = resultSet.getTimestamp("fbDate");
				int fbHit = resultSet.getInt("fbHit");
				int fbGroup = resultSet.getInt("fbGroup");
				int fbStep = resultSet.getInt("fbStep");
				int fbIndent = resultSet.getInt("fbIndent");
				String fbFile = resultSet.getString("fbFile");
				int fbLike = resultSet.getInt("fbLike");
				int fbHate = resultSet.getInt("fbHate");
				
				FreeBoard_DTO dto = new FreeBoard_DTO(fbId, fbName, fbTitle, fbContent, fbDate, fbHit, fbGroup, fbStep, fbIndent, fbFile, fbLike, fbHate);
				
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

	public int countFreeBoard()
	{
		int total = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
				
		try
		{
			con = dataSource.getConnection();
			
			String query = "select count(*) as total from free_board";
			
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
	
	public ArrayList<SummingResult_DTO> summingFreeBoard(String start, String end)
	{
		ArrayList<SummingResult_DTO> summingResult = new ArrayList<SummingResult_DTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
				
		try
		{
			con = dataSource.getConnection();
			
			String query = "select dates, sum(fbHit) as sum, max(fbHit) as max "
					+ "from (select To_date(fbDate, 'YYYY.MM.DD') as dates, fbHit from free_board where fbDate between ? and ?) "
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

	public ArrayList<FreeBoard_DTO> myContent(int curPage, String bName)
	{
		ArrayList<FreeBoard_DTO> dtos = new ArrayList<FreeBoard_DTO>();
		
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
			
			String query = "select * from free_board where fbName = ? order by fbDate desc ";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bName);
			//pstmt.setInt(2, nEnd);
			//pstmt.setInt(3, nStart);
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next())
			{
				int fbId = resultSet.getInt("fbId");
				String fbName = resultSet.getString("fbName");
				String fbTitle = resultSet.getString("fbTitle");
				String fbContent = resultSet.getString("fbContent");
				Timestamp fbDate = resultSet.getTimestamp("fbDate");
				int fbHit = resultSet.getInt("fbHit");
				int fbGroup = resultSet.getInt("fbGroup");
				int fbStep = resultSet.getInt("fbStep");
				int fbIndent = resultSet.getInt("fbIndent");
				String fbFile = resultSet.getString("fbFile");
				int fbLike = resultSet.getInt("fbLike");
				int fbHate = resultSet.getInt("fbHate");
				
				FreeBoard_DTO dto = new FreeBoard_DTO(fbId, fbName, fbTitle, fbContent, fbDate, fbHit, fbGroup, fbStep, fbIndent, fbFile, fbLike, fbHate);
				
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
	


}
