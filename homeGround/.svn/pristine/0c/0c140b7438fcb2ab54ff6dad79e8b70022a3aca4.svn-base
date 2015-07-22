<%@page import="result.ResultReplyDAO"%>
<%@page import="result.ResultReplyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contents = request.getParameter("comment");
	int gameNo = Integer.parseInt(request.getParameter("no"));
	int pno = Integer.parseInt(request.getParameter("pno"));
	int tNo = Integer.parseInt(request.getParameter("teamNo"));
	
	int memNo = (Integer)session.getAttribute("memNo");
	int teamNo = (Integer)session.getAttribute("teamNo");
	
	ResultReplyVO reply = new ResultReplyVO();
	reply.setContents(contents);
	reply.setGameNo(gameNo);
	reply.setMemNo(memNo);
	reply.setTeamNo(teamNo);
	
	System.out.println(reply.getMemNo()); 
	
	ResultReplyDAO dao = new ResultReplyDAO();
	dao.saveReply(reply);
	
	response.sendRedirect("resultDetail.jsp?pno=" + pno + "&no=" + gameNo + "&teamNo=" + tNo);
%>    
