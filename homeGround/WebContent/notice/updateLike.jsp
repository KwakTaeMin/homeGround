<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("no"));
	int pno = Integer.parseInt(request.getParameter("pno"));
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	
		
	NoticeDAO dao = new NoticeDAO();
	
	dao.getLike(num);
	
	response.sendRedirect("noticeDetail.jsp?no="+num+"&pno="+pno+"&teamNo="+teamNo);
%>