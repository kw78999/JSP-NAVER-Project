<%@page import="member.MemberBean"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<jsp:useBean id="bean" class="member.MemberBean" />
<%
if(session.getAttribute("id")==null){
	response.sendRedirect("../member/login.jsp?returnPage=../in/naver_question.jsp");
}else{
	String id =(String)session.getAttribute("id");

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
#chartdiv {
  width:100%;
  height: 300px;
  margin-left: 50px;
  margin-top: -100px;
}
</style>
<script type="text/javascript">
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

</script>
</head>
<body>
<%@ include file="header.jsp" %> 
<div id="body">
<hr style="margin-top:0px;margin-bottom: 0px;">
</div>

<div style="background: #ddd;height: 700px;">
<div style="width: 1000px;height: 700px;background: white;margin: 0px auto;">

<h1 align="center"><%=id %> 님의 프로필</h1>
<hr style="width: 70%;height: 5px;margin-right: 150px;">

<table style="margin-left: 190px;border-spacing: 0px;margin-bottom: 0px;margin-top: 30px;">
<tr align="center">
<td class="mtd" id="mtd3"  >나의 내공</td>
<td class="mtd" onclick="location.href='profile.jsp'">나의 질문</td>
<td class="mtd" onclick="location.href='profile3.jsp'">나의 답변</td></tr>
</table>

<div style="height: 650px;margin-left: 150px;margin-top: 60px;">

 <%bean = mgr.memberRead(id); %>
<h1>나의 내공&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp내공 통계</h1>
<table >
<tr><td>내공 </td><td><font  color="#40c700" ><b><%=bean.getInPoint() %></b></font>점</td></tr>
<tr><td>랭킹 </td><td><font  color="#40c700" ><b><%=bean.getGender() %>위</b></font> (102명중)</td></tr>
<tr><td>상위 </td><td><font  color="#40c700" ><b>0.9%</b></font></td></tr>
</table>  







<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv", am4charts.PieChart);

// Add data
chart.data = [ {
  "country": "10M이상",
  "litres": 25
}, {
  "country": "5M이상",
  "litres": 100
}, {
  "country": "1M이상",
  "litres": 160
}, {
  "country": "1000이상",
  "litres": 132
}
];

// Add and configure Series
var pieSeries = chart.series.push(new am4charts.PieSeries());
pieSeries.dataFields.value = "litres";
pieSeries.dataFields.category = "country";
pieSeries.slices.template.stroke = am4core.color("#fff");
pieSeries.slices.template.strokeOpacity = 1;

// This creates initial animation
pieSeries.hiddenState.properties.opacity = 1;
pieSeries.hiddenState.properties.endAngle = -90;
pieSeries.hiddenState.properties.startAngle = -90;

chart.hiddenState.properties.radius = am4core.percent(0);


}); // end am4core.ready()
</script>

<!-- HTML -->
<div id="chartdiv"></div>


</div>
</div>
</div>

<%@ include file="footer.jsp" %>
<%} %>
</body>
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