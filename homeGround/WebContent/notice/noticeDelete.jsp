<%@page import="notice.N_C_DAO"%>
<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	

	int pno = Integer.parseInt(request.getParameter("pno"));
	int num = Integer.parseInt(request.getParameter("no"));
	int	teamNo	= 	Integer.parseInt(request.getParameter("teamNo"));
	
	N_C_DAO dao2 = new N_C_DAO();
	dao2.deleteAllComment(num);
	
	NoticeDAO dao = new NoticeDAO();
	dao.deleteNotice(num);
	
	
	response.sendRedirect("noticeList.jsp?teamNo=" + teamNo);
%>
