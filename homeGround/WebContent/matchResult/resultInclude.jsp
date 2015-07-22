<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="result.ResultVO"%>
<%@page import="java.util.List"%>
<%@page import="result.ResultDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.M.d EE");
	ResultDAO dao = new ResultDAO();
	int rowPerPage = 6;
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	int totalRow = dao.getTotal(teamNo);
	int totalPages = (int)Math.ceil((double)totalRow/rowPerPage);

	int pno = 1;
	try {
		pno = Integer.parseInt(request.getParameter("pno"));
	} catch(NumberFormatException e) {}
	
	int start = (pno - 1) * rowPerPage + 1;
	int end = pno * rowPerPage;
	System.out.println("시작번호" + start + ", 끝번호 : " + end);
	
	List<ResultVO> list = dao.getResultByRange(start, end, teamNo);
	List<ResultVO> result = dao.getResultByTeamNo(teamNo);
	String tName = dao.getTeamNameByNo(teamNo);
	
	HashMap<String, Object> count = dao.getCountByTeamNo(teamNo);
	int winCnt = (Integer)count.get("winCnt");
	int loseCnt = (Integer)count.get("loseCnt");
	int tieCnt = (Integer)count.get("tieCnt");
%>    
