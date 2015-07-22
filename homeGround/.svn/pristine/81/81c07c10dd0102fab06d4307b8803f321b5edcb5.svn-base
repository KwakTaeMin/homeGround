<%@page import="board.B_C_VO"%>
<%@page import="board.B_C_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	
	String comet = request.getParameter("comment");
	
	int no = Integer.parseInt(request.getParameter("boardNo"));
	
	int teamNo = (Integer)session.getAttribute("teamNo");
	int memNo = (Integer)session.getAttribute("memNo");
	
	B_C_VO comment = new B_C_VO();
	
	comment.setBoardNo(no);
	comment.setContents(comet);
	comment.setTeamNo(teamNo);
	comment.setMemberNo(memNo);
	System.out.println(comment);
	B_C_DAO dao = new B_C_DAO();
	dao.NewComment(comment);
	
	response.sendRedirect("boardDetail.jsp?no=" + no + "&teamNo=" + teamNo);

%>