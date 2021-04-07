<%@ page  contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");

String id2 = (String)session.getAttribute("id");
		%>
<!--메인 배너-->
<script>
function dismenu() {
	var e = document.getElementById("menutable");
	if(e.style.display=='none'){
		e.style.display='block';
	}else{
		e.style.display='none';
	}
}
</script>
<form method="post" action="searchList.jsp">
<div id="mainbanner">


<input type="button" class="naver" onclick="location.href='naverin_main.jsp' ">
<input type="button" class="in" onclick="location.href='naverin_main.jsp' ">
<input type="text" class="text"  name="searchKey" autocomplete="off">
<input type="submit" class="search"  value="">



<span id="loginset">
<%if(id2==null){ %>
<button type="button" class="login" onclick="location.href='../member/login.jsp?returnPage=../in/naverin_main.jsp' ">로그인</button>
<%} else{%>
<span id="loginon"><font color="#40c700"><%=id2 %></font> 님 반갑습니다.</span>
<button type="button" id="call"></button>
<button type="button" class="menubar" onclick="dismenu()"></button>
<button type="button" id="logoutbtn" onclick="location.href='logout.jsp'">로그아웃</button>
<%} %>
</span>
</div>
</form>


<hr style="margin-top: 20px;margin-bottom:0px;">
<!--메뉴바 -->
<div>
<table class="submenubar">
	<tr>
		<td class="td" align="center" width="20px" onclick="location.href='naverin_main.jsp'">홈</td>
		<td class="td" align="center" width="40px" onclick="alert('구현되지 않았습니다.')">Q&A</td>
		<td class="td" align="center" width="70px" onclick="alert('구현되지 않았습니다.')">답변하기</td>
		<td class="td" align="center" width="50px" onclick="alert('구현되지 않았습니다.')">베스트</td>
		<td class="td" align="center" width="90px" onclick="location.href='bestMember.jsp'">명예의 전당</td>
		<td class="td" style="border-left: 1px solid #cccccc;width: 1px;"></td>
		<td class="td" align="center" width="50px" onclick="location.href='profile.jsp'">프로필</td>
		<td class="td" id="subtd1" width="500px" style="display: table-cell;"  onclick="alert('구현되지 않았습니다.')"></td>
		<td id="tdbtn" align="right" width="100px" style="padding-right:30px;
		background-color:#40c700;color:white;cursor:pointer;"
		onclick="location.href='naver_question.jsp'">
		<button id="write"></button>질문하기</td>
	</tr>
</table>
</div>

