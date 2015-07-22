<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("memNo") ==  null){
		response.sendRedirect("../loginForm.jsp");
	}
	if (session.getAttribute("teamNo") != null) {
		response.sendRedirect("../mainPage.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>선택</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
		<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#joinTeamBtn").click(function(){
					location.href = "applyForTeam.jsp";
				});
				$("#createTeamBtn").click(function(){
					location.href = "teamCreateForm.jsp";
				});
			});
		</script>
		
	</head>
	<body>
		<div class="container">
			<div class="row">
				<jsp:include page="/header.jsp" />
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">팀 가입 / 창단하기</h3>
					</div>
					<div class="panel-body">
						<div class="col-md-6 col-md-offset-3">
							<button id='joinTeamBtn' class="btn btn-default btn-lg btn-block">가입</button>
							<button id='createTeamBtn' class="btn btn-default btn-lg btn-block">창단</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>