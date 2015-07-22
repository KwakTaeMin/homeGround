package team;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

@WebServlet(urlPatterns={"/register/teamCheck"})
public class TeamCheckServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain;charset=utf-8");
		String value = request.getParameter("tName");
		
		System.out.println("팀명 중복체크 : " + value);
		
		TeamDAO dao = new TeamDAO();
		String name = null;
		try {
			name = dao.getTeamNameByName(value);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		if (name == null) {
			response.getWriter().write("notExist");
		} else {
			response.getWriter().write("exist");
		}
	}
}
