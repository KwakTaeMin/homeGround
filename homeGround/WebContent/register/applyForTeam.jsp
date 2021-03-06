<%@page import="java.util.*"%>
<%@page import="team.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("memNo") ==  null){
		response.sendRedirect("../loginForm.jsp");
	}
	if (session.getAttribute("teamNo") != null) {
		response.sendRedirect("../mainPage.jsp");
	}

	request.setCharacterEncoding("utf-8");
	int pageNum = 1;
	String select = "default";
	String keyword = "default";
	
	TeamDAO dao = new TeamDAO();
		
	int rowsPerPage = 10;			// 보여줄 컨텐츠 수
	int totalRows = dao.getTeamCount();		// 테이블에서 전체 행(컨텐츠)의 갯수 조회
	int totalPages = (int)Math.ceil((double)totalRows/rowsPerPage);	// 총 페이지 수
	
	try {	// 페이지 넘버
		pageNum = Integer.parseInt(request.getParameter("pno"));
	} catch(NumberFormatException e) {}
	
	try {	// 키워드로 검색시
		select = request.getParameter("select");
		keyword = request.getParameter("keyword");
	} catch(NumberFormatException e) {}
	
	System.out.println(select);
	HashMap<String, Object> map = new HashMap<String, Object>();
	if ("tName".equals(select)) {
		map.put("tName", keyword);
	} else if ("area".equals(select)) {
		map.put("area", keyword);
	}
	
	int start = (pageNum - 1)*rowsPerPage +1;
	int end = pageNum * rowsPerPage;
	map.put("start", start);
	map.put("end", end);
	
	List<TeamVO> allteams = dao.searchTeamByDynamicPage(map);
	System.out.println(map);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>팀 가입</title>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<style type="text/css">
			#showteam {text-align: center;}
			#showteam th {text-align: center;}
			#showteam td:nth-child(2) {text-align: left;}
			
			#modalTb tbody td {height: 60px;}
			.modalTh {font-weight:bold; font-size:16px; text-align: center; width: 50px;}
		</style>
	    <script type="text/javascript">
	    
	    	$(document).ready(function(){
	    		$("#search").focus();
	    		
	    		
	    		$("#searchBtn").click(function(){
	    			
	    			$("#showteam tbody").html("");
	    			if ($("#search").val() == "") {
	    				alert("검색어를 입력해주세요.");
	    				$("#search").focus();
	    				return false;
	    			}
	    			var value1 = $("#selectteam").val();
	    			var value2 = $("#search").val();
	    			
	    			location.href = "applyForTeam.jsp?select="+value1+"&keyword="+value2;
	    		});
	    		
	    	});
	    	
	    	$(function(){
	    		var selectTeamNo = 0;
	    		
	    		$("#joinBtn").click(function(){
	    			alert("가입합니다.");
	    		});
	    		
	    		$('#myModal').on('show.bs.modal', function (event) {
	    			  var button = $(event.relatedTarget) // Button that triggered the modal
	    			  var recipient = button.data('whatever') // Extract info from data-* attributes
	    			  var no = button.data('no')
	    			  var name = button.data('name')
	    			  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	    			  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	    			  var modal = $(this)
	    			  modal.find('.modal-title').text('Team. ' + name)
	    			  
	    			  $.ajax({
	    				  	type:"post",
							url:"searchTeamDetail?tNo="+no,
							dataType:"json",
							success:function(result){
								selectTeamNo = no;
								$("#modalTb tbody").html("");
								var contents = "<tr>";
								if (result.PHOTO == null) {
									contents += "<td rowspan='3'><img style='width: 250px; height: 180px; margin-right: 20px; border: 1px solid gray;' src='uploadImage/noImg.jpg' class='img-rounded'/></td>";
								} else {
									contents += "<td rowspan='3'><img style='width: 250px; height: 180px; margin-right: 20px;' src='uploadImage/"+result.PHOTO+"' class='img-rounded'/> </td>";
								}
								contents += "<td class='modalTh'> 팀명</td>";
								contents += "<td>&nbsp;"+result.NAME+"</td>";
								contents += "</tr>";
								contents += "<tr>";
								contents += "<td class='modalTh'> 지역</td>";
								contents += "<td>&nbsp;"+result.AREA+"</td>";
								contents += "</tr>";
								contents += "<tr>";
								contents += "<td class='modalTh'> 감독</td>";
								contents += "<td>&nbsp;"+result.COACH+"</td>";
								contents += "</tr>";
								contents += "<tr>";
								contents += "<td></td><td class='modalTh'> 인원수 </td>";
								contents += "<td>&nbsp;&nbsp;"+result.CNT+" 명</td>";
								contents += "</tr>";
								contents += "<tr>";
								contents += "<td></td><td class='modalTh'> 소개</td>";
								contents += "<td>&nbsp;"+result.INTRODUCE+"</td>";
								contents += "</tr>";
								$("#modalTb tbody").html(contents);
							}
	    			  });
	    		});
	    		
	    		$("#joinBtn").click(function(){
	    			location.href = "jointeam.jsp?tNo="+selectTeamNo;
	    		});
	    		
	    		$("#tCreBtn").click(function(){
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
						<h3 class="panel-title">팀 가입하기</h3>
					</div>
					<div class="panel-body">
					
						<p> 
							<select id="selectteam" name="selectteam">
								<option value="tName">팀명</option>
								<option value="area">지역</option>
							</select>
							<input type="text" id="search" name="search" />
							<button id="searchBtn" class="btn btn-default">검색</button> <br/>
						</p>
						
						<table id="showteam" class="table table-bordered" >
							<colgroup>
								<col width="20%" />
								<col width="*" />
								<col width="20%" />
							</colgroup>
							<thead>
								<tr>
									<th>지역</th>
									<th>팀명</th>
									<th>인원수</th>
								</tr>
							</thead>
							<tbody>
<%
	if (allteams.size() == 0) {
%>
								<tr><td colspan='3'>검색어에 해당하는 팀이 존재하지 않습니다.</td></tr>
<%		
	} else {
		for (TeamVO t : allteams) {
			String tArea = t.getArea();
			String tName = t.getName();
			int pNum = t.getPeopleNum();
%>		
								<tr>
									<td><%=tArea %></td>
									<td><a href='javascript:$(&quot;#myModal&quot;).dialog(&quot;open&quot;);'  data-toggle='modal' data-target='#myModal' data-no='<%=t.getNo() %>' data-name='<%=tName %>' ><%=tName %></a></td>
									<td><%=pNum %></td>
								</tr>
<%
		}
	}
%>

							</tbody>
						</table>
						<!-- 페이지 네비게이션 -->
						<div class="text-center">
					<%
						for (int i=1; i<=totalPages; i++) {
					%>
							<a href="applyForTeam.jsp?select=<%=select %>&keyword=<%=keyword %>&pno=<%=i%>" <%if (i==pageNum) {%>style="font-weight: bold;"<%} %>><%= i %></a>	
					<%
						}
					%>
						</div>
						
						<p>
							<button id='tCreBtn' class="btn btn-primary  pull-right">팀 창단하기</button>
						</p>
						
						<!-- Modal_start -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">Modal title</h4>
									</div>
									<div class="modal-body">
							        	<table id='modalTb'>
							        		<tbody>
							        		</tbody>
							        	</table>
							        	
									</div>
									<div class="modal-footer">
										<button type="button" id="joinBtn" class="btn btn-primary">가입하기</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Modal_end -->
		
					</div>
				</div>
			</div>
		</div>
	</body>
</html>