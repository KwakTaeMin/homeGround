<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="notice.N_C_DAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="follow.FollowVO"%>
<%@page import="follow.FollowDAO"%>
<%@page import="result.ResultVO"%>
<%@page import="result.ResultDAO"%>
<%@page import="notice.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="notice.NoticeDAO"%>
<%@page import="team.TeamVO"%>
<%@page import="member.MemberVO"%>
<%@page import="team.TeamDAO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
//select=failed&keyword=????????
	String select = request.getParameter("select");
	String keyword = "  ";
	System.out.println(select + " " + keyword);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> HomeGround :: MainPage </title>
<style type="text/css">
h3 {position: relative;}
h3 span {position: absolute; right: 0; font-size:15px;}
</style>

<link rel="stylesheet" type="text/css" href="css/style.css" media="all" />
<link rel= "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
<link rel ="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script >
<script src= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script >
<script type="text/javascript">
	
	$(function(){
		$("td:first-child").css("font-weight","bold");
		
		if ("failed" == "<%=select%>") {
			alert("검색하신 팀이 존재하지 않습니다.");
		}
	})
		
	
	function logout() {		
		location.href="logout.jsp";		
	}	

</script>

<%
	MemberDAO 	memberDao	 		= 	new MemberDAO();
	TeamDAO   	teamDao 			= 	new TeamDAO();
	NoticeDAO 	noticeDao			= 	new NoticeDAO();
	ResultDAO	resultDao			= 	new ResultDAO();
	BoardDAO 	boardDao			= 	new BoardDAO();
	FollowDAO	followDao 			= 	new FollowDAO();
	N_C_DAO		noticeCommentDao	=	new N_C_DAO();
	
	String memId				=   (String)session.getAttribute("memId");
	int	   teamNo				= 	(Integer)session.getAttribute("teamNo");
	int    memNo				=	(Integer)session.getAttribute("memNo");
	//userVo.getTeamNo()
	MemberVO 	userVo			= 	memberDao.getMemberInfoById(memId);
	TeamVO 		userTeamVo 		= 	teamDao.getTeamByNo(userVo.getTeamNo());

	String					userName		= 	userVo.getName();
	String 					coachName 		= 	teamDao.getTeamCoachName(userTeamVo.getCoachNo());
	int 					teamCount		= 	memberDao.getAllMemberCountByTeamNo(teamNo);
	HashMap<String, Object> resultCount = resultDao.getCountByTeamNo(teamNo);
	
	int winCnt = (Integer)resultCount.get("winCnt");
	int loseCnt = (Integer)resultCount.get("loseCnt");
	int tieCnt = (Integer)resultCount.get("tieCnt");
	
	FollowVO	teamFollowVo;
	int			follower		= 	0;
	int			following		=	0;
	
	if(followDao.getFollowerNumAndFollowingNum(teamNo) != null){
		teamFollowVo = followDao.getFollowerNumAndFollowingNum(teamNo);
		follower	 = teamFollowVo.getFollower();
		following	 = teamFollowVo.getFollowing();
	}
	
	System.out.println(teamNo);

	HashMap<String, Object> range = new HashMap<String, Object>();
	range.put("startNo", 1);
	range.put("endNo", 5);
	range.put("teamNo", teamNo);
	
	
	List<BoardVO>  followBoardList	= (List)followDao.getFollowBoardList(teamNo);	
	List<BoardVO>  boardList		= (List)boardDao.getBoardRange(range);
	List<NoticeVO> noticeList 		= (List)noticeDao.getNoticeRange(range);
	List<ResultVO> resultList 		= (List)resultDao.getResultByRange(1, 5, teamNo);
	
%>


</head>
<body>

<!-- 팀정보  -->

<div class="container">

	<!-- 네비게이션 -->
	<nav class="navbar navbar-inverse">	
	    <div class="navbar-header">
	      <a class="navbar-brand" href="mainPage.jsp">홈 그라운드</a>
	    </div>
	    <div>
	      <ul class="nav navbar-nav ">
	        <li class="active"><a href="#"> 팀명 :<strong><%=userTeamVo.getName() %></strong></a></li>			        
	      </ul>
	      <p class="navbar-text"><strong><%=userName %></strong>님 안녕하세요. 환영합니다.</p>
	     
	      <button type="button" class="btn btn-danger navbar-btn" onclick="logout()">로그아웃</button>
	      	
	      <form class="navbar-form navbar-left" role="search" method="post" action="otherTeamPage.jsp">
	        <div class="form-group">
	          <input type="text" class="form-control" name="searchTeamName" placeholder="팀명을 검색하세요" >
	        </div>
	        <button type="submit" class="btn btn-default">검색</button>
	      </form>
	      
	      	
	   </div>
	</nav>
	

	<div class="row">	
			
		<div class="col-md-4">
			<hr/>
<%
	if (userTeamVo.getPhoto() == null) {
%>			
			<img src="register/uploadImage/noImg.jpg" class="img-rounded" alt="Main Team Image" width="300" height="300" >
<%
	} else {
%>
			<img src="register/uploadImage/<%=userTeamVo.getPhoto() %>" class="img-rounded" alt="Main Team Image" width="300" height="300">
<%
	}
%> 
			
		</div>
		<div class="col-md-8">
			<h3>팀정보</h3>
				<table class="table">
				    <thead>
				      <tr>
				        <th class="col-md-3">감독명</th><td><kbd>감독</kbd> <mark><%=coachName %></mark></td>
				      </tr>
				      <tr>
				        <th>인원수</th><td><%=teamCount %>명</td>
				      </tr>
				      <tr>
				        <th>전적</th><td><%=winCnt %>승 <%=loseCnt %>패 <%=tieCnt %>무</td>
				      </tr>
				      <tr>
				        <th>지역</th><td><%=userTeamVo.getArea() %></td>
				      </tr>
				      <tr>
				        <th>창단일</th><td><%=userTeamVo.getStrDate()%></td>
				      </tr>
				      <tr>
				        <th>팀소개</th><td class="last"><%=userTeamVo.getIntroduce() %></td>
				      </tr>
				    </thead>
				</table>
				
								
			
			<div class="btn-group btn-group-justified">
				<a href="teamMemberList.jsp?teamNo=<%=teamNo %>" class="btn btn-default"> 인원 보기 </a>
				<a href="followerList.jsp?teamNo=<%=teamNo %>" class="btn btn-default"> 팔로워 : <%=follower %> </a>
				<a href="followingList.jsp?teamNo=<%=teamNo %>" class="btn btn-default"> 팔로잉 : <%=following %> </a> 
<%
	if (userTeamVo.getCoachNo() == memNo) {
%>				
				<a href="register/modifyTeamProfileForm.jsp" class="btn btn-primary"> 프로필 수정 </a> <!-- 상대팀에 왔을때는 팔로잉 하기! -->
<%
	}
%>
			</div>
		</div>			
	</div>
	
	<hr/>
	
	<div class="row">
		<div class="col-md-6">
			<h3>공지 사항<span><a href="notice/noticeList.jsp?teamNo=<%=teamNo %>&pno=1">더보기</a></span></h3>			
			<table class="table table-hover">
				<thead>
					<tr>
						<th>공지 번호  </th>
						<th>제목  </th>
						<th>작성자  </th>
						<th>날짜  </th>	
					</tr>				
				</thead>
				<tbody>
				<% for (int i=0; i<noticeList.size(); i++) { %>
				<% int commentCnt = noticeCommentDao.commentCount(noticeList.get(i).getNo() ,teamNo ); %>
					<tr>
						<td><span class="label label-danger">공지</span> <%=noticeList.get(i).getNo() %></td>
						<td><a href="notice/noticeDetail.jsp?no=<%=noticeList.get(i).getNo() %>&pno=1&teamNo=<%=teamNo %>" ><%=noticeList.get(i).getTitle() %> <% if(commentCnt != 0){ %> [<%=commentCnt %>] <%} %></a></td>
						<td>감 독</td>
						<td><%=noticeList.get(i).getStrDate() %></td>
					</tr>
				<%} %>
				</tbody>
			</table>
		</div>
		
		<div class="col-md-6">
			<h3>경기 결과<span><a href="matchResult/resultList.jsp?teamNo=<%=teamNo %>">더보기</a></span></h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>경기 글 번호  </th>
						<th>제목  </th>
						<th>날짜  </th>	
					</tr>				
				</thead>
				<tbody>
				<% for (int i=0; i<resultList.size(); i++) { 
				
					String myTeam 	  = resultDao.getTeamNameByNo(resultList.get(i).getMyTeamNo());
					String rivaleTeam = resultDao.getTeamNameByNo(resultList.get(i).getRivalTeamNo());
					
				%>
				
					<tr>
						<td><span class="label label-warning">경기결과</span> <%=resultList.get(i).getGameNo() %></td>
						<td><a href="matchResult/resultDetail.jsp?pno=1&no=<%=resultList.get(i).getGameNo() %>&teamNo=<%=teamNo %>" ><%=myTeam %> <%=resultList.get(i).getMyRuns() %> vs 
							<%=resultList.get(i).getRivalRuns() %> <%=rivaleTeam %></a> </td>
						<td><%=resultList.get(i).getStrDate() %></td>
					</tr>
				<%} %>				
				</tbody>
			</table>
		</div>
		
		<div class="row">
		<div class="col-md-6">
			<h3>자유 게시판<span><a href="board/boardList.jsp?teamNo=<%=teamNo %>">더보기</a></span></h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>게시판 번호  </th>
						<th>제목  </th>
						<th>작성자  </th>
						<th>날짜  </th>	
					</tr>				
				</thead>
				<tbody>
				<% for (int i=0; i<boardList.size(); i++) { %>
					<tr>
						<td><span class="label label-primary">자게</span> <%=boardList.get(i).getNo() %></td>
						<td><a href="board/boardDetail.jsp?no=<%=boardList.get(i).getNo() %>&teamNo=<%=teamNo %>"><%=boardList.get(i).getTitle() %></a></td>
						<td><%=boardList.get(i).getMemberName() %></td>
						<td><%=boardList.get(i).getStrRegdate() %></td>
					</tr>
				<%} %>
				</tbody>
			</table>
		</div>
		
		<div class="col-md-6">
			<h3>팔로우 게시판<span><a href="#">더보기</a></span></h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>팔로우 글 번호  </th>
						<th>제목  </th>
						<th>작성자  </th>
						<th>날짜  </th>	
					</tr>				
				</thead>
				<tbody>
				<% for (int i=0; i<followBoardList.size(); i++) { %>
					<tr>
						<% String name = memberDao.getMemberNameByMemberNo(followBoardList.get(i).getMember()); %>
						<td><span class="label label-success">팔로글</span> <%=followBoardList.get(i).getNo() %></td>
						<td><%=followBoardList.get(i).getTitle() %> </td>
						<td><%=name %> </td>
						<td><%=followBoardList.get(i).getStrRegdate() %></td>
					</tr>
				<%} %>				
				</tbody>
			</table>
		</div>
		
	</div>
	
	<hr/>
	
</div>





</body>
</html>