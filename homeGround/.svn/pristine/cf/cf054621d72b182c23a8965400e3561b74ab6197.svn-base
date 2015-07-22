<%@page import="result.ResultReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String cno = request.getParameter("cno");
	String pno = request.getParameter("pno");
	String no = request.getParameter("no");
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	
	String value = request.getParameter("mno");
	int replyMemNo = Integer.parseInt(value);
	
	ResultReplyDAO dao = new ResultReplyDAO();
	dao.deleteReplyByNo(Integer.parseInt(cno));
	response.sendRedirect("resultDetail.jsp?pno=" + pno + "&no=" + no + "&teamNo=" + teamNo );
	
	
%>    
