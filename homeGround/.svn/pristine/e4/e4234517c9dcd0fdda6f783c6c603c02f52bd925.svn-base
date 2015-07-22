<%@page import="result.ResultDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String no = request.getParameter("no");
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	ResultDAO dao = new ResultDAO();
	dao.deleteResultByNo(Integer.parseInt(no));
	response.sendRedirect("resultList.jsp?teamNo=" + teamNo);
%>    
    
