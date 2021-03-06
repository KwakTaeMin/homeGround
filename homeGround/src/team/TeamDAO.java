package team;

import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import comm.IbatisUtil;

public class TeamDAO {
	
	//태민
	
	public String getTeamCoachName(int coachNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return (String)sqlmap.queryForObject("getTeamCoachName",coachNo);
	}
	
	public TeamVO getTeamByNo(int memberNo) throws Exception {		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return (TeamVO)sqlmap.queryForObject("getTeamByNo",memberNo);				
	}
	
	public List getTeamsByNo(int teamNo) throws Exception {		
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return sqlmap.queryForList("getTeamByNo",teamNo);				
	}
	
	//선경
	public String getTeamNameByName(String name) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return (String) sqlmap.queryForObject("getTeamNameByName", name);
	}
	
	public void addTeam(TeamVO team) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.insert("addTeam", team);
		team.setNo(getTeamNoByName(team.getName()));
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNo", team.getCoachNo());
		map.put("teamNo", team.getNo());
		
		sqlmap.update("updateMemberTeamNo", map);
	}
	
	public int getTeamNoByName(String name) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return (Integer)sqlmap.queryForObject("getTeamNoByName", name);
	}
	
	public List<Integer> getTeamsNoByName(String name) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return sqlmap.queryForList("getTeamNoByName", name);
	}
	
	public List<TeamVO> searchTeamByDynamicPage(HashMap<String, Object> keywords) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return sqlmap.queryForList("searchTeamByDynamicPage", keywords);
	}
	
	public HashMap<String, Object> searchTeamDetailByNo(int tNo) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return (HashMap<String, Object>) sqlmap.queryForObject("searchTeamDetailByNo",tNo);
	}
	
	public int getTeamCount() throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		return (Integer)sqlmap.queryForObject("getTeamCount");
	}
	
	public void updateTeamInfo(HashMap<String, Object> teamVO) throws Exception {
		SqlMapClient sqlmap = IbatisUtil.getSqlmap();
		sqlmap.update("updateTeamInfo", teamVO);
	}
	
}
