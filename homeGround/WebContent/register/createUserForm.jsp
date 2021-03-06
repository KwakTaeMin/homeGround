<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("memNo") !=  null){
		response.sendRedirect("selectOrCreateTeam.jsp");
		return;
	}
	if (session.getAttribute("teamNo") != null) {
		response.sendRedirect("../mainPage.jsp");
		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>회원 가입</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<style type="text/css">

			#jointb tr {
				height: 40px;
			}
			#jointb th {
				text-align: center;
			}
			#jointb td {
				padding-left: 10px;
			}
		</style>
	    <script type="text/javascript">
	    	var idflag = false;
	    	
	    	$(function(){
	    		
	    		$("#idChkBtn").click(function(){
	    			if ($("#addid").val() == "") {
	    				alert("아이디를 입력해주세요.");
	    				$("#addid").focus();
	    				return false;
	    			}
	    			var addid = $("#addid").val();
	    			
	    			$.ajax({
						type:"post",
						url:"idCheck",
						data:{chkId:addid},
						dataType:"text",
						success:function(result){
							if (result === "exist") {
								idflas = false;
								$("#warn1").html("이미 사용중인 아이디입니다.");
								$("#warn1_2").html("");
								$("#addid").focus();
							} else {
								$("#warn1").html("");
								$("#warn1_2").html("사용 가능한 아이디 입니다.");
								idflag = true;
							}
						}
					});
	    		});
	    		
	    		$("#addpw1").blur(function(){
					var size = $("#addpw1").val().length;
	    			if (size < 4 || size > 10) {
	    				$("#warn2").html("4~10 자리까지 입력가능합니다.");
	    				$("#addpw1").focus();
	    				return false;
	    			} else {
	    				$("#warn2").html("");
	    			}
	    			
	    			if ($("#addpw2").val() != "") {
	    				if ($("#addpw1").val() === $("#addpw2").val()) {
		    				$("#warn3").html("");
		    			} else {
		    				$("#warn3").html("비밀번호가 일치하지 않습니다.");
		    				$("#addpw2").val("");
		    			}
	    			}
	    		});
	    		
	    		$("#addpw2").blur(function(){
	    			
	    			if ($("#addpw1").val() === $("#addpw2").val()) {
	    				$("#warn3").html("");
	    			} else {
	    				$("#warn3").html("비밀번호가 일치하지 않습니다.");
	    				$("#addpw2").val("");
	    			}
	    		});
	    		
	    		$("#addid").keyup(function(){
	    			$(this).val( $(this).val().replace(/[^0-9A-Za-z_]/gi,"") );
	    		});
	    		
	    		$("#addname").keyup(function(){
	    			$(this).val( $(this).val().replace(/[^ㄱ-힣A-Za-z]/gi,"") );
	    		});
	    		
	    		$(".onlyNum").keydown(function(event){
	    			event = event || window.event;
	    			var keyId = (event.which) ? event.which : event.keyCode;
	    			if ((keyId >= 48 && keyId <= 57) || (keyId >= 96 && keyId <= 105) || keyId==8 || keyId==9){ //숫자, tab 입력
	    		        return;
	    		    } else {
	    		        return false;
	    		    }
	    		});
	    		
	    		$("#email1").keyup(function(){
	    			$(this).val( $(this).val().replace(/[^0-9A-Za-z_]/gi,"") );
	    		});
	    		
	    		$("#selectemail").change(function(){
	    			var emailAddr = $("#selectemail").val();
	    			
	    			switch(emailAddr) {
	    			case '' :
	    				$("#email2").attr("readonly", "readonly");
	    				$("#email2").val("");
	    				break;
	    			case 'naver.com' :
	    				$("#email2").attr("readonly", "readonly");
	    				$("#email2").val("naver.com");
	    				break;
	    			case 'gmail.com' :
	    				$("#email2").attr("readonly", "readonly");
	    				$("#email2").val("gmail.com");
	    				break;
	    			case 'hanmail.net' :
	    				$("#email2").attr("readonly", "readonly");
	    				$("#email2").val("hanmail.net");
	    				break;
	    			case 'nate.com' :
	    				$("#email2").attr("readonly", "readonly");
	    				$("#email2").val("nate.com");
	    				break;
	    			case 'write' :
	    				$("#email2").val("");
	    				$("#email2").removeAttr("readonly");
	    				$("#email2").focus();
	    				break;
	    			}
	    		});
	    		
	    		$("#cancle").click(function(){
	    			location.href = "../loginForm.jsp";
	    		});

	    		$("th").attr("class", "active");
	    	});
	    	
	    	$(document).ready(function(){
	    		
	    		$("form").submit(function(){
	    			if ($("#addid").val() == "") {
	    				alert("아이디를 입력해주세요.");
	    				$("#addid").focus();
	    				return false;
	    			} else {
	    				if ($("#addid").val().length < 4) {
	    					alert("아이디는 4자리 이상 입력해주세요.");
		    				$("#addid").focus();
	    					return false;
	    				}
	    			}
	    			
	    			if ($("#addpw1").val() == "") {
	    				alert("비밀번호를 입력해주세요.");
	    				$("#addpw1").focus();
	    				return false;
	    			}
	    			if ($("#addpw2").val() == "") {
	    				alert("비밀번호 확인을 입력해주세요.");
	    				$("#addpw2").focus();
	    				return false;
	    			}
	    			if ($("#addname").val() == "") {
	    				alert("이름을 입력해주세요.");
	    				$("#addname").focus();
	    				return false;
	    			}
	    			if ($("#addage").val() == "") {
	    				alert("나이를 입력해주세요.");
	    				$("#addage").focus();
	    				return false;
	    			}
	    			if ($("#phone2").val() == "") {
	    				alert("전화번호를 입력해주세요.");
	    				$("#phone2").focus();
	    				return false;
	    			} else {
	    				if ($("#phone2").val().length < 3){
	    					alert("3자리 이상 입력해주세요.");
		    				$("#phone2").focus();
		    				return false;
	    				}
	    			}
	    			if ($("#phone3").val() == "") {
	    				alert("전화번호를 입력해주세요.");
	    				$("#phone3").focus();
	    				return false;
	    			} else {
	    				if ($("#phone3").val().length < 3){
	    					alert("4자리로 입력해주세요.");
		    				$("#phone3").focus();
		    				return false;
	    				}
	    			}
	    			if ($("#email1").val() == "") {
	    				alert("이메일을 입력해주세요.");
	    				$("#email1").focus();
	    				return false;
	    			}
	    			if ($("#email2").val() == "") {
	    				alert("이메일을 선택해주세요.");
	    				$("#selectemail").focus();
	    				return false;
	    			} else {
	    				var regex = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
	    				if (!regex.test($("#email2").val())){
	    					alert('잘못된 이메일 형식입니다.');
	    					$("#email2").focus();
	    					return false;
	    				}
	    			}
	    			if (idflag == false) {
	    				alert("아이디 중복확인을 해주세요.");
	    				$("#idChkBtn").focus();
	    				return false;
	    			}
	    		});
	    	});
	    </script>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<nav class="navbar navbar-inverse">	
				    <div class="navbar-header">
				      <a class="navbar-brand" href="../loginForm.jsp">홈 그라운드</a>
				    </div>
				</nav>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">회원가입하기</h3>
					</div>
					<div class="panel-body">
					<div class="col-md-8 col-md-offset-2">
						<form action="adduser.jsp" method="post">
							<table id='jointb' class="table table-condensed" >
								<colgroup>
									<col width="25%" />
									<col width="*" />
								</colgroup>
								<tr>
									<th>아이디</th>
									<td>
										<input type='text' name='addid' id='addid' maxlength="10" />
										<input type="button" id="idChkBtn" name="idChkBtn" value="중복확인" class="btn btn-primary" />
										<span id='warn1' style='color: red;font-size:12px;'></span>
										<span id='warn1_2' style='color: blue;font-size:12px;'></span>
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>
										<input type='password' name='addpw1' id='addpw1' maxlength="10" />
										<span id='warn2' style='color: red;font-size:12px;'></span>
									</td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td>
										<input type='password' name='addpw2' id='addpw2' maxlength="10" />
										<span id='warn3' style='color: red;font-size:12px;'></span>
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type='text' name='addname' id='addname' maxlength="10" /></td>
								</tr>
								<tr>
									<th>지역</th>
									<td>
										<select id='addarea' name='addarea'>
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
									<th>나이</th>
									<td><input type='text' name='addage' id='addage' maxlength="2" size='5' class='onlyNum' /></td>
								</tr>
								<tr>
									<th>포지션</th>
									<td>
										<select id='addposition' name='addposition'>
											<option value='투수'>투수</option>
											<option value='포수'>포수</option>
											<option value='1루수'>1루수</option>
											<option value='2루수'>2루수</option>
											<option value='3루수'>3루수</option>
											<option value='유격수'>유격수</option>
											<option value='좌익수'>좌익수</option>
											<option value='중견수'>중견수</option>
											<option value='우익수'>우익수</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>핸드폰</th>
									<td>
										<select id='phone1' name='phone1'>
											<option value='010'>010</option>
											<option value='011'>011</option>
											<option value='016'>016</option>
											<option value='019'>019</option>
										</select>-
										<input type='text' name='phone2' id='phone2' maxlength="4" size="5" class='onlyNum'  />-
										<input type='text' name='phone3' id='phone3' maxlength="4" size="5" class='onlyNum'  />
									</td>
								</tr>
				
								<tr>
									<th>이메일</th>
									<td>
										<input type='text' name='email1' id='email1' maxlength="10" size="11" /> @
										<input type='text' name='email2' id='email2' maxlength="20" size="11" readonly="readonly" />
										<select id='selectemail' name='selectemail'>
											<option value=''>선택</option>
											<option value='naver.com'>naver.com</option>
											<option value='gmail.com'>gmail.com</option>
											<option value='hanmail.net'>hanmail.net</option>
											<option value='nate.com'>nate.com</option>
											<option value='write'>직접입력</option>
										</select>
									</td>
								</tr>
							</table>
							<p style='text-align: right; width: 600px;'>
								<input type='submit' value='회원가입' class="btn btn-primary" />
								<input type='button' value='취소' id='cancle' class="btn btn-primary" />
							</p>
						</form>
						
					</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
