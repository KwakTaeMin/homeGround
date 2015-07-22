<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="team.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%
	// multipart/form-data 요청 처리 -> 첨부파일 저장 완료
	String saveDirectory = application.getRealPath("/register/uploadImage");
	int maxPostSize = 1024 * 1024 * 10;	// 10MB
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest r = new MultipartRequest(request, saveDirectory, maxPostSize, "utf-8", policy);
	
	String imagename = r.getFilesystemName("photo");
	
	String name = r.getParameter("teamname");
	String area = r.getParameter("teamarea");
	String introduce = r.getParameter("teamintroduce");
	
	int memNo = (Integer)session.getAttribute("memNo");
	
	
	TeamVO team = new TeamVO();
	team.setName(name);
	team.setArea(area);
	team.setCoachNo(memNo);
	team.setIntroduce(introduce);
	team.setPhoto(imagename);
	
	TeamDAO dao = new TeamDAO();
	dao.addTeam(team);
	
	session.setAttribute("teamNo", dao.getTeamNoByName(name));
	response.sendRedirect("../mainPage.jsp");
%>
