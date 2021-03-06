<%@page import="java.util.ArrayList"%>
<%@page import="follow.FollowVO"%>
<%@page import="java.util.List"%>
<%@page import="follow.FollowDAO"%>
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
<title> HomeGround :: TeamMemberList</title>
 
<link rel= "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
<link rel ="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script >
<script src= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script >
 
<%
	int teamNo = Integer.parseInt( request.getParameter("teamNo") );
 
	MemberDAO 	memberDao	 	= 	new MemberDAO();
	TeamDAO   	teamDao 		= 	new TeamDAO();
	FollowDAO 	followDao		=	new FollowDAO();	
 
	String memId				=   (String)session.getAttribute("memId");
 
	MemberVO 	userVo			= 	memberDao.getMemberInfoById(memId);
	TeamVO 		userTeamVo 		= 	teamDao.getTeamByNo(userVo.getTeamNo());
	
 	List<FollowVO> followerList = 	followDao.getFollowerList(teamNo);
	
 	System.out.println(followerList);
 	
 	List<TeamVO> followerTeamList = new ArrayList<>();
 	
 	for(FollowVO f : followerList){ 		
	 	followerTeamList.add( (TeamVO)teamDao.getTeamByNo(f.getFollowingTeamNo()) );
 	}	
	
	String		userName		= 	userVo.getName();
	
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
	<h2>팔로워 팀 정보</h2>
	<hr/>
	<div class="row">
		<% for (int i=0; i<followerTeamList.size(); i++) { %>	
		
		<div class="col-md-12" id="memberList">
			<h4><a href="otherTeamPage.jsp?searchTeamName=<%=followerTeamList.get(i).getName()%>"><%=followerTeamList.get(i).getName() %></a> <span class="label label-warning"><%=followerTeamList.get(i).getStrDate()%></span> </h4>				
			<table class="table table-hover">
				<!-- String 		otherCoachName	= 	TeamDao.getTeamCoachName(otherTeamVo.getCoachNo()); -->
					<tr>
						 <td rowspan="5" class="col-md-2">
<%
	if (followerTeamList.get(i).getPhoto() == null) {
%>						 
						 	<img src="register/uploadImage/noImg.jpg" class="img-rounded" alt="Main Team Image" width="120" height="120">
<%
	} else { 
%>
						 	<img src="register/uploadImage/<%=followerTeamList.get(i).getPhoto() %>" class="img-rounded" alt="Main Team Image" width="120" height="120">
<%
	}
%>
						 </td>
						 <th class="col-md-1">감독이름</th><td> <%=teamDao.getTeamCoachName( followerTeamList.get(i).getCoachNo() ) %></td>
					</tr>
					<tr>
						 <th>인원수</th><td> <%=memberDao.getAllMemberCountByTeamNo(followerTeamList.get(i).getNo()) %>명</td>
					</tr>
					<tr>
						 <th>지역</th><td> <%=followerTeamList.get(i).getArea() %></td>
					</tr>
					<tr>
						 <th>소개</th><td><%=followerTeamList.get(i).getIntroduce() %></td>
					</tr>
																
			</table>			
		</div>
		<%} %>
	</div>
	<hr/>
	
</div>
</body>
</html>
	