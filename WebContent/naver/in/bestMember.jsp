<%@page import="in.QuestionBean"%>
<%@page import="member.MemberBean"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("id");
%>
<jsp:useBean id="amgr" class="in.AnswerMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명예의 전당</title>
<link href="header5.css" rel="stylesheet" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Bad Script' rel='stylesheet' type='text/css'> 
<style>
@media ( max-width: 1650px ) {
 .submenubar{width:100%}
}
@media( max-width: 1024px){
#mainbanner{ width: 88%;}
  #call{display: none;}
  .menubar{display: none;}
}
.textdiv{
font-size: 25px;
font-weight: 900;
font-family:"Bad Script";
}
.atag{
text-decoration: none;
color:brown;
}
.tagA:visited{
color:blue;
}
.td1{
font-size: 20px;
font-weight: bold;
}
#enddiv{
font-family:"Bad Script";
font-weight: 900;
font-size: 20px;
}
</style>
<script>
var mql3 = window.matchMedia("screen and (max-width: 1650px)");
mql3.addListener(function(e) {
    if(e.matches) {
    	document.getElementById('subtd1').style.display='none';
    }else{
    	document.getElementById('subtd1').style.display='table-cell';
  	   
    }});
var mql = window.matchMedia("screen and (max-width: 1024px)");

mql.addListener(function(e) {
    if(e.matches) {
	    	document.getElementById('loginon').style.display='none';
    	
    } else {
	    	document.getElementById('loginon').style.display='block';
    }
});
var n =0 ;
var imgset;
var start;

window.onload = function() { 

	alert('해당 페이지는 반응형 레이아웃을 지원하지않습니다.');
	start=setInterval(mm,3);
 }

function mm() {
	//400 번 까지
	if(n<401){
	n++;
	var day = document.getElementById("day");
	var timer = document.getElementById("timer");
	var mtd = document.getElementById("mtd");
	var p1 = document.getElementById("p1");
	var table1 = document.getElementById("table1");
	var cdiv = document.getElementById("cdiv");
	var div1 = document.getElementById("div1");
	var div2 = document.getElementById("div2");
	var div3 = document.getElementById("div3");
	var div4 = document.getElementById("div4");
	var div5 = document.getElementById("div5");
	var rdiv1 = document.getElementById("rdiv1");
	var rdiv2 = document.getElementById("rdiv2");
	var rdiv3 = document.getElementById("rdiv3");
	var rdiv4= document.getElementById("rdiv4");
	var img= document.getElementById("img");
	var tdiv1= document.getElementById("tdiv1");
	var tdiv2= document.getElementById("tdiv2");
	tdiv1.style.top=50+n*1.5+"px";  //650
	tdiv1.style.left=1300-n*2+"px";
	tdiv2.style.top=200+n*2+"px";
	tdiv2.style.left=1690-n+"px";
	day.style.fontSize=70-n/10+"px";
	timer.style.fontSize=20+n/10+"px";
	mtd.style.width=300+n*2+"px";
	p1.style.fontSize=10+n/10+"px";
	p1.style.fontWeight=100+n*2;
	table1.style.marginLeft=400-n+"px";
	cdiv.style.background=" linear-gradient(to top, rgba("+(n/2)+","+(n/2)+","+(n/2)+","+(1-n/1000)+"), white 100%)";
	div1.style.borderLeft=    n/20+"px solid rgb("+(n/1.5)+",220,"+(n/1.5)+")";
	div2.style.top=300+n+"px";
	div2.style.left=50+n+"px";
	div3.style.top=500+n/2+"px";
	div3.style.left=550+n+"px";
	div4.style.top=300+n+"px";
	div5.style.top=300+n+"px";
	div5.style.left=310+n/2+"px";
	rdiv1.style.top=650+n+"px";
	rdiv1.style.left=1205-n+"px";
	//rdiv1.style.borderColor=rgba(190,255,255,0.6);
	rdiv2.style.top=250+n*2+"px";
	rdiv2.style.left=497+n/4+"px";
	rdiv3.style.top=1250-n/2+"px";
	rdiv3.style.left=1070-n/2+"px";
	rdiv4.style.top=250+n*2+"px";
	rdiv4.style.left=1550-n+"px";
	img.style.opacity=0+n/400;
   }
	if(n==400){
		clearInterval(start);
	  imgset = setInterval(end,5);
	}
}

var x=0;
var imgset2;
function end() {
	x++;
	if(x<131){
	var img= document.getElementById("img");
	img.style.top=600+x*3+"px";  //990
	img.style.left=1300-x+"px";  //1170
	}
	if(x==130){
		clearInterval(imgset);
		imgset2 = setInterval(end2,3);
	}
}
var x2=0;
var imgset3;
function end2() {
	x2++;
	if(x2<81){
	var img= document.getElementById("img");
	img.style.top=990-x2/1.5+"px";    //936
	img.style.left=1170-x2*3+"px";   //930
	img.style.transform="rotate("+(-x2)+"deg)";   //-80
	}
	if(x2==81){
		clearInterval(imgset2);
		imgset3 = setInterval(end3,3);
	}
}
var x3=0;
var imgset4;
function end3() {
	x3++;
	if(x3<96){
	var img= document.getElementById("img");
	img.style.top=936+x3/1.3+"px";    //1009
	img.style.left=930-x3*3+"px";     //645
	img.style.transform="rotate("+(-80+(-x3))+"deg)";     //-175
	} 
	if(x3==95){
		clearInterval(imgset3);
		imgset4 = setInterval(end4,3);
	}
}
var x4=0;
var imgset5;
function end4() {
	x4++;
	if(x4<181){
	var img= document.getElementById("img");
	img.style.top=1009+x4*2+"px";    //1369
	img.style.left=645-x4+"px";   //465
	img.style.transform="rotate("+(-175+x4*5)+"deg)";   //725
	}
	if(x4==180){
		clearInterval(imgset4);
		imgset5 = setInterval(end5,3);
	}
}
var x5=0;
function end5() {
	x5++;
	if(x5<134){
	var img= document.getElementById("img");
	img.style.top=1369+x5*2+"px";    
	img.style.left=465+x5+"px";   
	img.style.transform="rotate("+(725+x5*5)+"deg)";   
	}
	if(x5==133){
		clearInterval(imgset5);
		var divend= document.getElementById("enddiv");
		divend.style.display="block";
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %> 
<div id="body">
<hr style="margin-top:0px;margin-bottom: 0px;">
</div>
<div id ="cdiv"style="background: linear-gradient(to top, rgba(0,0,0,1), white 100%);height: 1500px;">

<div id="div1" style="background-color: white;height: 1500px;width: 1000px;margin: 0px auto;border-left: 0px solid rgba(0,0,0,1);border-right: 20px solid rgba(190,255,255,0.6);">

<div id="tdiv1" class="textdiv" style="position: absolute;top: 50px;left: 1300px;">Best Member</div>
<div id="tdiv2"  class="textdiv" style="position: absolute;top: 200px;left:1690px;">Best QnA</div>
<table style="margin-left: 400px;" id="table1">
<tr><td id="mtd" style="background-image:url('img/back.jpg');
background-repeat: no-repeat;
background-size: 100% 100%;
color:white;border-bottom-left-radius: 150px;border-bottom-right-radius: 150px;"
 width="300px" height="350px;" align="center"><p id="p1"style="font-size: 10px;padding-top: -100px;font-weight: 100;">명예의 전당</p>
<p id="day" style="font-size: 80px;"></p>
<p id="timer" style="font-size: 10px;"></p></td></tr>

</table>



<script>
function time() {
	var t = new Date();
	var y = t.getFullYear();
	var m = t.getMonth();
	var d = t.getDate();
	var hours = t.getHours(); // 현재시
	var minutes = t.getMinutes();  // 현재분
	var seconds = t.getSeconds();  // 현재초
	var mseconds = t.getMilliseconds()
	document.getElementById("timer").innerHTML = 
		hours+":"+minutes+":"+seconds+" : "+mseconds;
	document.getElementById("day").innerHTML = 
		y+"."+(m+1)+"."+d
}
var set = setInterval(time,10);
</script>
<%MemberBean qbean=amgr.qid(); 
     MemberBean abean = amgr.aid();
		MemberBean pbean = amgr.pid();
%>
<img  id="img" src="img/choice.jpeg" style="width: 70px;height: 70px;opacity: 0;position: absolute;top: 600px;left:1300px;">
<div id="enddiv" style="width: 300px;height: 100px;position: absolute;top: 1530px;left: 470px;display: none">Web Project<br>NAVER<br>End_2021.01.13</div>
<div id="div2"style="border-top: 10px solid rgb(240,220,240);width: 500px;height: 500px;position: absolute;top:300px;left:50px;">
</div>
<div id="div3" style="border-left: 10px solid rgb(240,220,240);width: 200px;height: 100px;position: absolute;top: 500px;left:550px;">
<table><tr align="center"><td class="td1" style="padding-top: 30px;">질문 1위</td></tr>
<tr align="center"><td class="td1" >
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<%=qbean.getQuestionCnt() %>
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<br><a class="atag"><%=qbean.getId() %></a></td></tr>
</table></div>


<div id="div4" style="border-left: 10px solid rgb(240,220,240);width: 200px;height: 230px;position: absolute;top: 300px;left:760px;">
<table><tr align="center"><td class="td1"  style="padding-top: 160px;">답변 1위</td></tr>
<tr align="center"><td class="td1" >
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<%=abean.getAnswerCnt() %>
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<br><a class="atag"><%=abean.getId() %></a></tr>
</table></div>


<div  id="div5"style="border-left: 10px solid rgb(240,220,240);width: 200px;height: 380px;position: absolute;top: 300px;left:310px;">
<table><tr align="center"><td class="td1"  style="padding-top: 310px;">내공 1위</td></tr>
<tr align="center"><td class="td1" >
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<%=pbean.getInPoint() %>
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<br><a class="atag"><%=pbean.getId() %></a></tr>
</table></div>


<%QuestionBean hbean = amgr.hitq();
	QuestionBean anbean=amgr.answerq();
	QuestionBean pobean = amgr.pointq();
%>
<div id="rdiv1" style="border-top: 10px solid rgba(190,255,255,0.6);width: 650px;height: 500px;position: absolute;top:650px;left:1205px;" >
</div>

<div id="rdiv2" style="border-right: 10px solid rgba(190,255,255,0.6);width: 200px;height: 270px;position: absolute;top: 250px;left:497px;">
<table><tr align="center"><td width="70px;"></td><td class="td1" style="padding-top: 150px;">최고 조회수</td></tr><tr align="center"><td></td><td class="td1" >
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<%=hbean.getHits() %>
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;"><br>
<a class="atag"  href="boardRead.jsp?qnum=<%=hbean.getQnum()%>">바로가기</a>
</td></tr></table></div>


<div id="rdiv3" style="border-right: 10px solid rgba(190,255,255,0.6);width: 200px;height: 400px;position: absolute;top: 1250px;left:1070px;">
<table><tr align="center"><td width="70px;"></td><td class="td1" style="padding-top: 280px;">최고 답변수</td></tr><tr align="center"><td width="70px;"></td><td class="td1"  >
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<%=anbean.getAnswer_count() %>
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<br><a  class="atag" href="boardRead.jsp?qnum=<%=anbean.getQnum()%>">바로가기</a></td></tr></table></div>


<div id="rdiv4" style="border-right: 10px solid rgba(190,255,255,0.6);width: 200px;height: 450px;position: absolute;top: 250px;left:1550px;">
<table style="margin-left: 60px;"><tr align="center"><td class="td1" style="padding-top: 340px;"> 가장많은 내공</td></tr><tr align="center"><td class="td1">
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<%=pobean.getPoint() %>
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<br><a class="atag" href="boardRead.jsp?qnum=<%=pobean.getQnum()%>">바로가기</a></td></tr></table></div>




</div><!-- main div -->
</div><!-- backdiv -->
</body>

<!-- my menu -->
<span id="menutable" style="display:none" >
	<table>
	<tr>
	<th colspan="4" align="left" height="10px" width="280px">
	My Menu</th>
	</tr>
		<tr>
			<td>카페</td>
			<td>블로그</td>
			<td>메일</td>
			<td>쇼핑</td>
		</tr>
		<tr>
			<td>뉴스</td>
			<td>지도</td>
			<td>포스트</td>
			<td>증권</td>
		</tr>
		<tr>
			<td>웹툰</td>
			<td>영화</td>
			<td>사전</td>
			<td>부동산</td>
		</tr>
		<tr>
			<td>게임</td>
			<td>날씨</td>
			<td>책</td>
			<td>스포츠</td>
		</tr>
		<%if(id!=null){ %>
		<tr>
		<td colspan="4" align="center" style="border-top: 1px solid #888;" onclick="location.href='logout.jsp'">로그아웃</td>
		</tr>
		<%} %>
	</table>
</span>

<%@ include file="footer.jsp" %>
</html>
<script>
var filter = "win16|win32|win64|mac";
if(navigator.platform){
	if(0 > filter.indexOf(navigator.platform.toLowerCase())){
    	document.getElementById('subtd1').style.display='none';
    } else {
    	document.getElementById('subtd1').style.display='table-cell';
    	
    }	
}
</script>