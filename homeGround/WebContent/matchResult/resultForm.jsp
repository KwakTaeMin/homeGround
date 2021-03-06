<%@page import="java.util.List"%>
<%@page import="result.ResultDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int teamNo = (Integer)session.getAttribute("teamNo");
	ResultDAO dao = new ResultDAO();
	List<String> teamNames = dao.getAllTeamName(teamNo);
	String myTeam = dao.getTeamNameByNo(teamNo);
	int tNo = Integer.parseInt(request.getParameter("teamNo"));
%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HG :: Reults Form</title>
<link rel= "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
<link rel ="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script >
<script src= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script >
<script type="text/javascript" src="../jquery/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(function(){
		$("#cancle").click(function(){
			location.href="resultList.jsp?teamNo=<%=tNo %>";
		});
		
		// 입력 숫자 갯수 제한
		$("input[type='text']").attr("maxlength", 2);
		
		$("input[type='text']").attr("class","form-control input-sm");
		
		// input 박스에 숫자만 입력받기 (백스페이스 허용)
		$("input[type='text']").keydown(function(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105  ) || keyID == 8 || keyID == 9)	
			{
				return;
			}
			else
			{
				return false;
			}
		});
		
		// input text에 값을 입력하지 않으면 0으로 저장하는 함수
		var flag = false;
		
		$("form").submit(function() {
			if(!flag) {
				alert("값을 입력하지 않으면 0으로 저장됩니다.");
				$("input[type='text']:eq(0)").focus();
				flag = true;
				return false;
			}
			$("input[type='text']").each(function(){
				if($(this).val() == "") {
					$(this).val(0);
				}
			});
		});
	});
	
	
</script>
</head>
<body>
<div class="container">
	<div class="row">
	<jsp:include page="/headerLoginState.jsp"></jsp:include>
		<div class="panel panel-primary">
			<div class="panel-heading"><h1>경기 결과 입력</h1></div>
			<div class="panel-body">
			<form method="post" action="resultSave.jsp?teamNo=<%=tNo %>">
				<table class="table table-striped table-bordered">
					<tr>
						<th>상대팀
			
						</th>
						<td>
							<select class="form-control" name="rival-team">
			
						<%
						for(String s : teamNames) {
						%>					
								<option value="<%=s %>"><%=s %></option>
						<%} %>			
							</select>
						</td>
						<th>우리팀</th><td colspan="2"><%=myTeam %></td>
					</tr>
					<tr>
						<th>R(득점)</th>
						<td><input placeholder="상대팀 득점" type="text" name="rival-runs"/></td>
						<th>R(득점)</th>
						<td><input placeholder="우리팀 득점" type="text" name="my-runs"/></td>
					</tr>
					
					<tr>
						<th>H(안타)</th>
						<td><input placeholder="상대팀 안타" type="text" name="rival-hits"/></td>
						<th>H(안타)</th>
						<td><input placeholder="우리팀 안타" type="text" name="my-hits"/></td>
					</tr>
					
					<tr>
						<th>E(실책)</th>
						<td><input placeholder="상대팀 실책" type="text" name="rival-error"/></td>
						<th>E(실책)</th>
						<td><input placeholder="우리팀 실책" type="text" name="my-error"/></td>
					</tr>
					
					<tr>
						<th>B(볼넷)</th>
						<td><input placeholder="우리팀 볼넷" type="text" name="rival-balls"/></td>
						<th>B(볼넷)</th>
						<td><input placeholder="우리팀 볼넷" type="text" name="my-balls"/></td>
					</tr>
				</table>
				</div>
			<div class="panel-footer" align="right">
			<input class="btn btn-primary btn-sm" type="submit" value="등록" />
			<input class="btn btn-danger btn-sm" type="button" id="cancle" value="취소"/>
			</div>
			</form>

		</div>
	</div>
</div>
</body>
</html>