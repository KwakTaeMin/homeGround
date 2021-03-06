<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="notice.N_C_DAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="follow.FollowVO"%>
<%@page import="follow.FollowDAO"%>
<%@page import="result.ResultVO"%>
<%@page import="notice.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="team.TeamVO"%>
<%@page import="member.MemberVO"%>
<%@page import="result.ResultDAO"%>
<%@page import="notice.NoticeDAO"%>
<%@page import="member.MemberDAO"%>
<%@page import="team.TeamDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	request.setCharacterEncoding("utf-8");
	
	
	String userName 	 = (String)session.getAttribute("memName");
	int    userTeamNo 	 = (Integer)session.getAttribute("teamNo");
	
	String otherTeamName = request.getParameter("searchTeamName");
	
	System.out.println("우리팀 번호 : " +userTeamNo);
	
	TeamDAO 	TeamDao 			=	new TeamDAO();	
	MemberDAO 	memberDao	 		= 	new MemberDAO();
	NoticeDAO 	noticeDao			= 	new NoticeDAO();
	ResultDAO	resultDao			= 	new ResultDAO();
	FollowDAO	followDao 			= 	new FollowDAO();
	N_C_DAO		noticeCommentDao	=	new N_C_DAO();
	BoardDAO 	boardDao			= 	new BoardDAO();

	
	if ( TeamDao.getTeamsNoByName(otherTeamName).size() == 0 ){
		response.setCharacterEncoding("utf-8");
		response.sendRedirect("mainPage.jsp?select=failed");
		return;
	}
	
	int otherTeamNo	= (Integer)TeamDao.getTeamNoByName(otherTeamName);
	
	if (otherTeamNo == userTeamNo) {
		response.sendRedirect("mainPage.jsp");
		return;
	}
	
	
	System.out.println("상대팀 번호 : " +otherTeamNo);
	
	TeamVO 		otherTeamVo		= 	TeamDao.getTeamByNo(otherTeamNo);
		
	FollowVO	otherTeamFollowVo;
	int			follower		= 	0;
	int			following		=	0;
	if ( followDao.getFollowerNumAndFollowingNum(otherTeamNo) != null) {
		otherTeamFollowVo = followDao.getFollowerNumAndFollowingNum(otherTeamNo);
		follower		= 	otherTeamFollowVo.getFollower();
		following		=	otherTeamFollowVo.getFollowing();		
	} else {
		otherTeamFollowVo = new FollowVO();
	}
	
	otherTeamFollowVo.setMyTeamNo(userTeamNo);
	otherTeamFollowVo.setFollowingTeamNo(otherTeamNo);
	
	String 		otherCoachName	= 	TeamDao.getTeamCoachName(otherTeamVo.getCoachNo());
	int 		otherTeamCount	= 	memberDao.getAllMemberCountByTeamNo(otherTeamNo);
	HashMap<String, Object> resultCount = resultDao.getCountByTeamNo(otherTeamNo);
	
	int winCnt = (Integer)resultCount.get("winCnt");
	int loseCnt = (Integer)resultCount.get("loseCnt");
	int tieCnt = (Integer)resultCount.get("tieCnt");
	
	boolean		isFollowing		= 	false;
	
	if ( followDao.getConfirmFollowing(otherTeamFollowVo) != null ){
		isFollowing = true;
	}
	
	HashMap<String, Object> range = new HashMap<String, Object>();
	range.put("startNo", 1);
	range.put("endNo", 5);
	range.put("teamNo", otherTeamNo);

	List<BoardVO>  followBoardList	= (List)followDao.getFollowBoardList(otherTeamNo);	
	List<BoardVO>  boardList	= (List)boardDao.getBoardRange(range);
	List<NoticeVO> otherNoticeList 	= (List)noticeDao.getNoticeRange(range);
	List<ResultVO> otherResultList 	= (List)resultDao.getResultByRange(1, 5, otherTeamNo); 
		
	
%>
<link rel="stylesheet" type="text/css" href="css/style.css" media="all" />
<link rel= "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
<link rel ="stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script >
<script src= "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script >
<title> HomeGround :: <%=otherTeamName %> TeamPage</title>

<script type="text/javascript">

	$(function(){
		
		$("td:first-child").css("font-weight","bold");
		
		<% if (!isFollowing) {%>
			
			$("#followCancle").hide();
		
		<%}else { %>
			
			$("#follow").hide();
		
		<%}%>
	});
	
	function logout() {		
		location.href="logout.jsp";		
	}	
	
	function following(followingTeamNo,myTeamNo) {
		$.ajax({
			type:"GET",
			url:"follow",
			data:{otherTeamNo:followingTeamNo,ourTeamNo:myTeamNo},
			dataType:"json",
			success:function(result) {
				
				$("#follow").hide();
				$("#followCancle").show();
				
				$("#followerNum").html("팔로워 : " + result.follower);
				$("#followingNum").html("팔로잉 : " + result.following);
				
			}
		}); 		
	}
	
	function followingCencle(followingTeamNo,myTeamNo) {
		$.ajax({
			type:"GET",
			url:"followCancle",
			data:{otherTeamNo:followingTeamNo,ourTeamNo:myTeamNo},
			dataType:"json",
			success:function(result) {
				
				$("#follow").show();
				$("#followCancle").hide();
				
				$("#followerNum").html("팔로워 : " + result.follower);
				$("#followingNum").html("팔로잉 : " + result.following);
				
			}
		}); 		
	}
	
	
	
	
</script>

<style type="text/css">
h3 {position: relative;}
h3 span {position: absolute; right: 0; font-size:15px;}
</style>

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
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="#"> 팀명 :<strong><%=otherTeamVo.getName() %></strong></a></li>			        
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
	

	<div class="row">	
		
		<div class="col-md-4">
			<hr/>	
<%
	if (otherTeamVo.getPhoto() == null) {
%>
			<img src="register/uploadImage/noImg.jpg" class="img-rounded" alt="Main Team Image" width="300" height="300">
<%
	} else {
%>
			<img src="register/uploadImage/<%=otherTeamVo.getPhoto() %>" class="img-rounded" alt="Main Team Image" width="300" height="300">
<%
	}
%>						
		</div>
		<div class="col-md-8">
			<h3>팀정보</h3>
			
				<table class="table">
				    <thead>
				      <tr>
				        <th class="col-md-3">감독명</th><td><kbd>감독</kbd> <mark><%=otherCoachName %></mark></td>
				      </tr>
				      <tr>
				        <th>인원수</th><td><%=otherTeamCount %>명</td>
				      </tr>
				      <tr>
				        <th>전적</th><td><%=winCnt %>승 <%=loseCnt %>패 <%=tieCnt %>무</td>
				      </tr>
				      <tr>
				        <th>지역</th><td><%=otherTeamVo.getArea() %></td>
				      </tr>
				      <tr>
				        <th>창단일</th><td><%=otherTeamVo.getStrDate()%></td>
				      </tr>
				      <tr>
				        <th>팀소개</th><td class="last"><%=otherTeamVo.getIntroduce() %></td>
				      </tr>
				    </thead>
				</table>
			
			<div class="btn-group btn-group-justified">
				<a href="teamMemberList.jsp?teamNo=<%=otherTeamNo %>" class="btn btn-default"> 인원 보기 </a>
				<a href="followerList.jsp?teamNo=<%=otherTeamNo %>" class="btn btn-default" id="followerNum"> 팔로워 : <%=follower %> </a>
				<a href="followingList.jsp?teamNo=<%=otherTeamNo %>" class="btn btn-default" id="followingNum"> 팔로잉 : <%=following %></a> 
				
				<a href="#" id="follow" class="btn btn-success" onclick="following(<%=otherTeamNo%>,<%=userTeamNo %>)" > 팔로우 하기 </a> <!-- 상대팀에 왔을때는 팔로잉 하기! -->
				<a href="#" id="followCancle" class="btn btn-danger" onclick="followingCencle(<%=otherTeamNo%>,<%=userTeamNo %>)"> 팔로우 취소 </a> <!-- 상대팀에 왔을때는 팔로잉 하기! -->
					
			</div>
		</div>			
	</div>

	<hr/>
	
	<div class="row">
		<div class="col-md-6">
			<h3>공지 사항<span><a href="notice/noticeList.jsp?teamNo=<%=otherTeamNo %>">더보기</a></span></h3>			
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
				<% for (int i=0; i<otherNoticeList.size(); i++) { %>
				<% int commentCnt = noticeCommentDao.commentCount(otherNoticeList.get(i).getNo() ,otherTeamNo ); %>
					<tr>
						<td><span class="label label-danger">공지</span> <%=otherNoticeList.get(i).getNo() %></td>
						<td><a href="notice/noticeDetail.jsp?no=<%=otherNoticeList.get(i).getNo() %>&pno=1&teamNo=<%=otherTeamNo %>" ><%=otherNoticeList.get(i).getTitle()%> <% if(commentCnt != 0){ %> [<%=commentCnt %>] <%} %></a></td>
						<td>감 독</td>
						<td><%=otherNoticeList.get(i).getStrDate() %></td>
					</tr>
				<%} %>
				</tbody>
			</table>
		</div>
		
		<div class="col-md-6">
			<h3>경기 결과<span><a href="matchResult/resultList.jsp?teamNo=<%=otherTeamNo %>">더보기</a></span></h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>경기 글 번호  </th>
						<th>제목  </th>
						<th>날짜  </th>	
					</tr>				
				</thead>
				<tbody>
				<% for (int i=0; i<otherResultList.size(); i++) { 
					
					String myTeam 	  = resultDao.getTeamNameByNo(otherResultList.get(i).getMyTeamNo());
					String rivalTeam = resultDao.getTeamNameByNo(otherResultList.get(i).getRivalTeamNo());
				
				%>
					<tr>
						<td><span class="label label-warning">경기결과</span> <%=otherResultList.get(i).getGameNo() %></td>
						<td><a href="matchResult/resultDetail.jsp?pno=1&no=<%=otherResultList.get(i).getGameNo() %>&teamNo=<%=otherTeamNo %>" ><%=myTeam %> <%=otherResultList.get(i).getMyRuns() %> vs 
							<%=otherResultList.get(i).getRivalRuns() %> <%=rivalTeam %></a> </td>
						<td><%=otherResultList.get(i).getStrDate() %></td>
					</tr>
				<%} %>				
				</tbody>
			</table>
		</div>
		
		<div class="row">
		<div class="col-md-6">
			<h3>자유 게시판<span><a href="board/boardList.jsp?teamNo=<%=otherTeamNo %>">더보기</a></span></h3>
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
						<td><a href="board/boardDetail.jsp?no=<%=boardList.get(i).getNo() %>&teamNo=<%=otherTeamNo %>"><%=boardList.get(i).getTitle() %></a></td>
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