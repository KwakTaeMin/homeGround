<%@page import="board.B_C_VO"%>
<%@page import="board.B_C_DAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("utf-8");
		int teamNo = Integer.parseInt(request.getParameter("teamNo"));
		
		String value = request.getParameter("list");

		BoardDAO dao = new BoardDAO();
		List<BoardVO> list = dao.getAllBoards();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		int value1 = Integer.parseInt(request.getParameter("no"));
		int mem = (Integer)session.getAttribute("memNo");
		
		BoardVO vo = dao.getContentView(value1);
		B_C_DAO dao2 = new B_C_DAO();
		
		List<B_C_VO> list1 = dao2.commentView(value1);
		
		
		
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: Content View ::</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="../css/style.css" media="all" />
	<link rel="stylesheet" type="text/css" href="../css/board.css" media="all" />
	<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script >
	<script type="text/javascript">
		$(function(){
			
			$("#boardcommentform").submit(function(){
				if ($("#comment").val() == "") {
					alert("댓글을 입력해주세요.");
					$("#comment").focus();
					return false;
				}
			});
			
		});
	</script>
</head>
<body>
	<div class="container">
	<div class="row">
		<jsp:include page="/headerLoginState.jsp" />
	<div class="panel panel-primary">
	<div class="panel-heading">
		<h1 class="panel-title">상세정보</h1>
	</div>
		<div id="list_view">
			<table border="1" style="width: 100%" align="center" class="table table-striped table-bordered">

				<tbody>
					<tr>
						<th rowspan="2"><%=vo.getNo() %></th>
						<th rowspan="2"><%=vo.getTitle() %></th>
						<th>좋아요<a href="boardLike.jsp?no=<%=vo.getNo()%>&teamNo=<%=vo.getTeam()%>"><img src="../images/like.gif" alt="좋아요" /></a></th>
						<th>싫어요<a href="boardHate.jsp?no=<%=vo.getNo()%>&teamNo=<%=vo.getTeam()%>"><img src="../images/hate.gif" alt="싫어요" /></a></th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
					<tr>
						<td><%=vo.getLike() %></td>
						<td><%=vo.getHate() %></td>
						<td>홍길동</td>
						<td><%=sdf.format(vo.getRegdate()) %></td>
					</tr>
					<tr>
						<td colspan="6"><%=vo.getContents() %></td>
					</tr>
				</tbody>
			</table>
			
			<div class="edit">
			<a class="btn btn-primary modify" href="boardModify.jsp?no=<%=value1 %>&teamNo=<%=teamNo %>">수정</a>
			<a class="btn btn-primary delete" href="boardremove.jsp?no=<%=value1 %>&teamNo=<%=teamNo %>">삭제</a>
			</div>
			
			
			<div class="btn">
			<a class="btn btn-primary write" href="boardList.jsp?teamNo=<%=teamNo %>">목록</a>
			</div>
			
			
			
			<div class="comment">
				<form id="boardcommentform" action="addComment.jsp" method="post">
					<input type="hidden" name="boardNo" value="<%=value1 %>" />
					<p><label for="comment">댓글</label>
					<input type="text" id="comment" name="comment" placeholder="댓글을 입력하세요."/>
					<input type="submit" value="등록" class="btn btn-primary submit" /></p>
				</form>
			</div>
			
			<table width="100%" class="table table-hover table-striped">
			
				<colgroup>
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
				</colgroup>
				<%
					for(B_C_VO b : list1) {
				%>
			  <tr>
			    <th><%=b.getMemberName()%></th>
			    <th><%=b.getContents()%></th>
			    <th><%=sdf.format(b.getDate()) %></th>
			    <%
			    	if(b.getMemberNo() == mem) {
			    %>
			    <th><input type="button" value="삭제" onclick="location.href='deleteComment.jsp?c_no=<%=b.getNo() %>&no=<%=value1%>&teamNo=<%=teamNo %>'" /></td>
			    <%
			    	}
			    %>
			  </tr>
				<%
					}
				%>
			</table>
			</div>
			</div>
		</div> <!-- // list -->
	</div> <!-- // container -->
</body>
</html>