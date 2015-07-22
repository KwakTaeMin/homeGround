<%@page import="notice.N_C_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int c_no = Integer.parseInt(request.getParameter("c_no"));

	int pno = Integer.parseInt(request.getParameter("pno"));
	int num = Integer.parseInt(request.getParameter("no"));
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	
	N_C_DAO dao = new N_C_DAO();
	dao.deleteComment(c_no);
	
	response.sendRedirect("noticeDetail.jsp?no=" + num + "&pno=" + pno + "&teamNo=" + teamNo);
%>