package result;

import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import comm.IbatisUtil;

public class ResultReplyDAO {
	
	// 댓글 DB에 저장하기
	public void saveReply(ResultReplyVO reply) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.insert("saveReply", reply);
	}
	
	// DB에서 특정 경기번호에 해당하는 댓글들 읽어오기(전체)
	public List<ResultReplyVO> getReplyBygameNo(int gameNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		List<ResultReplyVO> list = sqlmap.queryForList("getReplyBygameNo", gameNo);
		
		return list;
	}
	
	// 코멘트 번호를 전달받아 특정 리플 삭제하기
	public void deleteReplyByNo(int comNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.delete("deleteReplyByNo", comNo);
	}
	
	// 해당 게시글의 총 댓글 수 리턴
	public int getTotalReplyCnt(int gameNo) {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		try {
			sqlmap.queryForObject("getTotalReplyCnt", gameNo);
			
		} catch(Exception e) {
			
		}
		
		return 0;
	}
	
	// 해당 게시글 의 댓글 중 범위만큼의 댓글 리턴
	public List<ResultReplyVO> getReplyByRange(int start, int end ,int gameNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		
		HashMap<String, Object> search = new HashMap<String, Object>();
		search.put("start", start);
		search.put("end", end);
		search.put("teamNo", gameNo);
	
		List<ResultReplyVO> list = sqlmap.queryForList("getReplyByRange", search);
		
		return list;
	}

}
