package member;

import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import comm.IbatisUtil;

public class MemberDAO {
	
	public List getMemberListByTeamNo(int teamNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return (List)sqlmap.queryForList("getMemberListByTeamNo",teamNo);
	}
	
	public String getMemberNameByMemberNo(int memberNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return (String)sqlmap.queryForObject("getMemberNameByMemberNo",memberNo);
	}
	
	public int getAllMemberCountByTeamNo(int teamNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return (Integer)sqlmap.queryForObject("getAllMemberCountByTeamNo",teamNo);
	}
	
	// �뿬湲� 諛� �떎 �꽑寃쎄� �븿
	public MemberVO getMemberInfoById(String id) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return (MemberVO)sqlmap.queryForObject("getMemberInfoById", id);
	}
	
	public void addMember(MemberVO member) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.insert("addMember", member);
	}
	
	public int getTeamNoByNo(int no) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return (Integer)sqlmap.queryForObject("getTeamNoByNo", no);
	}
	

	public void updateMemberTeamNo(HashMap<String, Integer> map) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.update("updateMemberTeamNo", map);
	}
	
}
