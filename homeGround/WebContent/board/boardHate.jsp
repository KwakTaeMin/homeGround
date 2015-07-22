<%@page import="board.BoardDAO"%>
<%@page import="board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	
	int no = Integer.parseInt(request.getParameter("no"));
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	
	BoardDAO dao = new BoardDAO();
	dao.addhate(no);
	
	response.sendRedirect("boardDetail.jsp?no="+no+ "&teamNo="+teamNo );
	
%>