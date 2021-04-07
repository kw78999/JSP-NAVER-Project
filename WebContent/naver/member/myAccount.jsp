<%@ page contentType="text/html; charset=UTF-8"%>

<%
		request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/css/style.css">
</head>
<body>
	<div id="root-account">
	
		<div id="topBar-account">
			<div class="account-navbar-left">
				<a href="../chu/index.jsp" style="width: 81px; height: 26px; margin-left: 18%;">
					<img src="./resources/img/logo-md.png" alt="img">
				</a> 
			</div>
			<div class="account-navbar-right">
			</div> 
		</div>
		<div class="account-wrap">
			<div class="account-card">
				<div style="height:10%;">내 정보</div>
				<div style="height:80%;"></div>
				<div style="height:10%; display: flex; justify-content: flex-end; margin-right: 20px;">
					<a href="update.jsp">수정</a>
				</div>
			</div>
			<div class="account-card" style="background: #e8e8e8;">
				<svg style="width:100%; height:100%;">
					<line x1="0" y1="0" x2="450" y2="300" stroke-width="5" stroke="#8e8e8e" />
					준비중...
				</svg>
			</div>
			<div class="account-card" style="background: #e8e8e8;">
				<svg style="width:100%; height:100%;">
					<line x1="0" y1="0" x2="450" y2="300" stroke-width="5" stroke="#8e8e8e" />
					준비중...
				</svg>
			</div><div class="account-card" style="background: #e8e8e8;">
				<svg style="width:100%; height:100%;">
					<line x1="0" y1="0" x2="450" y2="300" stroke-width="5" stroke="#8e8e8e" />
					준비중...
				</svg>
			</div>
		</div>
		<div class="account-bottom">
			<span>네이버를 이용하지 않으신다면 <a href="memberOut.jsp">회원탈퇴 바로가기</a></span>
		</div>
	</div>
</body>
</html>