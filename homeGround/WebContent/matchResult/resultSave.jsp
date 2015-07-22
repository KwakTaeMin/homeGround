<%@page import="result.ResultVO"%>
<%@page import="result.ResultDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
	int tNo = Integer.parseInt(request.getParameter("teamNo"));
	
	ResultDAO dao = new ResultDAO();
	
	String rivalTeam = request.getParameter("rival-team");
	
	int rivalTeamNo = dao.getResultTeamNoByName(rivalTeam);
	
	System.out.println(rivalTeamNo);
	String rivalRuns = request.getParameter("rival-runs");
	String myRuns = request.getParameter("my-runs");
	String rivalHits = request.getParameter("rival-hits");
	String myHits = request.getParameter("my-hits"); 
	String rivalError = request.getParameter("rival-error");
	String myError = request.getParameter("my-error");
	String rivalBalls = request.getParameter("rival-balls");
	String myBalls = request.getParameter("my-balls");
	
	ResultVO result = new ResultVO();
	
	int teamNo = (Integer)session.getAttribute("teamNo");
	result.setMyTeamNo(teamNo);
	result.setRivalTeamNo(rivalTeamNo);
	result.setRivalRuns(Integer.parseInt(rivalRuns));
	result.setMyRuns(Integer.parseInt(myRuns));
	result.setRivalHits(Integer.parseInt(rivalHits));
	result.setMyHits(Integer.parseInt(myHits));
	result.setRivalError(Integer.parseInt(rivalError));
	result.setMyError(Integer.parseInt(myError));
	result.setRivalBalls(Integer.parseInt(rivalBalls));
	result.setMyBalls(Integer.parseInt(myBalls));
	
	dao.saveResult(result);
	
	response.sendRedirect("resultList.jsp?teamNo=" + tNo);
%>    

    
    
