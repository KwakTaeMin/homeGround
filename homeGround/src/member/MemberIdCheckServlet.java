package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/register/idCheck"})
public class MemberIdCheckServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/plain;charset=utf-8");
		String value = request.getParameter("chkId");
		
		System.out.println("아이디 중복체크 : " + value);
		
		MemberDAO dao = new MemberDAO();
		MemberVO member = null;
		try {
			member = dao.getMemberInfoById(value);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		if (member == null) {
			response.getWriter().write("notExist");
		} else {
			response.getWriter().write("exist");
		}
		
	}
}
