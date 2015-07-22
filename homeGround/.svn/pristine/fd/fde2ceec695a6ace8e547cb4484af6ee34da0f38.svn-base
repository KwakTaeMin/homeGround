<%@page import="result.ResultDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));

	// 수정사항 DB에 업데이트
	HashMap<String, Object> result = new HashMap<String, Object>();
	String value1 = request.getParameter("no");
	int gameNo = Integer.parseInt(value1);
	
	String value2 = request.getParameter("pno");
	int pno = Integer.parseInt(value2);
	
	String myRuns = request.getParameter("myruns");
	String myHits = request.getParameter("myhits");
	String myError = request.getParameter("myerror");
	String myBalls = request.getParameter("myballs");
	
	String rivalRuns = request.getParameter("rivalruns");
	String rivalHits = request.getParameter("rivalhits");
	String rivalError = request.getParameter("rivalerror");
	String rivalBalls = request.getParameter("rivalballs");
	
	result.put("no", gameNo);
	result.put("myRuns", myRuns);
	result.put("myHits", myHits);
	result.put("myError", myError);
	result.put("myBalls", myBalls);
	
	result.put("rivalRuns", rivalRuns);
	result.put("rivalHits", rivalHits);
	result.put("rivalError", rivalError);
	result.put("rivalBalls", rivalBalls);
	
	ResultDAO dao = new ResultDAO();
	dao.updateResult(result);
	
	response.sendRedirect("resultDetail.jsp?pno=" + pno + "&no=" + gameNo + "&teamNo=" + teamNo);
%>    
