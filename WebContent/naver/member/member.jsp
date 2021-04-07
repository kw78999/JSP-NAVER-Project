<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>

<%
		request.setCharacterEncoding("UTF-8");
		Vector<MemberBean> vlist = mgr.getid();
		ArrayList<String> idarr = new ArrayList<String>();
		for(int i = 0;i<vlist.size();i++){
			bean = vlist.get(i);
			idarr.add("'"+bean.getId()+"'");
		}
%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/css/style.css">
	<style>
	.cdiv{
	color:red;
	margin-bottom: 15px;
	}
	</style>
</head>
<body>
	<div id="root">
		<form action="memberProc.jsp" name="memberFrm">
			<div class="container">
			
				<label class="label">아이디</label>
				<div class="birthPart">
					<input type="text" name="id" class="signInput" style="width: 400px;" autocomplete="off" onblur="idCheck()">
					<input type="button" onclick="idCheck2()" style="width: 50px; height: 57px; margin-bottom: 5px;">
				</div><div id="idc" class="cdiv"></div>
				
				<label class="label">비밀번호</label>
				<input type="password" name="pwd1" class="signInput" onblur="pwCheck()">
				<div id="pw1" class="cdiv"></div>
				
				<label class="label">비밀번호 확인</label>
				<input type="password" name="pwd2" class="signInput" onblur="pwCheck2()">
				<div id="pw2" class="cdiv"></div>
				
				<label class="label" style="margin-top: 20px;">이름</label>
				<input type="text" name="name" class="signInput" autocomplete="off" onblur="nCheck()">
				<div id="ndiv" class="cdiv"></div>
				
				<label class="label">생년월일</label>
				<div class="birthPart">
					<input type="text" name="birth1" class="signInput-3" placeholder="연" autocomplete="off" onblur="yyyyCheck()">
					<select name="birth2" class="signInput-3" onblur="mmCheck()"><option>월
						<option value="1">1월<option value="2">2월<option value="3">3월<option value="4">4월<option value="5">5월<option value="6">6월
						<option value="7">7월<option value="8">8월<option value="9">9월<option value="10">10월<option value="11">11월<option value="12">12월
					</select>
					<input type="text" name="birth3" class="signInput-3" placeholder="일" autocomplete="off" onblur="ddCheck()">
				</div>	<div id="bdiv" class="cdiv"></div>
				
				
				<label class="label">성별</label>
				<select name="gender" class="signInput" onclick="select()"><option id="del">성별
					<option value="1">남자<option value="2">여자<option value="3">선택안함
				</select>
				
				<label class="label">휴대전화</label>
				<input type="text" name="phone" class="signInput" autocomplete="off" onblur="pnumCheck()">
				<div id="pndiv" class="cdiv"></div>
				
				<input type="button" onclick="check()" value="가입하기" class="logInBtn" style="margin-top: 20px;">
			</div>
		</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
var frm = document.memberFrm;
var idarr2 = <%=idarr%>;

	function idCheck(){
		id = frm.id.value;
		var idc = document.getElementById("idc");
		var idcc=/^[0-9a-zA-Z]{8,12}$/;
		
		if(id.length<8||id.length>12){
			idc.style.color="red";
			idc.innerHTML="아이디 길이는 8~12자로 해주세요.";
			return false;
		}else{
			if(idcc.test(id)){
				 if(idarr2.indexOf(id)>=0){
					 idc.style.color="red";
					 idc.innerHTML="아이디 중복체크 해주세요.";	
					 return true;
				 }else{
				idc.style.color="#40c700";
				idc.innerHTML="확인";	
				return true;
				 }
			}else{
				idc.style.color="red";
				idc.innerHTML="아이디는 영문과 숫자로만 조합하세요.";
				return false;
			}
		}
	}
	
	function idCheck2() {  //중복검사 
		id = frm.id.value;
		var idcc=/^[0-9a-zA-Z]{8,12}$/;
		
		if(id.length<8||id.length>12){
			var idc = document.getElementById("idc");
			idc.style.color="red";
			idc.innerHTML="아이디 길이는 8~12자로 해주세요."
			
		}else{
			if(idcc.test(id)){
				//새로운 창 열기
				window.open("idCheck.jsp?id="+id,"idcheck","width=500,height=300,left=700,top=300");
				
			}else{
				idc.style.color="red";
				idc.innerHTML="아이디는 영문과 숫자로만 조합하세요.";
				
			}
		}
	}
	
	function pwCheck() {
		pwd1=frm.pwd1.value;
		var idcc=/^[0-9a-zA-Z]{8,12}$/;
		
		var pw1 = document.getElementById("pw1");
		
		if(pwd1.length<8||pwd1.length>12){
			pw1.style.color="red";
			pw1.innerHTML="비밀번호 길이는 8~12자로 해주세요.";
			return false;
		}else{
			if(idcc.test(pwd1)){
				pw1.style.color="#40c700";
				pw1.innerHTML="확인";
				return true;
			}else{
				pw1.style.color="red";
				pw1.innerHTML="비밀번호는 영문과 숫자로만 조합하세요.";
				return false;
			}
				
		}
		
	}
	function pwCheck2() {
		pwd2=frm.pwd2.value;
		pwd1=frm.pwd1.value;
		
		var pw2 = document.getElementById("pw2");
		if(pwd1!=pwd2){
			pw2.style.color="red";
			pw2.innerHTML="비밀번호가 다릅니다.";	
			return false;
		}else{
			pw2.style.color="#40c700";
			pw2.innerHTML="확인";	
			return true;
		}
	}
	function nCheck() {
		var ndiv=document.getElementById("ndiv");
		name=frm.name.value;
		var ncheck = /^[가-힝]{2,}$/;
		
		if(ncheck.test(name)){
			ndiv.style.color="#40c700";
			ndiv.innerHTML="확인";
			return true;
		}else{
			ndiv.style.color="red";
			ndiv.innerHTML="이름을 확인하세요.";
			return false;
		}
		
	}
	function yyyyCheck() {
		var bdiv=document.getElementById("bdiv");
		yyyy=frm.birth1.value;
		var ycheck = /^([1-2]{1})-?([0|9]{1})-?([0-9]{2})$/;
		
		if(ycheck.test(yyyy)){
			bdiv.innerHTML="";
			return true;
		}else{
			bdiv.style.color="red";
			bdiv.innerHTML="년도를 확인하세요"
				return false;
		}
	}
	
	
	function mmCheck() {
		var bdiv=document.getElementById("bdiv");
		mm=frm.birth2.value;
		
		if(mm=='월'){
			bdiv.style.color="red"
			bdiv.innerHTML="월을 확인하세요"
				return false;
		}else{
			bdiv.innerHTML=""
			return true;
		}
		
	}
	
	
	function ddCheck(){
		var bdiv=document.getElementById("bdiv");
		dd=frm.birth3.value;
		var dcheck1 = /^([1-9]{1})$/;  //한자리수 날짜
		var dcheck2 = /^([1-2]{1})-?([0-9]{1})$/;  //두자리수 1,2 로 시작하는 날짜
		var dcheck3 = /^([3]{1})-?([0-1]{1})$/;  //두자리수 3으로 시작하는 날짜
		
		if(dd.length==1){
			if(dcheck1.test(dd)){
				bdiv.style.color="#40c700"
				bdiv.innerHTML="확인"
					return true;
			}else{
				bdiv.style.color="red"
				bdiv.innerHTML="날짜를 확인하세요"
					return false;
			}
		}else if(dd.length==2){
				if(dd.substring(0,1)==3){
					if(dcheck3.test(dd)){
						bdiv.style.color="#40c700"
						bdiv.innerHTML="확인"
							return true;
					}else{
						bdiv.style.color="red"
						bdiv.innerHTML="날짜를 확인하세요"
							return false;
					}
				}else{
						if(dcheck2.test(dd)){
							bdiv.style.color="#40c700"
							bdiv.innerHTML="확인"
								return true;
						}else{
							bdiv.style.color="red"
							bdiv.innerHTML="날짜를 확인하세요"
								return false;
						}
				}
		}else{
			bdiv.style.color="red"
			bdiv.innerHTML="날짜를 확인하세요"
				return false;
		}
	}
	
	
	function select() {
	}
	
	function pnumCheck() {
		var pndiv=document.getElementById("pndiv");
		p=frm.phone.value;
		
		var pcheck = /^010-?([0-9]{3,4})-?([0-9]{4})$/;
		
		if(pcheck.test(p)){
			pndiv.style.color="#40c700"
			pndiv.innerHTML="확인"
				return true;
		}else{
			pndiv.style.color="red"
			pndiv.innerHTML="핸드폰 번호를 확인하세요"
				return false;
		}
		
	}
	
	
	function check(){
		flag = true;
		msg="가입성공";
		id = frm.id.value;
		pwd1 = frm.pwd1.value;
		pwd2 = frm.pwd2.value;
		name = frm.name.value;
		birth1 = frm.birth1.value;
		birth2 = frm.birth2.value;
		birth3 = frm.birth3.value;
		gender = frm.gender.value;
		phone = frm.phone.value;
		if(id.replace(/(^\s*)|(\s*$)/, "").trim()=="") {
			msg="아이디를 입력해주세요";
			frm.id.focus();
			flag = false;
		} else if(id.length < 8 || id.length > 12) {
			msg="아이디는 8 ~ 12자 이내로 입력해주세요";
			frm.id.focus();
			flag = false;
		} else if(pwd1=="") {
			msg="비밀번호를 입력하세요";
			frm.pwd1.focus();
			flag = false;
		} else if(pwd1.length < 8 || pwd1.length > 12) {
			msg="비밀번호는 8 ~ 12자 이내로 입력해주세요";
			frm.pwd1.focus();
			flag = false;
		} else if(pwd1!=pwd2) {
			msg="비밀번호를 확인해주세요";
			frm.pwd2.focus();
			flag = false;
		} else if(name.replace(/(^\s*)|(\s*$)/, "").trim()==""){
			msg="이름을 입력하세요";
			frm.name.focus();
			flag = false;
		} else if(birth1.trim()==""||birth2.trim()==""||birth3.trim()==""){
			msg="생년월일을 입력하세요";
			frm.birth1.focus();
			flag = false;
		} else if(gender=="성별"){
			msg="성별을 입력하세요";
			frm.gender.focus();
			flag = false;
		} else if(phone.trim()==""){
			msg="휴대전화를 입력하세요";
			frm.phone.focus();
			flag = false;
		}else if(!idCheck()){
			msg="아이디를 확인하세요";
			frm.id.focus();
			flag = false;
		}else if(!pwCheck()){
			msg="비밀번호를 확인하세요";
			frm.pwd1.focus();
			flag = false;
		}else if(!pwCheck2()){
			msg="비밀번호를 확인하세요";
			frm.pwd2.focus();
			flag = false;
		}else if(!nCheck()){
			msg="이름을 확인하세요";
			frm.name.focus();
			flag = false;
		}else if(!yyyyCheck()){
			msg="년도를 확인하세요";
			flag = false;
		}else if(!mmCheck()){
			msg="월을 확인하세요";
			flag = false;
		}else if(!ddCheck()){
			msg="날짜를 확인하세요";
			flag = false;
		}else if(!pnumCheck()){
			msg="핸드폰 번호를 확인하세요";
			frm.phone.focus();
			flag = false;
		}else if(idarr2.indexOf(id)>=0){
				msg="아이디가 이미 존재합니다"
			flag = false;
		}
		alert(msg);
		if(flag==true)
			frm.submit();
	}
</script>
</html>