<%@page import="java.util.HashMap"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int memNo = (Integer)session.getAttribute("memNo");
	String value = request.getParameter("tNo");
	int tNo = Integer.parseInt(value);
	
	MemberDAO dao = new MemberDAO();
	HashMap<String, Integer> map = new HashMap<String, Integer>();
	map.put("memberNo", memNo);
	map.put("teamNo", tNo);
	
	dao.updateMemberTeamNo(map);
	session.setAttribute("teamNo", tNo);
	response.sendRedirect("../mainPage.jsp");
%>
