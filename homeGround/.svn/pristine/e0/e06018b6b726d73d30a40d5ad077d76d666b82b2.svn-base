package board;

import java.sql.SQLException;


import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import comm.IbatisUtil;

public class B_C_DAO {

	public void NewComment(B_C_VO bc) throws SQLException {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.insert("NewComment", bc);
	}
	
	@SuppressWarnings("unchecked")
	public List<B_C_VO> commentView(int no) throws SQLException {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		List<B_C_VO> vo = sqlmap.queryForList("commentView", no);
		
		return vo;
	}
	
	public void deleteBoardComment (int b_c_no) throws SQLException {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.delete("deleteBoardComment", b_c_no);
	}
	
	public void deleteAllBoardComment (int boardno) throws SQLException {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.delete("deleteAllBoardComment", boardno);
	}
}
