<%@ page contentType="text/html; charset=UTF-8"%>

<%
		request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/css/style.css?v13">
</head>
<body>
	
		<div id="loginArea">
		<div style="height:150px"></div>			
					<div class="top">
						<img onclick="location.href='../in/naverin_main.jsp'"alt=""
						 src="./resources/img/logo-lg.png" style="width: 100%;" class="naverimg">
					
			</div>
				<form action="loginProc.jsp">
					<div class="loginBox">
						<input type="text" name="id" value="guest"placeholder="아이디" class="logInput" autocomplete="off">
					</div>
					<div class="loginBox">
						<input type="password" name="pwd"value="guest" placeholder="비밀번호" class="logInput">
					</div>
					<div class="loginBox">
						<input type="submit" value="로그인" class="logInBtn">
					</div>
				</form>
			<div class="low">
				<div class="textBtn"><a href="find_id.jsp">아이디 찾기</a></div>
				<div class="textBtn"><a href="find_pwd.jsp">비밀번호 찾기</a></div>
				<div class="textBtn"><a href="member.jsp">회원가입</a></div>
			</div>
		</div>
		
</body>
</html>