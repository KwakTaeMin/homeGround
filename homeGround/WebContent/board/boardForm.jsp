<%@page import="board.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String value = request.getParameter("addNewContent");
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	String userName = (String)session.getAttribute("memName");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글 작성</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="../css/style.css" media="all" />
	<link rel="stylesheet" type="text/css" href="../css/board.css" media="all" />
	<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script >
	<script type="text/javascript">
		$(function(){
			$("form").submit(function(){
				if ($("#boardtitle").val() == "") {
					alert("제목을 입력해주세요.");
					$("#boardtitle").focus();
					return false;
				}
				if ($("#boardcontents").val() == "") {
					alert("내용을 입력해주세요.");
					$("#boardcontents").focus();
					return false;
				}
			});
		});
	</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/headerLoginState.jsp" />
		<P class="title">게시판 등록 페이지</P>
		<div id="addWrite">
			<form action="boardadd.jsp?teamNo=<%=teamNo %>" method="post">
				<table border="0" cellspacing="0" width="100%" class="table">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
					<tbody>
						<tr>
							<td>제목</td>
							<td><input type="text" id="boardtitle" name="title"/></td>
							<td>작성자</td>
							<td><%=userName %></td>
						</tr>
						<tr>
							<td colspan="4">
								<textarea id="boardcontents" name="contents"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<p class="last"><button type="submit" class="btn btn-primary">등록</button>
				<a href="boardList.jsp?teamNo=<%=teamNo %>" class="btn btn-primary list">목록</a></p>
				
			</form>
		</div>
	</div>
</body>
</html>