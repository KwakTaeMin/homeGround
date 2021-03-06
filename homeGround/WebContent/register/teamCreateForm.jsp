<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("memNo") ==  null){
		response.sendRedirect("../loginForm.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>팀 창단하기</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
		<link rel="stylesheet" type="text/css" href="../css/style.css" media="all" />
		<style type="text/css">
			#teamtb tr {
				height: 40px;
			}
			#teamtb th {
				text-align: center;
			}
			#teamtb td {
				padding-left: 10px;
			}
			textarea {
				resize: none;
				width: 100%;
				height: 100%;
				border: none 0;
			}
		</style>
		<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
   		<!-- use jssor.slider.mini.js (40KB) instead for release -->
    	<!-- jssor.slider.mini.js = (jssor.js + jssor.slider.js) -->
	    <script type="text/javascript" src="../js/jssor.js"></script>
	    <script type="text/javascript" src="../js/jssor.slider.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	    <script type="text/javascript">
	    
	    	$(function(){
	    		$("th").attr("class", "active");
	    		
	    		$("#teamname").blur(function(){
	    			
	    			if ($("#teamname").val().length < 5) {
	    				$("#warn1").html("5~30 자리까지 입력가능합니다.");
	    				return false;
	    			} else {
	    				$("#warn1").html("");
	    			}
	    			
		    		$.ajax({
						type:"post",
						url:"teamCheck",
						data:{tName:$("#teamname").val()},
						dataType:"text",
						success:function(result){
							if (result === "exist") {
								idflas = false;
								$("#warn1").html("이미 존재하는 팀명입니다.");
								$("#teamname").focus();
							} else {
								$("#warn1").html("");
								idflag = true;
							}
						}
					});
	    		});
	    		
	    		$("#cancle").click(function(){
					location.href = "selectOrCreateTeam.jsp";	    			
	    		});
	    		
	    	});
	    	
			$(document).ready(function(){
	    		
	    		$("form").submit(function(){
	    			if ($("#teamname").val() == "") {
	    				alert("팀 명을 입력해주세요.");
	    				$("#teamname").focus();
	    				return false;
	    			}
	    			if ($("#teamintroduce").val() == "") {
	    				alert("소개를 입력해주세요.");
	    				$("#teamintroduce").focus();
	    				return false;
	    			} else {
	    				if ($("#teamintroduce").val().length < 10) {
	    					alert("소개는 10자리 이상 입력해주세요.");
		    				$("#teamintroduce").focus();
	    					return false;
	    				}
	    			}
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
						<h3 class="panel-title">팀 창단하기</h3>
					</div>
					<div class="panel-body">
						<div class="col-md-10 col-md-offset-1">
							<form action="addteam.jsp" method="post" enctype="multipart/form-data" >
								<table id='teamtb' class="table table-condensed" >
									<colgroup>
										<col width="20%" />
										<col width="*" />
									</colgroup>
									<tr>
										<th>팀 명</th>
										<td>
											<input type='text' name='teamname' id='teamname' title="팀명을 입력해주세요" placeholder="팀명을 입력해주세요" maxlength="30" size="30" />
											<!-- <input type="button" id="teamChkBtn" name="teamChkBtn" value="중복확인" class="btn btn-primary" /><br/> -->
											<span id='warn1' style='color: red;font-size:12px;'></span>
										</td>
									</tr>
									<tr>
										<th>지역</th>
										<td>
											<select id='teamarea' name='teamarea'>
												<option value='서울특별시'>서울특별시</option>
												<option value='부산광역시'>부산광역시</option>
												<option value='대구광역시'>대구광역시</option>
												<option value='인천광역시'>인천광역시</option>
												<option value='광주광역시'>광주광역시</option>
												<option value='대전광역시'>대전광역시</option>
												<option value='울산광역시'>울산광역시</option>
												<option value='경기도'>경기도</option>
												<option value='강원도'>강원도</option>
												<option value='전라도'>전라도</option>
												<option value='경상도'>경상도</option>
												<option value='충청도'>충청도</option>
												<option value='제주도'>제주도</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>소개</th>
										<td>
											<textarea id="teamintroduce" name="teamintroduce" rows="5" cols="10" maxlength="300" title="소개를 입력해주세요" placeholder="소개를 입력해주세요" ></textarea>
										</td>
									</tr>
									<tr>
										<th>프로필 사진</th>
										<td>
											<input type='file' name='photo' id='photo' />
										</td>
									</tr>
					
								</table>
								<p style='text-align: right;'>
									<input type='submit' value='창단하기' class="btn btn-primary" />
									<input type='button' value='취소' id='cancle' class="btn btn-default" />
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>