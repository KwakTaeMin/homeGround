<%@page import="board.B_C_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	int value= Integer.parseInt(request.getParameter("no"));
	int no = Integer.parseInt(request.getParameter("c_no"));
	
	B_C_DAO dao = new B_C_DAO();
	dao.deleteBoardComment(no);
	
	response.sendRedirect("boardDetail.jsp?no="+value+ "&teamNo=" + teamNo);
%>