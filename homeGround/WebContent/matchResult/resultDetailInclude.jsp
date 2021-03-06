<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="result.ResultReplyDAO"%>
<%@page import="result.ResultReplyVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="result.ResultVO"%>
<%@page import="result.ResultDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
 	String pno = request.getParameter("pno");
 	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
 	
	ResultDAO dao = new ResultDAO();
	ResultVO result = dao.getResultByNo(Integer.parseInt(no), teamNo);
	
	Date value = result.getGameDate();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.M.d EE");
	String gameDate = sdf.format(value);
	int gameNo = Integer.parseInt(no);
	int myRuns = result.getMyRuns();
	int myHits = result.getMyHits();
	int myError = result.getMyError();
	int myBalls = result.getMyBalls();
	
	String myTeam = dao.getTeamNameByNo(result.getMyTeamNo());
	
	String rivalTeam = dao.getTeamNameByNo(result.getRivalTeamNo());
	int rivalRuns = result.getRivalRuns();
	int rivalHits = result.getRivalHits();
	int rivalError = result.getRivalError();
	int rivalBalls = result.getRivalBalls();
	
	// 댓글 읽어오기
	ResultReplyDAO reDao = new ResultReplyDAO();
	List<ResultReplyVO> replies = reDao.getReplyBygameNo(Integer.parseInt(no));
	
	int myNo = (Integer)session.getAttribute("memNo");
%>    