<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	function nullCheck() {
		var title = document.getElementById("usr").value;
		if(title == "") {
			
			alert("제목을 입력해주세요");
			document.getElementById("usr").focus();
			return false;
		}
		
		var content = document.getElementById("comment").value;
		if(content == "") {
			
			alert("내용을 입력해주세요");
			document.getElementById("comment").focus();
			return false;
		}
		
		return true;
	}
</script>

</head>
<body>

<div class="container">
<jsp:include page="/headerLoginState.jsp" />
<div class="panel panel-primary">

<div class="panel-heading">
	<h1 class="panel-title">새 글 작성하기</h1>
</div>
<br />

<form method="post" action="noticeAdd.jsp" onsubmit="return nullCheck()">
<div class="row">
<div class="form-group col-md-2"></div>
<div class="form-group col-md-8">
<label for="usr">제목:</label>
  <input type="text" name="title" class="form-control" id="usr" maxlength="30">
</div>
<div class="form-group col-md-2"></div>
</div>

<div class="row">
<div class="form-group col-md-2"></div>
<div class="form-group col-md-8">
  <label for="comment">내용:</label>
  <textarea class="form-control" name="contents" rows="5" id="comment" maxlength="1000"></textarea>
</div>
<div class="form-group col-md-2"></div>

<div class="form-group col-md-6"></div>
<div class="form-group col-md-1"></div>
<div class="form-group col-md-4 pull-right">

<input type="submit" value="글 올리기" width="70" class="btn btn-success btn-sm"/>
<%
 int teamNo = Integer.parseInt(request.getParameter("teamNo"));
%>
<a href="../notice/noticeList.jsp?teamNo=<%=teamNo %>"><input type="button" value="취소" width="70" class="btn btn-success btn-sm"></a>

</div>
</div>
</form>
</div>
</div>
</body>
</html>
