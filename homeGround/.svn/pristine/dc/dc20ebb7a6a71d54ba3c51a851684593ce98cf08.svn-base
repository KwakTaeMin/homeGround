<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>

<% 
	String value = request.getParameter("no");
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	int boardNo = 0;
	try {
		boardNo = Integer.parseInt(value);
	} catch (Exception e) {}
	

	BoardDAO boarddao = BoardDAO.getInstance();
	B_C_DAO b_c_dao = new B_C_DAO();
	// 해당 게시글의 모든 댓글 삭제
	b_c_dao.deleteAllBoardComment(boardNo);
	
	// 게시글 삭제
	boarddao.removeboard(boardNo);
	
	response.sendRedirect("boardList.jsp?teamNo=" + teamNo);
	
	

	
%>