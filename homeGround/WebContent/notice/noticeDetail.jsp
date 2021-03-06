<%@page import="java.text.SimpleDateFormat"%>
<%@page import="notice.N_C_DAO"%>
<%@page import="java.util.List"%>
<%@page import="notice.N_C_VO"%>
<%@page import="notice.NoticeVO"%>
<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pno = Integer.parseInt(request.getParameter("pno"));
	int num = Integer.parseInt(request.getParameter("no"));
	
	NoticeDAO dao = new NoticeDAO();
	NoticeVO vo =  dao.getTitleInfo(num);
	
	N_C_DAO dao2 = new N_C_DAO();
	
	List<N_C_VO> list = dao2.getAllComment(num);
	
	String name = (String)session.getAttribute("memName");
	int mem = (Integer)session.getAttribute("memNo");
	
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	int sTeamNo = (Integer)session.getAttribute("teamNo");
	
	String check = (String)dao.coachCheck(mem);
	System.out.println("check" + check);

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
<script type="text/javascript">
	function like() {
		alert("좋아요를 누르셨습니다.");
		location.href="updateLike.jsp?no=<%=num %>&pno=<%=pno %>&teamNo=<%=teamNo%>";
	}
	
	function hate() {
		alert("싫어요를 누르셨습니다.");
		location.href="updateHate.jsp?no=<%=num %>&pno=<%=pno %>&teamNo=<%=teamNo%>";

	}
	
	function nullCheck() {
		var comment = document.getElementById("comment").value;
		if(comment == "") {
			
			alert("댓글을 입력해주세요");
			document.getElementById("comment").focus();
			
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
		tr {text-align: center;}
		th {text-align: center;}
		td {font-weight: bold;}
		td.text {word-break:break-all;}
		
</style>
</head>
<body>
<div class="container">
<div class="row">
<jsp:include page="/headerLoginState.jsp" />
<div class="panel panel-primary">
<div class="panel-heading">
	<h1 class="panel-title">상세정보</h1>
</div>
<div class="panel-body">

<table border="1" style="width: 100%" align="center" class="table table-striped table-bordered">
<tr>
	<td>제목</td>
	<td>글쓴이</td>
	<td>좋아요</td>
	<td>싫어요</td>
	<td>날짜</td>
</tr>
<tr>
	<th><%=vo.getTitle() %></th>
	<th>감  독</th>
	<th><%=vo.getLike() %></th>
	<th><%=vo.getHate() %></th>
	<th><%=vo.getStrDate() %></th>
</tr>
<tr>
	<td colspan="5">내용</td>
</tr>
<tr>
	<td colspan="5" height="100px" align="left" class="text"><p class=pull-left><%=vo.getContents().replace("\r\n", "<br>") %></p></td>
</tr>
</table>
<div>
	<input type="button" value="좋아요" onclick="like()" class="btn btn-info btn-sm btn-primary" />
	<input type="button" value="싫어요" onclick="hate()" class="btn btn-danger btn-sm btn-primary"/>
	
	<span class="pull-right">
		<a href="noticeList.jsp?teamNo=<%=teamNo %>&amp;pno=<%=pno %>" class="btn btn-success btn-sm btn-primary">목록으로</a>
	<%
	if(teamNo == sTeamNo) {
		if(String.valueOf(mem).equals(check)) { %>
		<a href="noticeDelete.jsp?no=<%=num %>&amp;pno=<%=pno %>&amp;teamNo=<%=teamNo %>" class="btn btn-warning btn-sm btn-primary">삭제</a>
		<a href="noticeUpdate.jsp?no=<%=num %>&amp;pno=<%=pno %>&amp;teamNo=<%=teamNo %>"class="btn btn-warning btn-sm btn-primary">수정</a>
		<%
		}
	} else {
	%>

	<%
	}
	%>
	</span>
</div>

<hr>

<form method="post" action="addComment.jsp?" onsubmit="return nullCheck()">
	<input type="hidden" name="noticeNo" value="<%=num %>" />
	<input type="hidden" name="noticePno" value="<%=pno %>" />
	<input type="hidden" name="teamNoc" value="<%=teamNo %>" />
	
	<p align="center">
	댓글 : <input type="text" name="comment" style="width:700px" id="comment" maxlength="100" class="form-contorol"/>
	<input type="submit" value="댓글 쓰기" width="700" class="btn btn-info btn-sm btn-primary "/>
	</p>
</form>
<table style="width: 80%" align="center" class="table table-striped">
<%
	for(N_C_VO a : list) {
%>	
<tr>
	<th><%=a.getMemberName() %></th>
	<th><%=a.getContents() %></th>
	<th><%=a.getStrDate() %></th>
	<% 
	if(a.getMemberNo() == mem) {
	%>
	<th><input type="button" value="삭제" onclick="location.href='deleteComment.jsp?c_no=<%=a.getNo() %>&no=<%=num %>&pno=<%=pno %>&teamNo=<%=teamNo %>'" class="btn btn-danger btn-xs btn-primary"/></th>
</tr>
	<%
	}
	%>
<%
	}
%>
</table>

</div>
</div>
</div>
</div>
</body>
</html>
