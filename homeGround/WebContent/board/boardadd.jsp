<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardVO" %>
<%@ page import="board.BoardDAO" %>

<%
	request.setCharacterEncoding("utf-8");

	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	
	// 세션으로 로그인한 회원 번호와 팀번호 가져오기
	int s_teamNo = (int)session.getAttribute("teamNo");
	int s_memNo = (int)session.getAttribute("memNo");
	
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");

	BoardVO vo = new BoardVO();
	vo.setTitle(title);
	vo.setContents(contents);
	vo.setHate(0);
	vo.setLike(0);
	vo.setRegdate(new Date());
	vo.setMember(s_memNo);
	vo.setPhoto("photo.jpg");
	vo.setTeam(s_teamNo);
	vo.setNo(0);
	
	BoardDAO dao = new BoardDAO();
	dao.addNewContent(vo);
	
	response.sendRedirect("boardList.jsp?teamNo=" + teamNo);
%>
	
	

    