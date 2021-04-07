<%@page import="in.UtilMgr"%>
<%@page import="in.AnswerBean"%>
<%@page import="java.util.Vector"%>
<%@page import="in.QuestionBean"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%> 
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<jsp:useBean id="amgr" class="in.AnswerMgr" />
<%
    int qnum = Integer.parseInt(request.getParameter("qnum"));
	
	mgr.hitsAdd(qnum);
	QuestionBean bean = mgr.boardRead(qnum);
	String id = "";
	if(session.getAttribute("id")!=null){
	id = (String)session.getAttribute("id");
	}
	//읽어온 게시물을 수정 및 삭제를 위해 세션에 저장
	session.setAttribute("bean", bean);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<link href="header5.css" rel="stylesheet" type="text/css">
<style>
@media ( max-width: 1650px ) {
 .submenubar{width:100%}
}
@media( max-width: 1024px){
  #call{display: none;}
  .menubar{display: none;}
  #mainbanner{ width: 88%;}
}
#def{
width: 70px;
height: 70px;
}
.okbtn{
width: 100px;
height: 50px;
background-color: brown;
border: 0px;
color:white;
outline: none;
cursor: pointer;
font-size: 20px;
font-weight: bold;
border-radius: 10px;
margin-left: 0px;
}
.okbtn2{
width: 100px;
height: 50px;
background-color: white;
border: 5px solid brown;
color:brown;
outline: none;
cursor: pointer;
font-size: 20px;
font-weight: bold;
border-radius: 10px;
margin-left: 0px;
transform:rotate(-30deg);
}
.tagA{
text-decoration: none;
color:#555;
background-color: rgb(119,188,215,0.3);
}
.tagA:visited{
color:blue;
}
.tagA:hover{
background-color: rgb(119,188,215,0.6);
}
 #nlogin{
border:0;
outline:0;
width:270px;height:60px;
background: url("img/nlogin.png");
background-size:270px 60px;
    cursor: pointer;
    margin-left: 310px;
    margin-bottom: 50px;
}
#aq{
border:0;
outline:0;
width:200px;height:60px;
background:white;
border:5px solid #40c700;
border-radius:10px;
background-size:270px 60px;
font-size: 25px;
color:#40c700;
margin-left: 350px;
cursor: pointer;
}
#aq:hover{
background: aliceblue;
}
#body{
background-color: #eee;
padding-bottom: 30px;
height: 100%;
}
#board{
width: 900px;
height: 100%;
background-color: white;
margin:20px auto;
border: 1px solid #ddd;
}
#qTable{
width:800px;
height:90%;
padding-top:50px;
margin: 0px auto;
border: 2px soild blue;
}
#qTable td{
border: 2px soild blue;
}
#answer{
width: 900px;
height: 100%;
background-color: white;
margin: 20px auto;
border: 1px solid #ddd;
}
#answer2{
width: 900px;
height: 220px;
background: linear-gradient(to right, white, rgba(255,255,255,0.5)); 
margin: 20px auto;
border: 1px solid #ddd;
}
.answer3{
width: 900px;
height: 220px;
background: linear-gradient(to right, white, rgba(255,255,255,0.5)); 
margin: 20px auto;
border: 1px solid #ddd;
}
#aTable{
width:800px;
height:90%;
padding-top:50px;
margin: 0px auto;
}
.answerList{
width: 900px;
height: 100%;
background-color: white;
margin: 20px auto;
border: 1px solid #ddd;
}
#ta{
background-color: aliceblue;
border: 2px solid #888;
}
#ta:focus{
border: 2px solid #40c700;
outline: none;
}
#abtn{
width: 100px;
height: 50px;
background-color: #40c700;
border: 0px;
color:white;
outline: none;
cursor: pointer;
font-size: 20px;
font-weight: bold;
border-radius: 10px;
}
#tag:link{
color:#888;
text-align: right;
font-size: 15px;
text-decoration: none
}
#tag:visited{
color:#888;
}
#tag:hover{
color:#40c700;
}
.upbtn{
display:none;
margin-top:20px;
margin-left:570px;
margin-bottom:10px;
 width: 100px;
height: 50px;
background-color: #40c700;
border: 0px;
color:white;
outline: none;
cursor: pointer;
font-size: 20px;
font-weight: bold;
border-radius: 10px;
}
.cbtn{
display:none;
margin-top:20px;
margin-left:10px;
margin-bottom:10px;
width: 100px;
height: 50px;
background-color: #40c700;
border: 0px;
color:white;
outline: none;
cursor: pointer;
font-size: 20px;
font-weight: bold;
border-radius: 10px;
}
#btnspan{
float:left;
}
.fileimg{
width: 200px;
height: 200px;
border:3px solid white;
}
.fileimg:hover{
border:3px solid #40c700;
cursor: pointer;
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

var dnum=0;

window.onload=function(){
	if(document.getElementById("def")!=null){
		setInterval(deff,10);
		}
}
function deff() {
	dnum++;
	var dfff = document.getElementById("def");
	dfff.style.transform="rotate("+dnum+"deg)";
	
}


function tagSearch(key) {
	location.href="searchList.jsp?searchKey="+key;
}
function doImgPop(img){
	 img1= new Image();
	 img1.src=(img);
	 imgControll(img);
	}
	 
	function imgControll(img){
	 if((img1.width!=0)&&(img1.height!=0)){
	    viewImage(img);
	  }
	  else{
	     controller="imgControll('"+img+"')";
	     intervalID=setTimeout(controller,20);
	  }
	}

	function viewImage(img){
	 W=img1.width;
	 H=img1.height;
	 O="width="+W+",height="+H+",scrollbars=yes";
	 imgWin=window.open("","",O);
	 imgWin.document.write("<html><head><title>이미지상세보기</title></head>");
	 imgWin.document.write("<body topmargin=0 leftmargin=0>");
	 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
	 imgWin.document.close();
	}
	
function imgclick() {
var img = document.getElementsByClassName('fileimg'); 
for (var x = 0; x < img.length; x++) {
	img.item(x).onclick=function() {window.open(this.src)}; 
	}
}
function update(aid) {
	var e = document.getElementById(aid);
	
	if(e.style.display=='block'){
	e.style.display='none';
	document.getElementById(1000+aid).style.display='block';
	document.getElementById(10000+aid).style.display='block';
	document.getElementById(11000+aid).style.display='block';
	}else if(e.style.display='none'){
		e.style.display='block';
		document.getElementById(1000+aid).style.display='none';
		document.getElementById(10000+aid).style.display='none';
		document.getElementById(11000+aid).style.display='none';
	}
	
}
function down(filename) {
	document.downFrm.filename.value=filename;
	document.downFrm.submit();
}

function Cal(boardDate) {
	 let today = new Date();   
	 let year = today.getFullYear(); // 현재년도
	 let month = today.getMonth() + 1;  // 현재월
	 let date = today.getDate();  // 현재날짜
	 let hours = today.getHours(); // 현재시
	 let minutes = today.getMinutes();  // 현재분
	 let seconds = today.getSeconds();  // 현재초
	 
	 let y = boardDate.substring(0,4); //게시글 년도
	 let mon ="";                     //게시글 월
	 let d ="";                     //게시글 일
	 
	 if(boardDate.substring(5,6)==0){     //한자리 수라면 0 제거
		 mon = boardDate.substring(6,7);
	 }else{
		 mon = boardDate.substring(5,7);
	 }
	 
	 if(boardDate.substring(8,9)==0){     //한자리 수라면 0 제거
		 d = boardDate.substring(9,10);
	 }else{
		 d = boardDate.substring(8,10);
	 }

	 let h = boardDate.substring(10,13);//게시물 시
	 let m = boardDate.substring(14,16);//게시물 분
	 let s = boardDate.substring(17,19);//게시물 초
	 
	 if(s.substring(0,1)==0)  //한자리수라면 앞의 0자르기
		 s=s.substring(1,2);
	 
	 var nymd = year+"-"+month+"-"+date;  //현재 년월일
	 var bymd = y+"-"+mon+"-"+d;  //게시글 년월일
	 
	 if(nymd!=bymd){
	    return bymd;
	 }else if(hours-h>=2){
		return hours-h+"시간전";
	 }else if(hours-h==1){
		 return m-minutes<=0?"1시간전":minutes+60-m+"분전";
	 }else if(hours==h){
		 return minutes==m?seconds-s+"초전":minutes-m+"분전";
	 }
}
/*function colorup() {
	var e = document.getElementById("answer2");
	e.style.background="linear-gradient(to right, white, rgba(0,255,1,0.5))";
}*/

var cn = 0;
var interv;
function colorup() {
   interv= setInterval(colorup2,3);
}
function colorup2() {
	cn++;
	if(cn<256){
	var a=255-cn;
	var b=255-cn;
	var c=100+cn;
	
	if(document.getElementById("an3")!=null)
	var e = document.getElementById("an3");
	
	if(document.getElementById("an4")!=null)
	var e = document.getElementById("an4");
	
	if(document.getElementById("an5")!=null)
	var e = document.getElementById("an5");
	
	if(document.getElementById("answer2")!=null)
	var e = document.getElementById("answer2");
	
	if(document.getElementById("qap1")!=null)
	var e2 = document.getElementById("qap1");
	if(document.getElementById("qap2")!=null)
		var e2 = document.getElementById("qap2");
	if(document.getElementById("qap3")!=null)
		var e2 = document.getElementById("qap3");
	if(document.getElementById("qap4")!=null)
		var e2 = document.getElementById("qap4");
	
	
	e2.style.color="rgb("+c+","+c+","+c+")";
	e.style.background="linear-gradient(to right, white, rgba("+a+",255,"+b+",0.6))";
   }
	if(cn==255){
		clearInterval(interv);
	}
}

</script> 
</head>
<body>
<%@ include file="header.jsp" %>
<div id="body">
<hr style="margin-top:0px;margin-bottom: 20px;"> 
<div id="board">
<table id = "qTable">
	<tr><td colspan="4">
	<img  src="img/question.png" style="width: 40px;height: 40px;border-radius: 10px;">
	<a style="font-size: 25px;font-weight: bold;color:#444;"><%=bean.getTitle() %>
	<span style="color:#40c700;"> [ <%=bean.getPoint() %> ]</span></a>
	</td></tr>
	
		<%if(bean.getFilename()!=null&&!bean.getFilename().equals("")){ %>
	<tr><td colspan="4" align="right">
	<img  src="img/down.png" style="width: 30px;height: 25px;">
	<a href="javascript:down('<%=bean.getFilename() %>')">
	<%=bean.getFilename() %></a>
	<font color="blue">(<%=UtilMgr.intFormat(bean.getFilesize()) %>bytes)</font>
	</td></tr>
	<%} %>
	
	<%if(bean.getFilename2()!=null&&!bean.getFilename2().equals("")){ %>
	<tr><td colspan="4" align="right">
	<img  src="img/down.png" style="width: 30px;height: 25px;">
	<a href="javascript:down('<%=bean.getFilename2() %>')">
	<%=bean.getFilename2() %></a>
	<font color="blue">(<%=UtilMgr.intFormat(bean.getFilesize2()) %>bytes)</font>
	</td></tr>
	<%} %>
	
	
	<%if(bean.getFilename()!=null&&!bean.getFilename().equals("")){
	String f1 = bean.getFilename();
	String fn1 = f1.substring(f1.length()-3,f1.length());
	if(fn1.equals("jpg")||fn1.equals("png")){%>
	<tr><td width="400px">
	<span>
	<img class="fileimg" src="/naverimg/<%=bean.getFilename()%>"
	 onclick="doImgPop('/naverimg/<%=bean.getFilename()%>')" title="원본"><br>
	 <%if(bean.getFiledata()!=null&&!bean.getFiledata().equals("")&&!bean.getFiledata().equals("null")){ %>
	<label style="color: #888;">*<%=bean.getFiledata()%></label>
	<%} %>
	</span>
	</td>
	<%} }%>
	
	<%if(bean.getFilename2()!=null&&!bean.getFilename2().equals("")){
	String f2 = bean.getFilename2();
	String fn2 = f2.substring(f2.length()-3,f2.length());
	if(fn2.equals("jpg")||fn2.equals("png")){%>
	<td>
	<span>
	<img  class="fileimg" src="/naverimg/<%=bean.getFilename2()%>" 
	onclick="doImgPop('/naverimg/<%=bean.getFilename2()%>')" title="원본"><br>
	<%if(bean.getFiledata2()!=null&&!bean.getFiledata2().equals("")&&!bean.getFiledata2().equals("null")){ %>
	<label style="color:#888;">*<%=bean.getFiledata2()%></label>
	<%} %>
	</span>
	</td>
	<% }}%>
	</tr>
	<tr><td colspan="4" style="padding-top: 50px;padding-bottom: 30px;white-space:pre-line;padding-right: 30px;padding-left: 30px;">
	<%=bean.getContent() %>
	</td></tr>
	<tr><td colspan="4" style="padding-bottom: 20px;border-bottom: 2px solid #40c700;">&nbsp;&nbsp;&nbsp;
	<%if(bean.getTag()!=null){
	String[] tagArray = bean.getTag().split("#");
	for(int i=1;i<tagArray.length;i++){  /*0번배열은 공백이므로 1번부터 시작(split 특성)*/%>
	        <a href="searchList.jsp?searchKey=<%=tagArray[i] %>" class="tagA"><%="#"+tagArray[i]%></a>&nbsp;&nbsp;
	<%}}%>
	
	</td></tr>
<tr>
	<td width="100px" style="padding-bottom: 50px; font-weight: bold;" >
		<%=bean.getId() %>
	</td>
	<td width="100px" style="padding-bottom: 50px;">
		조회수 <%=bean.getHits()%>
	</td>
	<td width="100px" style="padding-bottom: 50px;">
		답변 <%=bean.getAnswer_count()%>
	</td>
	<td width="400px" align="right" style="padding-bottom: 50px;">
	<%if(id.equals(bean.getId())){ %>
	<a id="tag" href="naver_question_up.jsp?qnum=<%=qnum%>">[수정]</a>
	<a id="tag" href="delete_q.jsp?qnum=<%=qnum%>">[삭제]</a>
	<%} %>
		<script>
			document.write(Cal('<%=bean.getDate()%>'));  //날짜계산함수
		</script>
	</td>
</tr>
</table>
</div>
<%if(id==null||id.equals("")){ %>
<div id="answer2" onmouseover="colorup()">
<p id="qap1" style="color:rgb(100,100,100);margin: 50px auto;font-weight: bold;font-size:30px;"align="center">질문과 답변을 하고싶다면,</p>
<button id="nlogin" type="button" onclick="location.href='../member/login.jsp?returnPage=../in/boardRead.jsp?qnum=<%=qnum%>' "/><br><br><br><br><br>
</div>


<%}else if(id.equals(bean.getId())&&bean.getAnswer_count()==0){ %>
<div class="answer3" id="an3" onmouseover="colorup()">
<p id="qap2" style="color:#999;margin: 40px auto;font-weight: bold;font-size:30px;"align="center">
<img id="def" src="img/def.png" style=" transform: rotate(30deg);display: flex;">답변을 기다리는 중</p>
</div>



<%}else if(id.equals(bean.getId())&&bean.getAnswer_count()>0&&bean.getChoice()==null){ %>
<div class="answer3" id="an4" onmouseover="colorup()">
<p id="qap3" style="color:#999;margin: 50px auto;font-weight: bold;font-size:30px;"align="center">도움되는 답변을<br><br>채택하세요</p>
</div>



<%}else if(id.equals(bean.getId())&&bean.getAnswer_count()>0&&bean.getChoice()!=null){ %>
<div class="answer3" id="an5" onmouseover="colorup()">
<p id="qap4" style="color:#999;margin: 50px auto;font-weight: bold;font-size:30px;"align="center">답변을 채택 하였습니다.</p>
<button type="button" id="aq" onclick="location.href='naver_question.jsp' ">질문 하기</button>
</div>


<%}else{ %>
<div id="answer">
<form method="post" name="aFrm" action="answerProc.jsp">
<input type="hidden" name="id" value="<%=id %>">
<table id="aTable">
<tr><td>
<img  src="img/question.png" style="width: 40px;height: 40px;border-radius: 10px;">
	<a style="font-size: 25px;font-weight: bold;color:#444;"><%=id%> 님 답변해주세요.</a>
</td></tr>
<tr>
<td style="padding-top: 30px;"><textarea id="ta" cols="99" rows="20" name="content"></textarea></td>
</tr>
<tr>
<td align="right" style="padding-right: 80px;padding-bottom: 60px;">
<input type="hidden" name ="qnum" value="<%=qnum%>">
<input type="submit" value="답변하기" id="abtn"></td>
</tr>
</table>
</form>
</div>
<%} %>

<%Vector<AnswerBean> vlist = amgr.getAnswerList(qnum); 
	int cho=-1;
	if((bean.getChoice()!=null)){
	 cho =Integer.parseInt(bean.getChoice());
	}
	for(int i=0;i<vlist.size();i++){ 
	AnswerBean abean = vlist.get(i);
	int aid = 100+i;
	%>
	
<div class="answerList" 
<%if(abean.getAnum()==cho){ %>
 style="border: 5px solid #FFE146;"
<%} %>>
<%if(abean.getAnum()==cho){%>
<button type="button" class="okbtn2">채택  &nbsp;  !</button>
<%} %>
<table id="aTable">
<tr><td>
<%if(abean.getAnum()==cho){ %>
<img  src="img/choice.jpeg" style="width: 40px;height: 40px;border-radius: 10px;">
<%}else{ %>
<img  src="img/question.png" style="width: 40px;height: 40px;border-radius: 10px;">
<%} %>
	<a style="font-size: 25px;font-weight: bold;color:#444;"><%=abean.getId()%>님 답변</a>
	<%if(id.equals(bean.getId())&&bean.getChoice()==null){ %> <!-- 채택 안했다면 채택버튼 -->
<button type="button" class="okbtn" onclick="location.href='choice.jsp?anum=<%=abean.getAnum()%>&qnum=<%=qnum%>'">채택하기!</button>
<%}%>
	<a style="margin-left: 300px;">[<%=abean.getGrade() %> 등급]</a></td></tr>
<tr><td id="<%=aid%>" width="800px"style="display:block;
padding-top: 50px;padding-bottom: 50px;border-bottom: 2px solid #40c700;"><pre><%=abean.getContent() %></pre></td></tr>


<form method="post" action="naver_answer_up.jsp">
<tr><td style="padding-top: 20px;"><textarea cols="110" rows="15" id="<%=1000+aid%>"
 style="display:none;background-color: aliceblue;" name="content"><%=abean.getContent()%></textarea>
 </td></tr>
 <tr><td>
<span id="btnspan"><input type="submit" value="수정하기" id="<%=10000+aid%>" class="upbtn"></span>
 <span id="btnspan">
 <input type="button" value="취소하기" id="<%=11000+aid%>" class="cbtn" onclick="update(<%=aid%>)"></span>
 <input type="hidden" value="<%=abean.getAnum()%>" name="anum">
 <input type="hidden" value="<%=qnum%>" name="qnum">
 </td></tr>
 </form>
 
 
<tr><td  align="right" style="padding-bottom:50px;">
<%if(id.equals(abean.getId())){ %> <!-- 자신이 쓴답글은 수정 삭제 -->
	<a id="tag" href="javascript:update(<%=aid%>)">[수정]</a>
	<a id="tag" href="delete_a.jsp?anum=<%=abean.getAnum()%>&qnum=<%=qnum%>">[삭제]</a>
	<%} %>
		<script>
		document.write(Cal('<%=abean.getDate()%>'));  //날짜계산함수
		</script>
		</td></tr>
</table>
</div>
<%} %>
</div>

<form method="post" name="downFrm" action="download.jsp">
	<input type="hidden" name="filename">
</form>

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
</body>
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
