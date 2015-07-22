package team;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

@WebServlet(urlPatterns={"/register/searchTeamDetail"})
public class SearchTeamInfoDetailServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/plain;charset=utf-8");
		
		String value1 = request.getParameter("tNo");
		int no = Integer.parseInt(value1);
		
		System.out.println("searchTeamDetail_팀 상세정보 검색 : "+no);
		
		TeamDAO dao = new TeamDAO();
		try {
			HashMap<String, Object> map = dao.searchTeamDetailByNo(no);
			
			JSONObject obj = JSONObject.fromObject(map);
			response.getWriter().write(obj.toString());
			
		} catch (Exception e) {}
	}
}
