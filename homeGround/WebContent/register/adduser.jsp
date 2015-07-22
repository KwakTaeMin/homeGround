<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='member.*, java.util.*' %>    
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("addid");
	String pw = request.getParameter("addpw1");
	String name = request.getParameter("addname");
	String area = request.getParameter("addarea");
	int age = Integer.parseInt(request.getParameter("addage"));
	String position = request.getParameter("addposition");
	String phone = request.getParameter("phone1") + request.getParameter("phone2") 
			+ request.getParameter("phone3");
	String email = request.getParameter("email1") + "@" + request.getParameter("email2");
	
	MemberVO member = new MemberVO();
	member.setId(id);
	member.setPw(pw);
	member.setName(name);
	member.setAge(age);
	member.setArea(area);
	member.setPosition(position);
	member.setPhone(phone);
	member.setEmail(email);
	
	MemberDAO dao = new MemberDAO();
	dao.addMember(member);
	int memberNo = dao.getMemberInfoById(id).getNo();
	session.setAttribute("memNo", memberNo);
	session.setAttribute("memId", member.getId());					
	session.setAttribute("memName", member.getName());
	
	response.sendRedirect("selectOrCreateTeam.jsp");
%>
