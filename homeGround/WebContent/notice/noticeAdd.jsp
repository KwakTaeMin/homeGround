<%@page import="notice.NoticeDAO"%>
<%@page import="notice.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	int teamNo = (Integer)session.getAttribute("teamNo");
	int memNo = (Integer)session.getAttribute("memNo");
		
	NoticeVO notice = new NoticeVO();
	notice.setTitle(title);
	notice.setContents(contents);
	notice.setMemberNo(memNo);
	notice.setTeamNo(teamNo);
	notice.setPhoto("사진");
	notice.setLike(0);
	notice.setHate(0);
	
	NoticeDAO dao = new NoticeDAO();
	
	dao.addNewNotice(notice);
	
	response.sendRedirect("noticeList.jsp?teamNo=" + teamNo);
%>