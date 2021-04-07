<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#footer{
color: #cccccc;
}
.footerText{
color:#444444;
}
.footerText:hover{
color:#40c700;
cursor: pointer;
text-decoration: underline;
}
#naver1{
cursor:pointer;
border:0;
outline:0;
width:70px;height:20px;
background: url("img/naver2.png");
background-size:70px 20px;
padding-top: 20px;
}
</style>
<meta charset="UTF-8">
</head>
<footer>

 
<hr style="margin-top:50px;width: 90%;">

<div style="width: 100%;display: block;" id = "div1">
	<div style="margin-left:130px;">
	<a class="footerText">네이버 이용약관</a> &nbsp;&nbsp;&nbsp;|
	&nbsp;&nbsp;&nbsp;<a class="footerText"> 지식iN 서비스</a> 
	</div>
	
	<div style="margin-left:100px;">
	&nbsp;&nbsp;&nbsp; <a class="footerText">운영정책 </a>&nbsp;&nbsp;&nbsp;| 
	&nbsp;&nbsp;&nbsp;<a class="footerText">처리방침</a>&nbsp;&nbsp;&nbsp; |
	&nbsp;&nbsp;&nbsp;<a class="footerText"> 고객센터</a>
	</div>
	<br>
	<div  style="font-size:12px;display: flex;margin-left:110px;">
	<button id="naver1"></button>
	 &nbsp;Copyright  &nbsp; <strong>NAVER Corp.</strong>  &nbsp;All Rights Reserved.
	 </div>
	<br>
	</div>
	
<div style="margin: 30px auto;width: 100%;display: block;" id = "div2">
	<br><span id="footer" style="margin-left:28%;font-size: 14px;">
	<a class="footerText">네이버 이용약관</a> &nbsp;&nbsp;&nbsp;|
	&nbsp;&nbsp;&nbsp;<a class="footerText"> 지식iN 서비스</a> &nbsp;&nbsp;&nbsp;|
	&nbsp;&nbsp;&nbsp; <a class="footerText">운영정책개인정보 </a>&nbsp;&nbsp;&nbsp;| 
	&nbsp;&nbsp;&nbsp;<a class="footerText">처리방침게시중단요청서비스</a>&nbsp;&nbsp;&nbsp; |
	&nbsp;&nbsp;&nbsp;<a class="footerText"> 지식iN 고객센터</a>
	</span>
	<br><br>
	<span  style="font-size:12px;display: flex;margin-left:40%; ">
	<button id="naver1"></button>
	 &nbsp;Copyright  &nbsp; <strong>NAVER Corp.</strong>  &nbsp;All Rights Reserved.</span>
	<br><br><br>
	</div>
	
</footer>
</html>
<script>


var filter = "win16|win32|win64|mac";



if(navigator.platform){

	if(0 > filter.indexOf(navigator.platform.toLowerCase())){
		document.getElementById('div1').style.display = "block";
    	document.getElementById('div2').style.display = "none";

	}else{
		document.getElementById('div1').style.display = "none";
    	document.getElementById('div2').style.display = "block";
	}	

}


</script>