<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="resultDetailInclude.jsp" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel= "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
<link rel ="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script >
<script src= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script >
<script type="text/javascript" src="../jquery/jquery-1.11.3.js"></script>
<title>HG :: Reult Update Form</title>
<script type="text/javascript">
	//input 박스에 숫자만 입력받기 (백스페이스 허용)
	$(function() {
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
		
		// 입력 숫자 갯수 제한
		$("input[type='text']").attr('maxlength', 2);
		
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
<div class="panel-heading"><h1>경기결과 수정하기</h1></div>
<div class="panel-body">
<h3><%=gameDate %></h3>
<form method="post" action="resultUpdate.jsp?pno=<%=pno %>&no=<%=no %>&teamNo=<%=teamNo %>">
<table class="table table-striped table-bordered">
	<tr>
		<th>팀</th>
		<th>스코어</th>
		<th>R(득점)</th>
		<th>H(안타)</th>
		<th>E(실책)</th>
		<th>B(볼넷)</th>
	</tr>
	<tr>
		<td>우리팀</td>
		<td><%=myRuns %></td>
		<td><input class="form-control input-sm" type="text" placeholder="우리팀 득점" name="myruns" value="<%=myRuns %>"></td>
		<td><input class="form-control input-sm" type="text" placeholder="우리팀 안타" name="myhits" value="<%=myHits %>"></td>
		<td><input class="form-control input-sm" type="text" placeholder="우리팀 실책" name="myerror" value="<%=myError %>"></td>
		<td><input class="form-control input-sm" type="text" placeholder="우리팀 볼넷" name="myballs" value="<%=myBalls %>"></td>
	</tr>
	<tr>
		<td><%=rivalTeam %></td>
		<td><%=rivalRuns %></td>
		<td><input class="form-control input-sm" type="text" placeholder="상대팀 득점" name="rivalruns" value="<%=rivalRuns %>"></td>
		<td><input class="form-control input-sm" type="text" placeholder="상대팀 안타" name="rivalhits" value="<%=rivalHits %>"></td>
		<td><input class="form-control input-sm" type="text" placeholder="상대팀 실책" name="rivalerror" value="<%=rivalError %>"></td>
		<td><input class="form-control input-sm" type="text" placeholder="상대팀 볼넷" name="rivalballs" value="<%=rivalBalls %>"></td>
	</tr>
	
</table>
</div>
<div class="panel-footer" align="right">
<input class="btn btn-primary btn-sm" type="submit" value="수정" />
<input class="btn btn-danger btn-sm" type="button" id="cancle" value="취소" onclick="location.href='resultDetail.jsp?pno=<%=pno %>&no=<%=no %>&teamNo=<%=teamNo %>'"/>
</div>

</div>
</div>
</form>
</div>
</body>
</html>