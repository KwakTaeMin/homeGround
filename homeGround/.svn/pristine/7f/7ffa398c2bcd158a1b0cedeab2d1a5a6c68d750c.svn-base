package board;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import notice.NoticeVO;

import com.ibatis.sqlmap.client.SqlMapClient;

import comm.IbatisUtil;

public class BoardDAO {
	
	private static final List<BoardVO> List = null;
	private static BoardDAO dao = new BoardDAO();
	public BoardDAO() {}
	public static BoardDAO getInstance() {
		return dao;
	}
	
	public List<BoardVO> getAllBoards() throws SQLException {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return sqlmap.queryForList("getAllBoards");
	}  
	
	public BoardVO getContentView(int no) throws SQLException {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return (BoardVO)sqlmap.queryForObject("getContentView", no);
	}
	
	public void addNewContent(BoardVO board) throws SQLException {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.insert("addNewContent",board);
	}
	
	public void removeboard (int no) throws SQLException {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.delete("removeboard", no);
	}
	
	public void modifyboard (BoardVO board) throws SQLException {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.update("modifyboard", board);
	}
	
	public void addlike (int bno) throws SQLException {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.update("addlike", bno);
	}
	
	public void addhate (int hno) throws SQLException {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.update("addhate", hno);
	}
	
	public int getTotalBoardRow(int no) throws Exception {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		int totalRow = (Integer)sqlmap.queryForObject("getTotalBoardRow", no);
				
		return totalRow;
	}
	
	public List<BoardVO> getBoardRange(HashMap<String, Object> range) throws Exception {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();		
				
		return sqlmap.queryForList("getBoardRange", range);
	}
	
	
}
