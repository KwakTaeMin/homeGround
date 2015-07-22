<%@page import="java.util.HashMap"%>
<%@page import="notice.NoticeVO"%>
<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int pno = Integer.parseInt(request.getParameter("pno"));
	int num = Integer.parseInt(request.getParameter("no"));
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
	NoticeDAO dao = new NoticeDAO();
	
	HashMap<String, Object> update = new HashMap<String, Object>();
	update.put("title", title);
	update.put("contents", contents);
	update.put("no", num);
	
	dao.updateNotice(update);
	
	response.sendRedirect("noticeDetail.jsp?no="+num+"&pno="+pno+"&teamNo="+teamNo);
	
 %>
