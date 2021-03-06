<%@page import="java.util.List"%>
<%@page import="team.TeamVO"%>
<%@page import="member.MemberVO"%>
<%@page import="team.TeamDAO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> HomeGround :: 인원보기</title>

<link rel= "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
<link rel ="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script >
<script src= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script >
<script type="text/javascript">

	
	$(function(){
		var arr = new Array();
		
		$("#memberList span").each(function(){
			arr.push($(this).text());
	
		});
		
		console.log(arr);
		
		for(var i=0; i<arr.length; i++){
			if(arr[i]=="투수"){
				
				//$("span[id='position']").attr("class", "label label-primary"); 
			}			
		}
	});
		
	
	
</script>
<%
	int teamNo = Integer.parseInt( request.getParameter("teamNo") );

	MemberDAO 	memberDao	 	= 	new MemberDAO();
	TeamDAO   	teamDao 		= 	new TeamDAO();

	String memId				=   (String)session.getAttribute("memId");

	MemberVO 	userVo			= 	memberDao.getMemberInfoById(memId);
	TeamVO 		userTeamVo 		= 	teamDao.getTeamByNo(teamNo);

	String		userName		= 	userVo.getName();
	
	List<MemberVO> memberList	= 	memberDao.getMemberListByTeamNo(teamNo);
	
%>

</head>
<body>

<div class="container">

	<!-- 네비게이션 -->
	<nav class="navbar navbar-inverse">	
	    <div class="navbar-header">
	      <a class="navbar-brand" href="mainPage.jsp">홈 그라운드</a>
	    </div>
	    <div>
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
	      
	      	
	   </div>
	</nav>
	<hr/>
	<h2>인원 정보</h2>
	<hr/>
	<div class="row">
		<% for (int i=0; i<memberList.size(); i++) { %>	
		<div class="col-md-6" id="memberList">
			<h4><%=memberList.get(i).getName() %> <span class="label label-warning"><%=memberList.get(i).getPosition()%></span> </h4>				
			<table class="table table-hover">								
					<tr>
						<th>나이  </th><td><%=memberList.get(i).getAge() %></td><th>지역  </th><td><%=memberList.get(i).getArea() %></td>
					</tr>				
					<tr>
						<th>핸드폰  </th><td><%=memberList.get(i).getPhone() %></td><th>이메일  </th><td><%=memberList.get(i).getEmail() %></td>	
					</tr>				
					<tr>
						<th>가입날짜  </th>	<td><%=memberList.get(i).getStrDate() %></td><th>포지션  </th><td><%=memberList.get(i).getPosition()%></td>	
					</tr>							
			</table>			
		</div>
		<%} %>
	</div>
	<hr/>
	
	
</div>

</body>
</html>