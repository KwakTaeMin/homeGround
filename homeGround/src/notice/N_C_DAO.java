package notice;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import comm.IbatisUtil;

public class N_C_DAO {
	
	public void addNewComment(N_C_VO nc) throws SQLException {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.insert("addNewComment", nc);
	}
	
	@SuppressWarnings("unchecked")
	public List<N_C_VO> getAllComment(int num) throws SQLException {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		
		HashMap<String, Object> number = new HashMap<String, Object>();
		number.put("value", num);
		
		List<N_C_VO> list = sqlmap.queryForList("getAllComment", number);
		return list;
	}
	
	public void deleteComment(int no) throws SQLException {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.delete("deleteComment", no);
	}
	
	public void deleteAllComment(int no) throws SQLException {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.delete("deleteAllComment", no);
	}
	
	public int commentCount(int num1, int num2) throws SQLException {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		
		HashMap<String, Object> number = new HashMap<String, Object>();
		number.put("noticeNo", num1);
		number.put("teamNo", num2);
		
		int cc = (Integer)sqlmap.queryForObject("commentCount", number);
		return cc;
	}

}
