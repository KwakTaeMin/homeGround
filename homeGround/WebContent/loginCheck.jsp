<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, member.*" %>    
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	MemberDAO dao = new MemberDAO();
	MemberVO member = null;
	try {
		member = dao.getMemberInfoById(userid);
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	if (member == null) {
		response.sendRedirect("loginForm.jsp?login=failed");
	} else {
		if (member.getPw().equals(userpw)) {
			if(member.getTeamNo() == -1) {
				session.setAttribute("memId", member.getId());					
				session.setAttribute("memNo", member.getNo());
				session.setAttribute("memName", member.getName());
				response.sendRedirect("register/selectOrCreateTeam.jsp");
				return;
			} else {
				session.setAttribute("memId", member.getId());					
				session.setAttribute("memNo", member.getNo());
				session.setAttribute("teamNo", member.getTeamNo());
				session.setAttribute("memName", member.getName());
				response.sendRedirect("mainPage.jsp");
			}

				
		} else {
			response.sendRedirect("loginForm.jsp?login=failed");	
		}
	}
	
	
	
%>