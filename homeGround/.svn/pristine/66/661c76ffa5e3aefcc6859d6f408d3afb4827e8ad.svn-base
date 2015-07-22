<%@page import="java.util.HashMap"%>
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
	String[] chkchangePhoto = r.getParameterValues("chkchangePhoto");
	
	int teamNo = (Integer)session.getAttribute("teamNo");
	
	TeamVO team = new TeamVO();
	TeamDAO tDao = new TeamDAO();
	
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("teamNo", teamNo);
	map.put("teamName", name);
	map.put("teamArea", area);
	map.put("teamIntroduce", introduce);
	
	if (chkchangePhoto[0].equals("true")) {
		map.put("photo", imagename);
	} else {
		map.put("photo", null);
	}
	
	System.out.println("팀 프로필 수정 : " + map);
	tDao.updateTeamInfo(map);
	
	response.sendRedirect("../mainPage.jsp");
%>

