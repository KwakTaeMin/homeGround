package notice;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import comm.IbatisUtil;

public class NoticeDAO {
	
	public void addNewNotice(NoticeVO notice) throws SQLException {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.insert("addNewNotice", notice);
	}
	
	public int getTotalRow(int no) throws Exception {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		int totalRow = (Integer)sqlmap.queryForObject("getTotalRow", no);
				
		return totalRow;
	}
	
	public List<NoticeVO> getNoticeRange(HashMap<String, Object> range) throws Exception {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();		
		List<NoticeVO> list = sqlmap.queryForList("getNoticeRange", range);
				
		return list;
	}
	
	public NoticeVO getTitleInfo(int no) throws Exception {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		NoticeVO notice = (NoticeVO)sqlmap.queryForObject("getTitleInfo", no);
		
		return notice;
	}
	
	public void getLike(int no) throws Exception {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.update("getLike", no);
	
	}
	
	public void getHate(int no) throws Exception {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.update("getHate", no);
	
	}
	
	public void deleteNotice(int no) throws Exception {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.delete("deleteNotice", no);
	}
	
	public void updateNotice(HashMap<String, Object> update) throws Exception {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.update("updateNotice", update);
	}
	
	public String coachCheck(int memNo) throws Exception {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		String check = (String)sqlmap.queryForObject("coachCheck", memNo);
		return check;
	}
}
