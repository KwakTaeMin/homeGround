<%@page import="notice.N_C_DAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="notice.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeDAO dao = new NoticeDAO();

	int	teamNo	= 	Integer.parseInt(request.getParameter("teamNo"));
	
	int sTeamNo = (Integer)session.getAttribute("teamNo");

	int rowsPerPage = 5;
 	int totalRows = dao.getTotalRow(teamNo);
 	int totalPages = (int)Math.ceil((double)totalRows/rowsPerPage);
 	int pno = 1;
 	try {
 		pno = Integer.parseInt(request.getParameter("pno"));
 	} catch(NumberFormatException e) {
 		
 	}
 	
 	int start	= 	(pno - 1)*rowsPerPage + 1;
	int end 	= 	pno*rowsPerPage;
		
		
	HashMap<String, Object> range = new HashMap<String, Object>();
	range.put("startNo", start);
	range.put("endNo", end);
	range.put("teamNo", teamNo);
	
	List<NoticeVO> list = dao.getNoticeRange(range);
	
	
	N_C_DAO dao2 = new N_C_DAO();

	int memNo = (Integer)session.getAttribute("memNo");
	String check = (String)dao.coachCheck(memNo);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel= "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
<link rel ="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script >
<script src= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script >
<style type="text/css">
	th {text-align: center;}
</style>
</head>
<body>
<div class="container">
<div class="row">
<jsp:include page="/headerLoginState.jsp" />
<div class="panel panel-primary">

<div class="panel-heading">
	<h1 class="panel-title">공지사항 목록</h1>
</div>

<div id="wraaper">
<br />
<h4>　　<%=pno %> Page</h4>

<div class="panel-body">
<table border="1" style="width: 95%" align="center" class="table table-striped table-bordered">
<tr align="center">
	<td>번호</td>
	<td width="300">제목</td>
	<td>글쓴이</td>
	<td>좋아요</td>
	<td>날짜</td>
</tr>
<% for(NoticeVO n : list) { 

	int cnt = 0;
	int cmmt = dao2.commentCount(n.getNo(), teamNo);
%>
<tr>
	<th><%=n.getNo() %></th>
	<th align="left"><a href="noticeDetail.jsp?no=<%=n.getNo()%>&amp;pno=<%=pno%>&amp;teamNo=<%=teamNo%>" class=pull-left><%=n.getTitle() %>      <%if(cmmt != 0){ %>[<%=cmmt %>]<%} %></a></th>
	<th>감  독</th>
	<th><%=n.getLike() %></th>
	<th><%=n.getStrDate() %></th>
</tr>
<%
}
%>
</table>

	
	<div id="navi" align="center">
	<% 
		for(int i=1; i<=totalPages; i++) {
	%>
		<a href="noticeList.jsp?teamNo=<%=teamNo %>&pno=<%=i%>"><%=i %></a>
	<%
		}
	%>
	<br /><br />
<hr>

<span class="pull-right">
	<a href="../mainPage.jsp?teamNo=<%=teamNo %>" class="btn btn-warning btn-sm btn-primary">메인페이지로</a>
<%
if(teamNo == sTeamNo) {
	
	if(String.valueOf(memNo).equals(check)) {%>
	<a href="noticeForm.jsp?teamNo=<%=teamNo %>" class="btn btn-success btn-sm btn-primary">새 글 작성하기</a>
	<%
	}
} else {
%>
<%
}
%>
</span>
	</div>
	</div>
</div>
</div>
</div>
</div>
</body>
</html>





























