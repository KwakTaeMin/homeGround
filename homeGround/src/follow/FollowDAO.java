package follow;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import comm.IbatisUtil;

public class FollowDAO {

	public void insertFollow(FollowVO followVo) throws Exception{
		SqlMapClient sqlMap = IbatisUtil.getSqlmap();
		sqlMap.insert("insertFollow",followVo);
	}
	
	public void deleteFollow(FollowVO followVo) throws Exception{
		SqlMapClient sqlMap = IbatisUtil.getSqlmap();
		sqlMap.delete("deleteFollow",followVo);
	}
	
	public FollowVO getFollowerNumAndFollowingNum(int teamNo) throws Exception {
		SqlMapClient sqlMap = IbatisUtil.getSqlmap();
		return (FollowVO)sqlMap.queryForObject("getFollowerNumAndFollowingNum",teamNo);
	}
	
	public FollowVO getConfirmFollowing(FollowVO followVo) throws Exception {
		SqlMapClient sqlMap = IbatisUtil.getSqlmap();
		return (FollowVO)sqlMap.queryForObject("getConfirmFollowing",followVo);
	}
	
	public List<FollowVO> getFollowerList(int teamNo) throws Exception{
		SqlMapClient sqlMap = IbatisUtil.getSqlmap();
		return sqlMap.queryForList("getFollowerList",teamNo);		
	}
	
	public List<FollowVO> getFollowingList(int teamNo) throws Exception{
		SqlMapClient sqlMap = IbatisUtil.getSqlmap();
		return sqlMap.queryForList("getFollowingList",teamNo);		
	}
	
	public List<FollowVO> getFollowBoardList(int teamNo) throws Exception{
		SqlMapClient sqlMap = IbatisUtil.getSqlmap();
		return sqlMap.queryForList("getFollowBoardList",teamNo);	
	}
	
}
