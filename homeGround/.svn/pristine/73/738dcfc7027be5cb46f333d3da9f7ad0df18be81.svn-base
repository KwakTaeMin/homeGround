package follow;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

@WebServlet(urlPatterns={"/followCancle"})
public class FollowCancleServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int otherTeamNo = Integer.parseInt(request.getParameter("otherTeamNo"));
		int ourTeamNo	= Integer.parseInt(request.getParameter("ourTeamNo"));
		
		System.out.println("상대팀번호 : " + otherTeamNo);
		System.out.println("우리팀번호 : " + ourTeamNo);
		
		FollowDAO followDao = new FollowDAO();
		FollowVO followVo = new FollowVO();
		FollowVO followingNumFollowerNumVO = new FollowVO();
		
		followVo.setMyTeamNo(ourTeamNo);
		followVo.setFollowingTeamNo(otherTeamNo);
		
		try {
			
			followDao.deleteFollow(followVo);
			followingNumFollowerNumVO = followDao.getFollowerNumAndFollowingNum(otherTeamNo);
			
		} catch(Exception e) {
			e.printStackTrace();			
		}
		
		
		JSONObject followObj = JSONObject.fromObject(followingNumFollowerNumVO);
		
		response.setContentType("text/plain;charset=utf-8");
		response.getWriter().write(followObj.toString());
		System.out.println(followObj.toString());
	
		
		
	}

}
