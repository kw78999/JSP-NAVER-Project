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
		<div class="out-wrap">
			<form name="checkFrm" action="memberOutProc.jsp" method="post">
				<div style="height:10%; margin-left: 20px; margin-top: 50px; margin-bottom: 10px;">
					<span style="font-weight: 900;">
						사용중인 아이디 <%=id %>를 네이버 서비스에서 탈퇴합니다.
					</span>
				</div>
				<div style="height:80%; margin-left: 20px;">
					<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
						<input type="password" name="pwd1" placeholder="비밀번호" style="width: 450px; height: 50px; margin-bottom: 10px;">
						<input type="password" name="pwd2" placeholder="비밀번호 확인" style="width: 450px; height: 50px;">						
					</div>
				</div>
				<div style="height:10%; display: flex; justify-content: flex-end; margin-left: 20px;">
					<input type="button" onclick="check()"class="submitBtn" value="탈퇴하기">
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	function check() {
		msg = "탈퇴합니다"
		flag = true;
		frm = document.checkFrm;
		pwd1 = frm.pwd1.value;
		pwd2 = frm.pwd2.value;
		if(pwd1.trim()==""){
			msg = "비밀번호를 입력하세요";
			flag = false;
		}else if(pwd1!=pwd2){
			msg = "비밀번호가 일치하지 않습니다";
			flag = false;
		}
		alert(msg);
		if(flag==true)
			frm.submit();
	}
</script>
</html>