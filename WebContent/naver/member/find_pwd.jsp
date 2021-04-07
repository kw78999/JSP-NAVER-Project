<%@ page contentType="text/html; charset=UTF-8"%>

<%
		request.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/css/style.css">
</head>
<body>
	<div id="root-find">
	
		<div id="topBar-find">
			<div class="find-navbar-left">
				<a href="../in/naverin_main.jsp" style="width: 81px; height: 26px; margin-left: 5%;">
					<img src="./resources/img/logo-md.png" alt="img">
				</a> 
				<div style="width: 130px; margin-left: 20px;">
					<input type="button" onclick="location.href='find_id.jsp'" class="textBtn" value="아이디 찾기">
				</div>
				<div style="width: 130px; color: white; font-weight: 900;">
					<input type="button" class="textBtn" value="비밀번호 찾기" style="color: white; font-weight: 900;">
				</div>
			</div>
			<div class="account-navbar-right">
			</div> 
		</div>
		<div class="find-wrap">
			<form name="checkFrm" action="find_pwdProc.jsp" method="post">
				<div style="height:10%; margin-left: 20px; margin-top: 50px; margin-bottom: 10px;">
					<span style="font-weight: 900;">
						아이디와 이름, 휴대전화번호로 비밀번호 찾기
					</span>
				</div>
				<div style="height:80%; margin-left: 20px;">
					<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
						<input type="text" name="id" placeholder="아이디" style="width: 450px; height: 50px; margin-bottom: 10px;">
						<input type="text" name="name" placeholder="이름" style="width: 450px; height: 50px; margin-bottom: 10px;">						
						<input type="text" name="phone" placeholder="휴대전화" style="width: 450px; height: 50px;">						
					</div>
				</div>
				<div style="height:10%; display: flex; justify-content: flex-end; margin-left: 20px;">
					<input type="button" onclick="check()"class="submitBtn" value="비밀번호 찾기">
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	function check() {
		msg = "비밀번호를 찾습니다"
		flag = true;
		frm = document.checkFrm;
		id = frm.id.value;
		name = frm.name.value;
		phone = frm.phone.value;
		if(id.trim()==""){
			msg = "아이디를 입력하세요";
			flag = false;
		}else if(name.trim()==""){
			msg = "이름을 입력하세요";
			flag = false;
		} else if(phone.trim()==""){
			msg = "휴대전화번호를 입력하세요";
			flag = false;
		}
		alert(msg);
		if(flag==true)
			frm.submit();
	}
</script>
</html>