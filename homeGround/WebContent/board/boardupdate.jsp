<%@page import="java.util.Date"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");

int teamNo = Integer.parseInt(request.getParameter("teamNo"));

String value1 = request.getParameter("no");
int no = Integer.parseInt(value1);		

String title = request.getParameter("title");
String contents = request.getParameter("contents");

BoardVO vo = new BoardVO();
vo.setNo(no);
vo.setTitle(title);
vo.setContents(contents);
vo.setHate(0);
vo.setLike(0);
vo.setRegdate(new Date());
vo.setMember(0);
vo.setPhoto("photo.jpg");
vo.setTeam(0);

BoardDAO dao = new BoardDAO();
dao.modifyboard(vo);



response.sendRedirect("boardList.jsp?no=" + no+ "&teamNo=" + teamNo);

%>

