<%@page import="result.*, member.*, team.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO 	memberDao	 	= 	new MemberDAO();
	TeamDAO   	teamDao 		= 	new TeamDAO();
try {	
	String now_memId = (String)session.getAttribute("memId");
	int now_memNo = (Integer)session.getAttribute("memNo");
	
	//userVo.getTeamNo()
	MemberVO userVo = memberDao.getMemberInfoById(now_memId);
	String userName = userVo.getName();
%>
<!-- 네비게이션 -->
		<nav class="navbar navbar-inverse">	
		    <div class="navbar-header">
		      <a class="navbar-brand" href="selectOrCreateTeam.jsp">홈 그라운드</a>
		    </div>
		      <p class="navbar-text"><strong><%=userName %></strong>님 안녕하세요. 환영합니다.</p>
		     
		      <ul class="nav navbar-nav navbar-right">
		      	<button type="button" class="btn btn-danger navbar-btn" style="margin-right: 30px;" onclick="location.href='../logout.jsp'">로그아웃</button>
		      </ul>
		</nav>
<%
} catch (NullPointerException e) {
	response.sendRedirect("../loginForm.jsp");
}
%>	