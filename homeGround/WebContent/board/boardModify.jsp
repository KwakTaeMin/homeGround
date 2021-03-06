<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	String value = request.getParameter("list");
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list = dao.getAllBoards();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

	String value1 = request.getParameter("no");
	int no = Integer.parseInt(value1);
	BoardVO vo = dao.getContentView(no);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>:: Content View ::</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="../css/style.css" 	media="all" />
	<link rel="stylesheet" type="text/css" href="../css/board.css" 	media="all" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("form").submit(function(){
				if ($("#title").val() == "") {
					alert("제목을 입력해주세요.");
					$("#title").focus();
					return false;
				}
				if ($("#contents").val() == "") {
					alert("내용을 입력해주세요.");
					$("#contents").focus();
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

			<p class="title">게시판 수정페이지</p>
			<form action="boardupdate.jsp?no=<%=no%>&teamNo=<%=teamNo%>"
				method="post">
				<div id="list_modify">
					<table class="table" border="0">
						<colgroup>
							<col width="10%" />
							<col width="*" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="25%" />
						</colgroup>
						<tbody>
							<tr>
								<th rowspan="2"><%=vo.getNo()%></th>
								<th rowspan="2"><textarea id="title" name="title"><%=vo.getTitle()%></textarea></th>
								<th>좋아요</th>
								<th>싫어요</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
							<tr>
								<td><%=vo.getLike()%></td>
								<td><%=vo.getHate()%></td>
								<td>홍길동</td>
								<td><%=sdf.format(vo.getRegdate())%></td>
							</tr>
							<tr>
								<td colspan="6" class="cont"><textarea id="contents" name="contents"><%=vo.getContents()%></textarea>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="edit">
						<input type="submit" value="완료" class="btn btn-primary complete">
						<a class="btn btn-primary delete"
							href="boardList.jsp?teamNo=<%=teamNo%>">목록</a>
					</div>

				</div>
		</div>
		<!-- // list -->
		</form>
	</div>
	<!-- // container -->
</body>
</html>