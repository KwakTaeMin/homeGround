<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="result.ResultVO"%>
<%@page import="java.util.List"%>
<%@page import="result.ResultDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="resultInclude.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HG :: Reults List</title>

<link rel= "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
<link rel ="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
<script src="//ajax.googleapis.com/ajax/libs/webfont/1.4.10/webfont.js"></script>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script >
<script src= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script >
<script type="text/javascript" src="../jquery/jquery-1.11.3.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#write").click(function(){
			location.href="resultForm.jsp?teamNo=<%=teamNo %>";
		});
	});
	
	$(document).ready(function(){
		$("#main").click(function(){
			location.href="../mainPage.jsp";
		});
	});
	
// 구글차트
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawVisualization);
	
	function drawVisualization() {
	// Some raw data (not necessarily accurate)
		var data = google.visualization.arrayToDataTable([
		                                                  
			['Month', 	'득점', '실점', '안타', '실책', '볼넷',  '팀 득점 추이'],
	        <%for(int i=0; i<result.size(); i++) {
	        	Date value = result.get(i).getGameDate();
				String gameDate = sdf.format(value);
	        	int myRuns = result.get(i).getMyRuns();
	        	int rivalRuns = result.get(i).getRivalRuns();
	        	int myHits = result.get(i).getMyHits();
	        	int myError = result.get(i).getMyError();
	        	int myBalls = result.get(i).getMyBalls();%>
	        	
	        	['<%=gameDate %>', <%=myRuns %>, <%=rivalRuns %>, <%=myHits %>, <%=myError %>, <%=myBalls %>, <%=myRuns %>],
	        <%}%>                                            
	        ]);

		var options = {
			title : '최근 5 경기 결과 통계',
			vAxis: {title: "Counts"},
			hAxis: {title: "Recent Matches"},
			seriesType: "bars",
			series: {5: {type: "line"}}
		};

		var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}	
	
	
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/headerLoginState.jsp"></jsp:include>
		<div class="panel panel-primary">
			<div class="panel-heading"><h1>전체 경기 결과</h1><h4>총 전적 : <%=winCnt %>승 <%=tieCnt %>무 <%=loseCnt %>패</h4></div>
				
				<div align="center" id="chart_div" style="width: 1000px; height: 330px;"></div>
				
				<div class="panel-body">
					<table class="table table-striped table-bordered">
						<tr>
							<th>GAME NO</th>
							<th colspan="4">GAME RESULT</th>
							<th colspan="1">DATE</th>
						</tr>
					<%
						for(int i=0; i<list.size(); i++) {
							int no = list.get(i).getGameNo();
							int myRuns = list.get(i).getMyRuns();
							int rivalRuns = list.get(i).getRivalRuns();
							Date value = list.get(i).getGameDate();
							String gameDate = sdf.format(value);
							
							int rivalNo = list.get(i).getRivalTeamNo();
							int myTeamNo = list.get(i).getMyTeamNo();
							
							String rivaleTeam = dao.getTeamNameByNo(rivalNo);
							String myTeam = dao.getTeamNameByNo(myTeamNo);
					%>
						<tr>
							<td><a href="resultDetail.jsp?pno=<%=pno %>&no=<%=no %>&teamNo=<%=teamNo %>"><%=(pno-1)*rowPerPage + (i+1) %></a></td>
							<td><a href="resultDetail.jsp?pno=<%=pno %>&no=<%=no %>&teamNo=<%=teamNo %>"><%=myTeam %></a></td>
							<%if(myRuns > rivalRuns) {%>
							<td align="center" style="color: red;"><%=myRuns %></td>
							<%} else if(myRuns < rivalRuns){%>	
							<td align="center" style="color: blue;"><%=myRuns %></td>	
							<%} else {%>
							<td align="center" style="color: green;"><%=myRuns %></td>
							<%} %>
							
							<td><a href="../otherTeamPage.jsp?searchTeamName=<%=rivaleTeam %>"><%=rivaleTeam %></a></td>
							<% if(myRuns < rivalRuns) {%>
							<td align="center" style="color: red;"><%=rivalRuns %></td>
							
							<%} else if(myRuns > rivalRuns) {%>
							<td align="center" style="color: blue;"><%=rivalRuns %></td>	
							<%} else {%>
							<td align="center" style="color: green;"><%=rivalRuns %></td>
							<%} %>
							<td><%=gameDate %></td>
						</tr>
					<%} %>	
					</table>
					<div id="navi" align="center">
						<ul class="pagination">
							<%
							for (int i=1; i<=totalPages; i++) {
							%>	
								<li><a href="resultList.jsp?pno=<%=i %>&teamNo=<%=teamNo %>"><%=i %></a></li>	
						<% }%>	
						</ul>
					</div>
				</div>

				<div class="panel-footer" align="right">
				<%
					int mNo = (Integer)session.getAttribute("memNo");
					int coachNo = dao.getCoachNoByTeamNo(teamNo);
					
					if(mNo == coachNo) {%>
					<input class="btn btn-warning btn-sm" type="button" id="write" value="글 작성" />
						
					<%} %>
				<input class="btn btn-success btn-sm" type="button" id="main" value="메인으로" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>