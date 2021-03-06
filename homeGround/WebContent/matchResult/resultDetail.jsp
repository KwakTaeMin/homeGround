<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="result.ResultVO"%>
<%@page import="result.ResultDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="resultDetailInclude.jsp" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HG :: Reults Details</title>

<link rel= "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
<link rel ="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script >
<script src= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script >

<script type="text/javascript" src="../jquery/jquery-1.11.3.js"></script>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		$("#list").click(function(){
			location.href="resultList.jsp?pno=<%=pno %>&teamNo=<%=teamNo %>";
		});
	});
	
	var flag = false;
	
	$(document).ready(function(){
		$("#delete").click(function(){
			if(!flag) {
				alert("'삭제하기' 버튼을 한번 더 누르면 삭제됩니다.");
				flag = true;
				return false;
			}
			if(flag) {
				alert("글이 삭제됩니다.");
				location.href="resultDelete.jsp?pno=<%=pno %>&no=<%=no %>&teamNo=<%=teamNo %>";
			}
		});
	});
	
	$(document).ready(function(){
		$("#update").click(function(){
			location.href="resultUpdateForm.jsp?pno=<%=pno %>&no=<%=no %>&teamNo=<%=teamNo %>";
		});
	});
	
	$(function() {
		$("form").submit(function(){
			if($("input[type='text']").val() == "") {
				alert("댓글을 입력하세요.");
				return false;
			} else {
				return;
			}
		});
	});
	
	$(function(){
		$("#goMain").click(function(){
			location.href="../mainPage.jsp";
		});
	});
	
	google.load("visualization", "1.1", {packages:["bar"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Team', '득점', '안타', '실책', '볼넷'],
        ['<%=myTeam %>', <%=myRuns %>, <%=myHits %>, <%=myError %>, <%=myBalls %>],
        ['<%=rivalTeam %>', <%=rivalRuns %>, <%=rivalHits %>, <%=rivalError %>, <%=rivalBalls %>]
        
      ]);

      var options = {
        chart: {
          title: '경기 결과 비교 그래프',
          subtitle: '',
        },
        bars: 'horizontal' 
      };

      var chart = new google.charts.Bar(document.getElementById('barchart_material'));

      chart.draw(data, options);
    }
	
</script>
</head>
<body>

<div class="container">
	<div class="row">
	<jsp:include page="/headerLoginState.jsp"></jsp:include>
		<div class="panel panel-primary">
			<div class="panel-heading"><h3>상세경기결과 <%=gameDate %>요일 vs "<%=rivalTeam %>" </h3></div>
				
				<div id="barchart_material" style="width: 1000px; height: 310px;"></div>
				
				<div class="panel-body">
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
							<td><strong><%=myTeam %></strong></td>
							<td><%=myRuns %></td>
							<td><%=myRuns %></td>
							<td><%=myHits %></td>
							<td><%=myError %></td>
							<td><%=myBalls %></td>
						</tr>
						<tr>
							<td><%=rivalTeam %></td>
							<td><%=rivalRuns %></td>
							<td><%=rivalRuns %></td>
							<td><%=rivalHits %></td>
							<td><%=rivalError %></td>
							<td><%=rivalBalls %></td>
						</tr>
					</table>
				</div>
				<div class="panel-footer" align="right">
					<input class="btn btn-success btn-sm" type="button" id="goMain" value="메인으로">
					<input class="btn btn-primary btn-sm" type="button" id="list" value="목록으로" />
					
					<%
						int mNo = (Integer)session.getAttribute("memNo");
						int coachNo = dao.getCoachNoByTeamNo(teamNo);
						
						if(mNo == coachNo) {%>
							<input class="btn btn-danger btn-sm" type="button" id="delete" value="삭제하기" />
							<input class="btn btn-warning btn-sm" type="button" id="update" value="수정하기" />
						<%}%>

				<div class="panel-footer" align="left">
					<form method="post" action="resultSaveComment.jsp?pno=<%=pno %>&no=<%=no %>&teamNo=<%=teamNo %>">
						<div class="form-group">
						<label for="inputdefault">댓글</label>
						<table style="width: 1100px;">
							<colgroup>
								<col width="90%">
								<col width="10%">
							</colgroup>
							<tr>
								<td><input type="text" class="form-control" id="inputdefault" name="comment" maxlength="65" placeholder="댓글을 입력하세요."/></td>
								<td align="center"><input class="btn btn-primary btn-sm" id="reply" type="submit" value="등록" align="right"></td>
							</tr>
						</table>
						</div>
					</form>
				
				<div>
					<%
					for(ResultReplyVO r : replies) {
						System.out.println(r);
						String memId = r.getMemId();
						int memNo = r.getMemNo();
						int cNo = r.getCommentNo();
						String contents = r.getContents();
						Date date = r.getGameDate();
						SimpleDateFormat sdf2 = new SimpleDateFormat("yy.M.d EE hh:mm");
						String gDate = sdf2.format(date);
					%>
					<table style="width: 1100px;">
						<colgroup>
							<col width="10%">
							<col width="70%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<tr>
							<th align="center"><%=memId %></th>
							<td align="left"><%=contents %></td>
							<td align="center"><%=gDate %></td>
							
							<%if(memNo == myNo) {%>
							<td align="center"><input type="button" class="btn btn-danger btn-xs" style="height: 19px;" onclick="location.href='resultDeleteComment.jsp?pno=<%=pno %>&no=<%=no %>&cno=<%=cNo %>&mno=<%=memNo %>&teamNo=<%=teamNo %>'" value="삭제"/></td>
							<% } else {%>
							<td> </td>	
							<%}
						} %>
								
						</tr>
					</table>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>



</body>
</html>