<%@page import="in.AnswerBean"%>
<%@page import="in.UtilMgr"%>
<%@page import="java.util.Vector"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<jsp:useBean id="bean" class="in.AnswerBean" />
<% 
		request.setCharacterEncoding("UTF-8");
if(session.getAttribute("id")==null){
	response.sendRedirect("../member/login.jsp?returnPage=../in/naver_question.jsp");
}else{
	String id =(String)session.getAttribute("id");
	
	 int totalRecord = 0;//총게시물수
		int numPerPage = 5;//페이지당 레코드 개수(5,10,15,30)
		int pagePerBlock = 5;//블럭당 페이지 개수
		int totalPage = 0;//총 페이지 개수 
		int totalBlock =0;//총 블럭 개수
		int nowPage2 = 1;//현재 페이지 
		int nowBlock = 1;//현재 블럭
		
		double choiceCnt=mgr.getIdChoiceCount(id); 
		totalRecord = mgr.getId2Count(id);
		
		if(request.getParameter("nowPage2")!=null){
			nowPage2 = UtilMgr.parseInt(request, "nowPage2");
		}
		//sql문에 들어가는 start,cnt선언 
		int start =  (nowPage2*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		//전체페이지 개수
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//전체블럭 개수
		 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//현재블럭
		nowBlock = (int)Math.ceil((double)nowPage2/pagePerBlock);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필</title>
<link href="header5.css" rel="stylesheet" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Bad Script' rel='stylesheet' type='text/css'> 
<style>
@media ( max-width: 1650px ) {
 .submenubar{width:100%}
}
@media( max-width: 1024px){
  #call{display: none;}
  .menubar{display: none;}
  #mainbanner{ width: 88%;}
}
 #page{
 width: 70px;
 height: 50px;
 padding:7px;
 border: 3px solid white;
 text-decoration: none;
 color:#888;
 }
#page:hover{
border: 3px solid #ccc;
color:blue;
cursor: pointer;
}
.trc{
cursor: pointer;
}
.trc:hover{
background: aliceblue;
}
.mtd{
background: white;
color:#888;
width: 200px;
height: 50px;
font-weight: bold;
font-size: 23px;
cursor: pointer;
border: 3px solid #40c700;

}
.mtd:hover{
background: #40c700;
color:white;
}
#mtd3{
background: #40c700;
color:white;
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
function block(block) {
	document.readFrm2.nowPage2.value=<%=pagePerBlock%>*(block-1)+1;
	document.readFrm2.submit();
}
function pageing(page) {
	document.readFrm2.nowPage2.value=page;
	document.readFrm2.submit();
}
</script>
</head>
<body>
<%@ include file="header.jsp" %> 
<div id="body">
<hr style="margin-top:0px;margin-bottom: 0px;">
</div>

<div style="background: #ddd;height: 800px;">
<div style="width: 1000px;height: 800px;background: white;margin: 0px auto;">
<h1 align="center"><%=id%> 님의 프로필</h1>
<hr style="width: 70%;height: 5px;margin-right: 150px;">

<table style="margin-left: 190px;border-spacing: 0px;margin-bottom: 0px;margin-top: 30px;">
<tr align="center">
<td class="mtd" onclick="location.href='profile2.jsp'">나의 내공</td>
<td  class="mtd" onclick="location.href='profile.jsp'">나의 질문</td>
<td class="mtd" id="mtd3" >나의 답변</td></tr>
</table>

<div style="height: 650px;margin-left: 110px;margin-top: 30px;width: 810px;">

<h1>나의 답변 총(<%=totalRecord %>)건</h1>
<%int c = (int)(choiceCnt/totalRecord *100);%>
<h3>채택률 :  <font color="#40c700"><%=c %>%</font></h3>

<table style="border-spacing: 0px;width: 100%;">
<tr style="border-bottom: 2px solid #40c700;">
<td width="60px;" style="border-bottom: 2px solid #40c700;
padding-bottom: 20px;"align="center">번호</td>
<td width="400px;" style="border-bottom: 2px solid #40c700;padding-bottom: 20px;padding-left: 10px;">답변 내용</td>
<td width="100px;" style="border-bottom: 2px solid #40c700;padding-bottom: 20px;"align="center">채택 여부</td>
<td width="130px;" style="border-bottom: 2px solid #40c700;padding-bottom: 20px;"align="center">작성 날짜</td>
</tr>
	<% Vector<AnswerBean> vlist = mgr.getMyList2(start,cnt,id);
           for(int i =0;i<vlist.size();i++){ 
           bean = vlist.get(i);%>
<tr class="trc" onclick="location.href='boardRead.jsp?qnum=<%=bean.getQnum()%>'">
<td height="60px;"align="center" style="border-bottom: 2px solid #ccc;"><%=totalRecord-start-i%></td>
<td style="border-bottom: 2px solid #ccc;font-weight: bold;"><%=bean.getContent() %></td>
<td style="border-bottom: 2px solid #ccc;"align="center">
<% if(bean.getChoice()==0){%>
<font color="red" style="font-weight: bold">X</font>
<%}else{ %>
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<%} %>

</td>
<td style="border-bottom: 2px solid #ccc;">
<%=bean.getDate().substring(0,bean.getDate().length()-5)%></td>
</tr>
<%} %> 	
<tr>
<td colspan="4" align="center" height="60px">
<!-- 페이징 및 블럭 Start -->
		<!-- 이전블럭 -->
		<%if(nowBlock>1){%>
		<a id="page" href="javascript:block('<%=nowBlock-1%>')"><%="< "%>이전</a>
			<%} %>
			<!-- 페이징 -->
		<%
		       
				int pageStart = (nowBlock-1)*pagePerBlock+1;
				int pageEnd = (pageStart+pagePerBlock/*10*/)<totalPage?
						pageStart+pagePerBlock:totalPage+1; 
				for(;pageStart<pageEnd;pageStart++){
		%>
		
		<a id="page" href="javascript:pageing('<%=pageStart%>')">
			<%if(nowPage2==pageStart){%><font color="blue"><%}%>
				<%=pageStart%>
			<%if(nowPage2==pageStart){%></font><%}%>
		</a>
		
		<%}//--for%>
		<!-- 다음블럭 -->
			<%if(totalBlock>nowBlock){%>
			
			<a id="page" href="javascript:block('<%=nowBlock+1%>')">다음 ></a>
			<%} %>
		<!-- 페이징 및 블럭 End -->
			</td>
</tr>
</table>
</div>
</div>
</div>

<form name="readFrm2">
	<input type="hidden" name="nowPage2" value="<%=nowPage2%>">
</form>

<%@ include file="footer.jsp" %>
</body>
<%}%>
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