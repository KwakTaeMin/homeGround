<%@page import="notice.N_C_DAO"%>
<%@page import="notice.NoticeVO"%>
<%@page import="notice.N_C_VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String comment = request.getParameter("comment");
	
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	int noticePno = Integer.parseInt(request.getParameter("noticePno"));
	int	teamNo2 = Integer.parseInt(request.getParameter("teamNoc"));
	
	int teamNo = (Integer)session.getAttribute("teamNo");
	int memNo = (Integer)session.getAttribute("memNo");
		
	N_C_VO comments = new N_C_VO();
	comments.setContents(comment);
	comments.setMemberNo(memNo);
	comments.setTeamNo(teamNo);
	comments.setNoticeNo(noticeNo);
	
	N_C_DAO dao = new N_C_DAO();
	
	dao.addNewComment(comments);
	
	response.sendRedirect("noticeDetail.jsp?no=" + noticeNo + "&pno=" + noticePno + "&teamNo=" + teamNo2);
%>