package result;

import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import comm.IbatisUtil;

public class ResultDAO {
	
	// 모든 경기결과 읽어오기 
	
	public List<ResultVO> getAllResults() {
		
		return null;
	}

	// 경기 번호와 팀번호를 입력받아 특정 경기결과 읽어오기
	public ResultVO getResultByNo(int no, int teamNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		HashMap<String, Object> value = new HashMap<String, Object>();
		value.put("no", no);
		value.put("teamNo", teamNo);
		
		ResultVO result = (ResultVO)sqlmap.queryForObject("getResultByNo", value);
		
		return result;
	}
	
	//  경기결과 입력받은 후 DB에 저장
	
	public void saveResult(ResultVO result) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.insert("saveResult", result);
	}
	
	// 팀명 입력받아 팀번호 얻어오기
	public int getResultTeamNoByName(String name) throws Exception {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		int rivalNo = (Integer)sqlmap.queryForObject("getResultTeamNoByName", name);
		
		return rivalNo;
	}
	
	// 팀번호 입력받아 팀명 읽어오기
	public String getTeamNameByNo(int no) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		String teamName = (String)sqlmap.queryForObject("getTeamNameByNo", no);
		
		return teamName;
	}
	
	// 전체 게시물 갯수를 리턴하는 기능
	public int getTotal(int teamNo) {
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		int totalRow = 0;
		try {
			totalRow = (Integer)sqlmap.queryForObject("getTotal", teamNo);
			
		} catch(Exception e) {}
		
		return totalRow;
	}
	
	// 구간에 해당하는 게시글 조회하는 기능
	public List<ResultVO> getResultByRange(int start, int end ,int teamNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		
		HashMap<String, Object> search = new HashMap<String, Object>();
		search.put("start", start);
		search.put("end", end);
		search.put("teamNo", teamNo);
	
		List<ResultVO> list = sqlmap.queryForList("getResultByRange", search);
		
		return list;
	}
	
	// 경기결과 삭제하기(실제로는 삭제여부 Y/N 업데이트) 
	public void deleteResultByNo(int no) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.update("deleteResultByNo", no);
	}
	
	// 경기결과 update 하기 
	public void updateResult(HashMap<String, Object> result) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.update("updateResult", result);
	}
	
	// 팀번호 전달하여 팀감독 no 얻어오기
	public int getCoachNoByTeamNo(int TeamNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		int coachNo =  (Integer)sqlmap.queryForObject("getCoachNoByTeamNo", TeamNo);
		
		return coachNo;
	}
	
	// 전체 상대 팀명 읽어오기
	public List<String> getAllTeamName(int teamNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		List<String> names = sqlmap.queryForList("getAllTeamName", teamNo);
		
		return names;
	}
	
	// 팀번호 전달 받아 해당 팀의 경기결과 읽어오기
	public List<ResultVO> getResultByTeamNo(int teamNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		List<ResultVO> list = sqlmap.queryForList("getResultByTeamNo", teamNo);
		return list;
	}
	
	// 팀번호 전달 받아 해당팀의 승, 무, 패 기록 얻기
	public HashMap<String, Object> getCountByTeamNo(int teamNo) throws Exception {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		int winCnt = (Integer)sqlmap.queryForObject("getWinCntByTeamNo", teamNo);
		int loseCnt = (Integer)sqlmap.queryForObject("getLoseCntByTeamNo", teamNo);
		int tieCnt = (Integer)sqlmap.queryForObject("getTieCntByTeamNo", teamNo);
		
		hashmap.put("winCnt", winCnt);
		hashmap.put("loseCnt", loseCnt);
		hashmap.put("tieCnt", tieCnt);
		
		return hashmap;
	}
	
	// 
}
