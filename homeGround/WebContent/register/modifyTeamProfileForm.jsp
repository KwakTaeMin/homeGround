<%@ page import="member.*, team.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO 	memberDao	 	= 	new MemberDAO();
	TeamDAO   	teamDao 		= 	new TeamDAO();
try {	
	String memId = (String)session.getAttribute("memId");
	int memNo = (Integer)session.getAttribute("memNo");
	int teamNo = (Integer)session.getAttribute("teamNo");
	
	//userVo.getTeamNo()
	MemberVO userVo = memberDao.getMemberInfoById(memId);
	TeamVO userTeamVo = teamDao.getTeamByNo(teamNo);
	String userName = userVo.getName();
	
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>팀 정보 수정하기</title>
		<link rel= "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
		<link rel ="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
		<link rel="shortcut icon" type="image/x-icon" href="/fav.ico" />
		<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script >
		<script src= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script >
		<style type="text/css">
			#modifyTeamtb tr {
				height: 40px;
			}
			#modifyTeamtb th {
				text-align: center;
			}
			#modifyTeamtb td {
				padding-left: 10px;
			}
			#modifyTeamtb textarea {
				resize: none;
				width: 100%;
				height: 100%;
				border: none 0;
			}
		</style>
		<script type="text/javascript">
			function logout() {
				location.href = "../logout.jsp";
			}
			
			$(document).ready(function(){
				$("th").attr("class", "active");
				$("#teamname").val("<%=userTeamVo.getName()%>");
				$("#teamarea > option[value='<%=userTeamVo.getArea()%>']").attr("selected","<%=userTeamVo.getArea()%>");
				//$("#teamarea").attr("disabled", true);
				$("#teamintroduce").val("<%=userTeamVo.getIntroduce()%>");
				
				$("#photodiv").hide();
				
			});
			
			$(function(){
				$("#cancle").click(function(){
					location.href = "../mainPage.jsp";
				});
				
				$("#chkchangePhoto1").click(function(){
					if ($("#chkchangePhoto1").is(":checked")) {
						$("#photodiv").show();
					} else {
						$("#photodiv").hide();
					}
				});
				$("#photoLb1").click(function(){
					if ($("#chkchangePhoto2").is(":checked")) {
						$("#chkchangePhoto1").attr("checked", "checked");
						$("#photodiv").show();
					}
				});
				
				$("#chkchangePhoto2").click(function(){
					if ($("#chkchangePhoto2").is(":checked")) {
						$("#photodiv").hide();
					} else {
						$("#photodiv").show();
					}
				});
				$("#photoLb2").click(function(){
					if ($("#chkchangePhoto1").is(":checked")) {
						$("#chkchangePhoto2").attr("checked", "checked");
						$("#photodiv").hide();
					}
				});
				
				$("#modifyform").submit(function(){
					if ($("#teamname").val() == "") {
						alert("변경할 팀명을 입력해주세요.");
						$("#teamname").focus();
						return false;
					}
					if ($("#teamintroduce").val() == "") {
						alert("팀 소개를 입력해주세요.");
						$("#teamintroduce").focus();
						return false;
					}
					
					if ($("#chkchangePhoto1").is(":checked")) {
						if ($("#photo").val() == "") {
							alert("변경할 사진을 추가해주세요.");
							$("#photo").focus();
							return false;
						} 
					}
					//$("#teamarea").attr("disabled", false);
				});
				
			});
		</script>
	</head>
	<body>
	<div class="container">
	
		<!-- 네비게이션 -->
		<nav class="navbar navbar-inverse">	
		    <div class="navbar-header">
		      <a class="navbar-brand" href="../mainPage.jsp">홈 그라운드</a>
		    </div>
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="#"> 팀명 :<strong><%=userTeamVo.getName() %></strong></a></li>			        
		      </ul>
		      <p class="navbar-text"><strong><%=userName %></strong>님 안녕하세요. 환영합니다.</p>
		     
		      <button type="button" class="btn btn-danger navbar-btn" onclick="logout()">로그아웃</button>
		      	
		      <form class="navbar-form navbar-left" role="search" method="post" action="otherTeamPage.jsp">
		        <div class="form-group">
		          <input type="text" class="form-control" name="searchTeamName" placeholder="팀명을 검색하세요">
		        </div>
		        <button type="submit" class="btn btn-default">검색</button>
		      </form>
		</nav>
		<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<form id="modifyform" action="updateTeamProfile.jsp" method="post" enctype="multipart/form-data" >
						<table id='modifyTeamtb' class="table table-condensed" >
							<colgroup>
								<col width="20%" />
								<col width="*" />
							</colgroup>
							<tr>
								<th>팀 명</th>
								<td>
									<input type='text' name='teamname' id='teamname' maxlength="30" size="30" />
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
									<textarea id="teamintroduce" name="teamintroduce" maxlength="300" rows="5" cols="10" title="소개를 입력해주세요" placeholder="소개를 입력해주세요" ></textarea>
								</td>
							</tr>			
							<tr>
								<th>프로필 사진</th>
								<td>
									<p>
										<label id='photoLb1'><input type='radio' name="chkchangePhoto" id="chkchangePhoto1" value="true"/>&nbsp;변경하기</label>&nbsp;&nbsp;
										<label id='photoLb2'><input type='radio' name="chkchangePhoto" id="chkchangePhoto2" value="false" checked="checked" />&nbsp;변경취소</label><br/>
										
									</p>
									
									<div id="photodiv">
									<% if (userTeamVo.getPhoto() != null) {%>
										현재 사진 :
										
										<img src="uploadImage/<%=userTeamVo.getPhoto()%>" style="width: 250px; height: 180px;"/> <br/>
									<% } %>
										<input type='file' name='photo' id='photo' />
									</div>
								</td>
							</tr>			
						</table>
						<p style='text-align: right;'>
							<input type='submit' value='수정하기' class="btn btn-primary" />
							<input type='button' value='취소' id='cancle' class="btn btn-default" />
						</p>
					</form>
				</div>
		</div>
	</div>
<%
} catch (NullPointerException e) {
	response.sendRedirect("../loginForm.jsp");
}
%>	
	</body>
</html>