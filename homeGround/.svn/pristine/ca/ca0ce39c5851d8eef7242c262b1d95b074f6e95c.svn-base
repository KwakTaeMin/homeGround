<%@page import="java.util.HashMap"%>
<%@page import="java.awt.font.NumericShaper.Range"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
	<%
		BoardDAO dao = new BoardDAO();
	
		int teamNo = Integer.parseInt(request.getParameter("teamNo"));
		int s_teamNo = (Integer)session.getAttribute("teamNo");
		
	
		String value = request.getParameter("list");
		
		int rowsPerPage = 5;
	 	int totalRows = dao.getTotalBoardRow(teamNo);
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
		
		List<BoardVO> pageList = dao.getBoardRange(range);
	%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: Content List ::</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="../css/style.css" media="all" />
	<link rel="stylesheet" type="text/css" href="../css/board.css" media="all" />
	<link rel="shortcut icon" type="image/x-icon" href="/fav.ico" />
</head>
	<body>
	<div class="container">
		<div class="row">
		<jsp:include page="/headerLoginState.jsp" />
		<div class="panel panel-primary">
		
		<div class="panel-heading">
			<h1 class="panel-title">자유게시판 목록</h1>
		</div>

		<div class="panel-body">
		<div class="table-bordered">
			<table border="1" width="95%" class="table table-hover table-striped table-bordered board">

				<tbody>

					<tr>
						<th>번호</th>
						<th width="300px;">제목</th>
						<th>작성자</th>
						<th>좋아요</th>
						<th>등록일</th>
					</tr>

				<% for ( BoardVO b : pageList ) { %>
					<tr>
						<th><%=b.getNo() %></th>
						<th><a href="boardDetail.jsp?no=<%=b.getNo() %>&teamNo=<%=teamNo %>"><%=b.getTitle() %></a></th>
						<th><%=b.getMemberName() %></th>
						<th><%=b.getLike() %></th>
						<th><%=b.getStrRegdate() %></th>
					</tr>
				<% } %>
					
				</tbody>
			</table>
			
<div id="navi" align="center">
	<% 
		for(int i=1; i<=totalPages; i++) {
	%>
			<a href="boardList.jsp?teamNo=<%=teamNo %>&pno=<%=i %>"><%=i %></a>
	<%
		}
	%>
	<br />
	<br />
	<span class="pull-right">
			<a class="btn btn-primary btn-sm btn-warning" href="../mainPage.jsp">메인목록</a>
<% if (s_teamNo == teamNo) { %>						
			<a class="btn btn-primary btn-sm btn-success" href="boardForm.jsp?teamNo=<%=teamNo %>">글쓰기</a>
<% } %>			
	</span>
</div>
			
	</div>
	</div>
	</div>		
	</div>		
	</div>
	</body>
</html>
</html>