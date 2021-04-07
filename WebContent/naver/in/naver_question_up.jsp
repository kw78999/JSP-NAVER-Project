<%@page import="java.util.Vector"%>
<%@page import="in.TagBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.QuestionBean"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="tmgr" class="in.TagMgr" />
<%
		request.setCharacterEncoding("UTF-8");
		int qnum=0;
		if(request.getParameter("qnum")!=null){
		qnum = Integer.parseInt(request.getParameter("qnum"));
		}
		String id = (String)session.getAttribute("id");
	  QuestionBean bean = (QuestionBean)session.getAttribute("bean");
	  Vector<TagBean> tlist = tmgr.getTag();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
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
#tagaddbtn{
color:#40c700;
width: 100px;
height: 50px;
background-color:white;
border: 2px solid #777;
 border-radius: 7px;
 display:block;
 cursor: pointer;
 margin-left: 370px;
 margin-top: -40px;
}
#tagaddbtn:hover{background-color: aliceblue;}
.tagBtn{
cursor:pointer;
 width :15px;
height:15px;
background:url("img/x.png");
background-size:15px 15px;
border:0;
outline:0;
margin-left: 5px;
}
.tagli{
float: left;
 margin-left: 20px;
 margin-top:10px;
 list-style: none;
font-size:20px;
}
#sharp{
position: absolute;
left:14px;
top:7px;
font-weight: bold;
color: #40c700;
}
#myInput{
width: 250px;
height: 30px;
padding-left: 30px;
}
.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
  margin-top: 30px;
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  top: 100%;
  left: 0;
  right: 0;
}
.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff;
  border-bottom: 1px solid #d4d4d4;
}
.autocomplete-items div:hover {
  background-color: #40c700;
  color:white;
}
.autocomplete-active {
  background-color: DodgerBlue !important;
  color: #ffffff;
}

input[type="radio"] {
    display:none;
}
input[type="radio"]:hover +  label span{
 border:2px solid #40c700;
}
input[type="radio"] + label span {
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    border:2px solid gray;
    cursor:pointer;
}
input[type="radio"]:checked + label span {
 border:2px solid #40c700;
    background:url(img/check.jpg) top no-repeat;
    background-size: cover;
}
input[type="radio"]:checked + label{
color:#40c700;
font-weight: bold;
}

#body{
background-color: #eee;
}
#title{
margin-left: 100px;
position: relative;
width: 900px;
height: 100%;
background-color:white;
margin: 30px auto;
border: 1px solid #aaa;
}
#titletext{
width: 590px;
height: 40px;
 position: absolute;
    top: 70px;
    left: 220px;
    border: 2px solid #888;
    
}
#titletext:focus {
	border: 2px solid #40c700;
	outline: none;
}
#textarea{
margin-left: 100px;
margin-top: 30px;
}
#ta{
background-color: aliceblue;
border: 2px solid #888;
width: 88%;
}
#ta:focus{
border: 2px solid #40c700;
outline: none;
}
#next{
color:#40c700;
width: 100px;
height: 50px;
background-color:white;
border: 2px solid #777;
 border-radius: 7px;
 margin-bottom:50px;
 margin-left:300px;
 cursor: pointer;
}
#next:hover{
background-color: aliceblue;
}
#tag{
border: 1px solid #888;
width: 720px;
height: 100px;
display:none;
}
#tag:hover{
border: 2px solid #40c700;
}
#taglabel{
margin-left:20px;
font-weight: bold;
font-size: 20px;
}
#tagtext{
margin-top:30px;
width: 400px;
height: 30px;
}
#add{
background-color: white;
border: 1px solid #ccc;
width:80px;
height: 40px;
outline: none;
cursor: pointer;
}
#point{
border: 1px solid #888;
width: 720px;
height: 100px;
margin-top: 50px;
display:none;
}
#point:hover{
border: 2px solid #40c700;
}
#pointlabel{
margin-left:20px;
font-weight: bold;
font-size: 20px;
}
#pointtext{
margin-top:30px;
width: 400px;
height: 30px;
}
#addpoint{
background-color: white;
border: 1px solid #ccc;
width:80px;
height: 40px;
outline: none;
cursor: pointer;
}
#directory{
border: 1px solid #888;
width: 720px;
height: 310px;
margin-top: 50px;
display:none;
}
#directory:hover{
border:2px solid #40c700;
}
#directory label{
font-size: 20px;
}
#directory label:hover{
color:#40c700;
font-weight:bold;
}
#directory label:focus{
color:red;
}
radio:hover{
background-color: red;
}
#submit{
color:#40c700;
width: 100px;
height: 50px;
background-color:white;
border: 2px solid #777;
 border-radius: 7px;
 display:block;
 cursor: pointer;
 margin-left: 300px;
 margin-top: 50px;
 margin-bottom: 50px;
 display:none;
}
.fileimg{
width: 200px;
height: 200px;
border:3px solid white;
}
#debtn{
 width: 80px;
 height: 30px;
margin-left: 10px;
margin-bottom: 200px;
background-color: brown;
color:white;
border: 2px solid #888;
border-radius: 5px;
}
#debtn:hover{
background-color: orange;
cursor: pointer;
}
#debtn2{
 width: 80px;
 height: 30px;
margin-left: 10px;
margin-bottom: 200px;
background-color: brown;
color:white;
border: 2px solid #888;
border-radius: 5px;
}
#debtn2:hover{
background-color: orange;
cursor: pointer;
}
.oldfiledata{
	border:3px solid #40c700;
	width: 205px;
	height: 30px;
	}
#submit:hover{background-color: aliceblue;}
#image_container{display: none;}
#image_container2{display:none;}
#s1{float:left;width:33%;margin-left: 10px;margin-top: 20px;}
#s2{float:left;width:33%;margin-top: 20px;}
#s3{float:left;width:30%;margin-top: 20px;}

.filebox input[type="file"] {
 /* 파일 필드 숨기기 */ position: absolute;
  width: 1px; height: 1px; padding: 0;
   margin: -1px; overflow: hidden;
    clip:rect(0,0,0,0); border: 0; }
    
.filebox label {
 width:50px;
 display: inline-block;
 padding: .5em .75em;
 color: #40c700; font-size: inherit;
 line-height: normal;
 vertical-align: middle;
 background-color: #fdfdfd;
 cursor: pointer;
 border: 2px solid #777;
 border-radius: .25em; }
 
 .filebox label:hover{
 background-color: aliceblue;
 }
.filebox .upload-name {
 display: inline-block;
 padding: .5em .75em;
 /* label의 패딩값과 일치 */ font-size: inherit;
 font-family: inherit;
 line-height: normal;
 vertical-align: middle;
 background-color: #f5f5f5;
 border: 1px solid #ebebeb;
 border-bottom-color: #e2e2e2;
 border-radius: .25em;
 -webkit-appearance: none;
 /* 네이티브 외형 감추기 */ -moz-appearance: none;
 appearance: none; }
  
.filebox .upload-name2 {
 display: inline-block;
 padding: .5em .75em;
 /* label의 패딩값과 일치 */ font-size: inherit;
 font-family: inherit;
 line-height: normal;
 vertical-align: middle;
 background-color: #f5f5f5;
 border: 1px solid #ebebeb;
 border-bottom-color: #e2e2e2;
 border-radius: .25em;
 -webkit-appearance: none;
 /* 네이티브 외형 감추기 */ -moz-appearance: none;
 appearance: none; 	}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

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
function delthis(obj) {
	$(obj).parent().remove();
}
function addTag() {
	var e = document.getElementById("myInput").value;
	document.getElementById("myInput").value = "";
	document.getElementById("myInput").focus();
	
	btn=document.createElement("button");
    btn.setAttribute("type","button");
    btn.setAttribute("class","tagBtn");
    btn.setAttribute("onclick","delthis(this);");
    
    h= document.createElement("input");
    h.setAttribute("type","hidden");
    h.setAttribute("name","tag");
    h.setAttribute("value", "#"+e);
    
     var t = document.getElementById("tag");
     
     if(document.getElementById("tagul")==null){     //ul은 한번만 만든다
     	  var s = document.createElement("ul");
        	t.appendChild(s);
     }else{
   	  var s = document.getElementById("tagul");
     }
     
     if(s.childElementCount<5){   //5개인지 검사후 이하면 생성 
     var s1 = document.createElement("li");
     t.style.height="165px";
     s.id="tagul";
     s1.setAttribute("class","tagli");
     
     var span=document.createElement("span");
     
     span.style.backgroundColor="rgb(119,188,215,0.4)";
     span.style.color="#555";
     span.id ="spanid";
     span.innerHTML = "<b>#</b>"+e;
     
     
     s.appendChild(s1);        //ul에 li부착
     s1.appendChild(span);   //li에 span 부착
     s1.appendChild(btn);    //li에 btn 부착
     s1.appendChild(h);
     }else{
   	  alert("태그는 5개 까지만 선택가능 합니다.");
     }
     
}


function td1c() {
	var e3 =document.getElementById("tdd1");
	e3.style.color="red";
}
function td2c() {
	var e4 =document.getElementById("tdd1");
	e4.style.color="#000";
}
function td3c() {
	var e3 =document.getElementById("tdd2");
	e3.style.color="red";
}
function td4c() {
	var e34 =document.getElementById("tdd2");
	e34.style.color="#000";
}
function deleteT() {
	
	$(".td1").remove();
	var input11 = document.createElement('input');
	input11.setAttribute("type","hidden");
	input11.setAttribute("name","delete");
	input11.setAttribute("value","delete");
	
	var fr = document.getElementById("tag");
	fr.appendChild(input11);
	
}
function deleteT2() {
	$(".td2").remove();
	var input12 = document.createElement('input');
	input12.setAttribute("type","hidden");
	input12.setAttribute("name","delete2");
	input12.setAttribute("value","delete");
	
	var fr = document.getElementById("tag");
	fr.appendChild(input12);
}
function setThumbnail(event) {
	 
	var reader = new FileReader();
	reader.onload = function(event) {
		
		var md = document.getElementById("mfile");
		md.style.height="400px";
		var view = document.getElementById("image_container");
		view.style.display="block";
		var view = document.getElementById("fileup2");
		view.style.display="block";
		
			var img = document.getElementById("imgtest");
			img.setAttribute("src", event.target.result);
			//document.querySelector("div#image_container").appendChild(img);
		 
		};
		reader.readAsDataURL(event.target.files[0]);
		}
 function setT() {
	 var md = document.getElementById("mfile");
		md.style.height="100px";
		var view = document.getElementById("image_container");
		view.style.display="none";
		var view = document.getElementById("fileup2");
		view.style.display="block";
}
 function setThumbnail2(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var view = document.getElementById("image_container2");
			view.style.display="block";
			var md = document.getElementById("mfile");
			md.style.height="400px";
				var tt = document.getElementById("imgtest2");
				tt.setAttribute("src", event.target.result);
				//document.querySelector("div#image_container2").appendChild(img);
			 
			};
			reader.readAsDataURL(event.target.files[0]);
			}
 
 
 function setT2() {
	 var md = document.getElementById("mfile");
		md.style.height="100px";
		var view = document.getElementById("image_container2");
		view.style.display="none";
}
 
 
$(document).ready(function(){
	var fileTarget = $('.filebox .upload-hidden');
	var fileTarget2 = $('.filebox .upload-hidden2');
	$("input:radio[name='directory']:radio[value='<%=bean.getDirectory()%>']").prop('checked', true); // 카테고리 선택하기
	
	fileTarget.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
			}
		$(".td1").remove();
		
	var fileType=filename.substring(filename.length-3,filename.length); //파일확장자 추출
	var ktype2="";
	if(document.getElementById('disnone2').value!=null){
	var  k2 = document.getElementById('disnone2').value;
	 ktype2=k2.substring(k2.length-3,k2.length);
	}
	
	if(fileType=='jpg'||fileType=='png'){   //파일확장자 검사하여 미리보기 끄고 켜기
		setThumbnail(event);
	}else{
		if(ktype2=='jpg'||ktype2=='png'){
			var view2 = document.getElementById("image_container");
			view2.style.display="none";
		}else{
		setT();
		}
	}
	// 추출한 파일명 삽입
	$(this).siblings('.upload-name').val(filename);
	});
	
	fileTarget2.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser
			var filename2 = $(this)[0].files[0].name;
		} else { // old IE
			var filename2 = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
			}
		$(".td2").remove();
		
		var fileType2=filename2.substring(filename2.length-3,filename2.length); //파일확장자 추출
		var  k = document.getElementById('disnone').value;
		var ktype=k.substring(k.length-3,k.length);
		
	
		
		if(fileType2=='jpg'||fileType2=='png'){   //파일확장자 검사하여 미리보기 끄고 켜기
			setThumbnail2(event);
		}else{
			if(ktype=='jpg'||ktype=='png'){
					var view = document.getElementById("image_container2");
					view.style.display="none";
			}else{
			setT2();
			}
		}
	
	// 추출한 파일명 삽입
	$(this).siblings('.upload-name2').val(filename2);
	});
	
	});
	
window.onload = function () {  //수정시에는 next함수 바로 실행
	next();
}
function next() {
	var e = document.getElementById("next");
	e.style.display = 'none';
	var e = document.getElementById("tag");
	e.style.display = 'block';
	var e = document.getElementById("directory");
	e.style.display = 'block';
	var e = document.getElementById("point");
	e.style.display = 'block';
	var e = document.getElementById("submit");
	e.style.display = 'block';
}
function titleCheck() {
	var e = document.getElementById("titletext");
	
	if(e.value.length<5){
		if(document.getElementById("textcheck")==null){
		var text = document.createElement("p");
		text.id = "textcheck";
		text.innerHTML="제목이 너무 짧습니다. (5자 이상)";
		text.style.color="brown";
		text.style.marginLeft="220px";
		document.querySelector("div#titlediv").appendChild(text);
		}
	}else{
		if(document.getElementById("textcheck")!=null){
			$("p").remove();
		}
	}
	
}
function dir(id) {
	var e = document.getElementById(id);
	e.style.color = '#40c700'; 
}
function checkAll() {
	if(!checkTitle(Frm.title.value)){  //제목 검사
		return false;
	}
	if(!checkContent(Frm.content.value)){  //내용 검사
		return false;
	}
}
//데이터가 공백인자 검사
function checkExistData(value,dataname) {
	if(value==""){
		alert(dataname+" 입력해주세요.");
		return false;
	}
	return true;
}
//제목 길이 검사
function checkTitle(title) {
		if(!checkExistData(title,"제목을"))
			return false;
	
		if(title.length<5){
		alert("제목이 너무 짧습니다.");
		return false;
		}
	return true;
}
function checkContent(con) {
	if(!checkExistData(con,"내용을"))
		return false;
	
	if(con.length<5){
		alert("내용이 너무 짧습니다.");
		return false;
	}
	return true;
}
</script>
</head> 
<body>
<%@ include file="header.jsp" %>
<div id="body">  
<form id="Frm" method="post" action="question_up" enctype="multipart/form-data" onsubmit="return checkAll();">
<input type="hidden" value="<%=id%>" name="id">
<hr style="margin-top:0px;margin-bottom: 20px;">
<div id="title">
<div id="titlediv">
<img  src="img/question.png" style="width: 40px;height: 40px;margin-top: 70px;
margin-left:100px;border-radius: 10px;">
<a style="font-size: 23px;color:#40c700;font-weight: 900;">질문</a>
<input type="text" name="title" id="titletext" onblur="titleCheck()" value="<%=bean.getTitle()%>"  autocomplete="off">
</div>
<div id="textarea">
<textarea id="ta" rows="25" cols="102"
 name="content"><%=bean.getContent()%></textarea><br>
 
 <table id="asa">
<%if(bean.getFilename()!=null&&!bean.getFilename().equals("")){%>
	<tr><td width="210px" style="padding-top: 50px;">
	
	<span class="td1" id="tdd1">
	원본 파일명 : <%=bean.getFilename()%><br>
	<%String f1 = bean.getFilename();
	String fn1 = f1.substring(f1.length()-3,f1.length());
	if(fn1.equals("jpg")||fn1.equals("png")){%>
	<img class="fileimg" src="/naverimg/<%=bean.getFilename()%>"
	 onclick="doImgPop('/naverimg/<%=bean.getFilename()%>')"><br><%} %>
	 <input type="text"  autocomplete="off" class="oldfiledata" name="ofiledata" placeholder="이미지 정보" value="<%=bean.getFiledata()%>">
	</span>
	</td>
	<td width="200px" style="margin-top: -100px;"><button type="button"
    id="debtn" onclick="deleteT()" onmouseover="td1c()" onmouseout="td2c()"     class="td1">Delete</button></td>
	<%}else{ %>
	<tr><td width="410px" style="padding-top: 50px;" >
	<span class="td1" height="200px"></span><td>
		 <%} %>
	
	
	
	<%if(bean.getFilename2()!=null&&!bean.getFilename2().equals("")){%>
	<td style="padding-top: 50px;"  class="td2">
	
	<span  class="td2" id="tdd2">
	원본 파일명 : <%=bean.getFilename2()%><br>
	<%String f2 = bean.getFilename2();
	String fn2 = f2.substring(f2.length()-3,f2.length());
	if(fn2.equals("jpg")||fn2.equals("png")){%> 
	<img  class="fileimg" src="/naverimg/<%=bean.getFilename2()%>" 
	onclick="doImgPop('/naverimg/<%=bean.getFilename2()%>')"><br><%} %>
	 <input type="text"   autocomplete="off" class="oldfiledata" name="ofiledata2" placeholder="이미지 정보" value="<%=bean.getFiledata2()%>">
	</span>
	</td>
	<td  width="100px" style="margin-top: -100px;"><button type="button" id="debtn2" 
	onclick="deleteT2()" onmouseover="td3c()" onmouseout="td4c()" class="td2">Delete</button></td>
	<% }%>
	</tr></table>
	
	
<h2 style="margin-top: 50px;">파일 수정하기</h2>
<div id="mfile" style="width: 720px;height:100px;margin-bottom:50px;">

<div class="filebox" style="float: left;" > 
<input type="text" class="upload-name" value="파일명" disabled="disabled" id="disnone">
<label for="ex_filename">업로드</label> 
<input type="file" id="ex_filename" class="upload-hidden" name="filename1">
 <div id="image_container" style="width: 285px;height: 300px;">
 <img src="img/question.png" style="width: 285px;height: 300px;" id="imgtest">
<input type="text"  autocomplete="off" name="filedata" style="width: 275px;height:30px;border:3px solid #40c700;" placeholder="이미지 정보입력">
 
 </div>
 </div>
 
 <div class="filebox" style="float:right;" id="fileup2">
<input type="text" class="upload-name2" value="파일명" disabled="disabled" id="disnone2">
<label for="ex_filename2">업로드</label> 
<input type="file" id="ex_filename2" class="upload-hidden2" name="filename2">
 <div id="image_container2" style="width: 285px;height: 300px;">
 <img style="width: 285px;height: 300px;" id="imgtest2">
 <input type="text"  autocomplete="off" name="filedata2"  style="width: 275px;height:30px;border:3px solid #40c700;" placeholder="이미지 정보입력">
 
</div>
</div>

</div>

<div id="tag">
<a id="taglabel" style="margin-top: 20px;">태그</a> 
<form  action="">
  <div class="autocomplete" style="width:300px;">
  <span id="sharp">#</span>
    <input id="myInput" type="text" name="myCountry" placeholder="Tag" autocomplete="off">
  </div>
  <button type="button" onclick="addTag()" id="tagaddbtn">태그 추가</button>
  <%if(bean.getTag()!=null){ 
	  ArrayList<String> tar = new ArrayList<String>();
	  String[] tar2 = bean.getTag().split("#");
	  for(int q =1;q<tar2.length;q++){
  	tar.add("'"+tar2[q]+"'");
  	}%>
	       
	
  <script>
  var tarry = <%=tar%>;
	for(var i=0;i<tarry.length;i++) { 
  var t = document.getElementById("tag");
  t.style.height="165px";
  
  btn=document.createElement("button");
  btn.setAttribute("type","button");
  btn.setAttribute("class","tagBtn");
  btn.setAttribute("onclick","delthis(this);");
  if(document.getElementById("tagul")==null){
  var s = document.createElement("ul");
  t.appendChild(s);
  }else{
	  var s = document.getElementById("tagul");
  }
          var s1 = document.createElement("li");
          t.style.height="175px";
          s.id="tagul";
          s1.setAttribute("class","tagli");
          
          var span=document.createElement("span");
          
          span.style.backgroundColor="rgb(119,188,215,0.4)";
          span.style.color="#555";
          span.id ="spanid";
          span.innerHTML = "<b>#</b>"+tarry[i];
          
          h= document.createElement("input");
          h.setAttribute("type","hidden");
          h.setAttribute("name","tag");
          h.setAttribute("value", "#"+tarry[i]);
          
          
          s.appendChild(s1);        //ul에 li부착
          s1.appendChild(span);   //li에 span 부착
          s1.appendChild(btn);    //li에 btn 부착
          s1.appendChild(h);
          
	  }
	
  </script>
  
  <%}%>
</form>
</div>

<%
ArrayList<String> tarr = new ArrayList<String>();
ArrayList<String> tarri = new ArrayList<String>();
for(int l =0;l<tlist.size();l++){
TagBean tbean = tlist.get(l);
tarr.add("'"+tbean.getTag()+"'");
tarri.add("'"+tbean.getTagInfo()+"'");
}%>

<script>

var tarr2 = <%=tarr%>;
var taginfo = <%=tarri%>;


function autocomplete(inp) {
	  var currentFocus;
	  
	  inp.addEventListener("input", function(e) {
	      var a, b, i, val = this.value;
	      closeAllLists();
	      if (!val) { return false;}
	      currentFocus = -1;
	      a = document.createElement("DIV")
	      a.setAttribute("id", this.id + "autocomplete-list");
	      a.setAttribute("class", "autocomplete-items");
	      this.parentNode.appendChild(a);   
	      
	      
	      for (i = 0; i <<%=tarr.size()%>; i++) {
	    	  
	      
	    	  if(a.childElementCount<10){   //10개인지 검사후 이하면 생성 
	        if (tarr2[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
	          b = document.createElement("DIV");
	          
	          b.innerHTML = "# <strong>" + tarr2[i].substr(0, val.length) + "</strong>";
	          b.innerHTML += tarr2[i].substr(val.length);
	          b.innerHTML += "<a style='align:right;font-size:3px;color:#777'>__"+taginfo[i]+"</a>"
	          b.innerHTML += "<input type='hidden' value='" +tarr2[i] + "'>";
	      
	          btn=document.createElement("button");
	          btn.setAttribute("type","button");
	          btn.setAttribute("class","tagBtn");
	          btn.setAttribute("onclick","delthis(this);");
	          
	       
	          
	              b.addEventListener("click", function(e) {

	            	  inp.value = "";
	            	  inp.focus();
		              var t = document.getElementById("tag");
		              
		              if(document.getElementById("tagul")==null){     //ul은 한번만 만든다
		              	  var s = document.createElement("ul");
		                 	t.appendChild(s);
		              }else{
		            	  var s = document.getElementById("tagul");
		              }
		              
		              if(s.childElementCount<5){   //5개인지 검사후 이하면 생성 
		              var s1 = document.createElement("li");
		              t.style.height="175px";
		              s.id="tagul";
		              s1.setAttribute("class","tagli");
		              
		              var span=document.createElement("span");
		              
		              span.style.backgroundColor="rgb(119,188,215,0.4)";
		              span.style.color="#555";
		              span.id ="spanid";
		              span.innerHTML = "<b>#</b>"+this.getElementsByTagName("input")[0].value;
		              
		              h= document.createElement("input");
			          h.setAttribute("type","hidden");
			          h.setAttribute("name","tag");
			          h.setAttribute("value", "#"+this.getElementsByTagName("input")[0].value);
		              
			          
		              s.appendChild(s1);        //ul에 li부착
		              s1.appendChild(span);   //li에 span 부착
		              s1.appendChild(btn);    //li에 btn 부착
		              s1.appendChild(h);
		              }else{
		            	  alert("태그는 5개 까지만 선택가능 합니다.");
		              }
		              
		              closeAllLists();
		         	  });
	              
	              
	          a.appendChild(b);
	        }}
	      }
	  });
	  
	
	  inp.addEventListener("keydown", function(e) {
	      var x = document.getElementById(this.id + "autocomplete-list"); 
	      if (x) x = x.getElementsByTagName("div");
	      if (e.keyCode == 40) {
	        currentFocus++;
	        addActive(x);
	      } else if (e.keyCode == 38) { 
	        currentFocus--;
	        addActive(x);
	      } else if (e.keyCode == 13) {
	        e.preventDefault();
	        if (currentFocus > -1) {
	          if (x) x[currentFocus].click();
	        }
	      }
	  });
		
		
		
	  function addActive(x) {
	    if (!x) return false;
	    removeActive(x);
	    if (currentFocus >= x.length) currentFocus = 0;
	    if (currentFocus < 0) currentFocus = (x.length - 1);
	    x[currentFocus].classList.add("autocomplete-active");
	  }
	  
	  
	  
	  function removeActive(x) {
	    for (var i = 0; i < x.length; i++) {
	      x[i].classList.remove("autocomplete-active");
	    }
	  }
	  
	  
	  function closeAllLists(elmnt) {
	    var x = document.getElementsByClassName("autocomplete-items");
	    for (var i = 0; i < x.length; i++) {
	      if (elmnt != x[i] && elmnt != inp) {
	      x[i].parentNode.removeChild(x[i]);
	    }
	  }
	}
	  
	  
	document.addEventListener("click", function (e) {
	    closeAllLists(e.target);
	});
	}

autocomplete(document.getElementById("myInput"));
</script>

<div id="directory">
<h2 style="margin-left: 30px;">카테고리</h2>
<hr style="width: 80%;height: 3px;">
<span id="s1">
<input type="radio" id="1" name="directory" value="교육,학문">
<label for="1" id="l1"><span></span>교육,학문</label><br>
<input type="radio" id="2" name="directory" value="컴퓨터통신">
<label for="2"><span></span>컴퓨터통신</label><br>
<input type="radio" id="3" name="directory" value="게임">
<label for="3"><span></span>게임</label><br>
<input type="radio" id="4" name="directory" value="엔터테이먼트,예술" >
<label for="4"><span></span>엔터테이먼트,예술</label><br>
<input type="radio" id="5" name="directory" value="생활" >
<label for="5"><span></span>생활</label><br>
<input type="radio" id="6" name="directory" value="건강">
<label for="6"><span></span>건강</label><br>
<input type="radio" id="7" name="directory" value="사회,정치" >
<label for="7"><span></span>사회,정치</label><br>
</span>
<span id="s2">
<input type="radio" id="8" name="directory" value="경제">
<label for="8"><span></span>경제</label><br>
<input type="radio" id="9" name="directory" value="여행">
<label for="9"><span></span>여행</label><br>
<input type="radio" id="10" name="directory" value="스포츠,레저">
<label for="10"><span></span>스포츠,레저</label><br>
<input type="radio" id="11" name="directory" value="쇼핑" >
<label for="11"><span></span>쇼핑</label><br>
<input type="radio" id="12" name="directory" value="연애,결혼" >
<label for="12"><span></span>연애,결혼</label><br>
<input type="radio" id="13" name="directory" value="자동차">
<label for="13"><span></span>자동차</label><br>
<input type="radio" id="14" name="directory" value="직업,취업" >
<label for="14"><span></span>직업,취업</label><br>
</span>
<span id="s3">
<input type="radio" id="15" name="directory" value="안드로이드폰">
<label for="15"><span></span>안드로이드폰</label><br>
<input type="radio" id="16" name="directory" value="사람과 그룹" >
<label for="16"><span></span>사람과 그룹</label><br>
<input type="radio" id="17" name="directory" value="대학 입시,진학">
<label for="17"><span></span>대학 입시,진학</label><br>
<input type="radio" id="18" name="directory" value="자동차구입" >
<label for="18"><span></span>자동차구입</label><br>
<input type="radio" id="19" name="directory" value="모바일게임" >
<label for="19"><span></span>모바일게임</label><br>
<input type="radio" id="20" name="directory" value="영어 공부,시험">
<label for="20"><span></span>영어 공부,시험</label><br>
<input type="radio" id="21" name="directory" value="스마트폰">
<label for="21"><span></span>스마트폰</label><br>
</span>
</div>

<div id="point">
<a id="pointlabel">추가내공</a> <input type="text" id="pointtext" name="point"   autocomplete="off"  value="<%=bean.getPoint()%> (내공은 수정할수 없습니다.)" disabled>
<input type="button" value="추가" id="addpoint">
</div>

<input type="submit" id="submit" value="수정하기">
</div><!-- title -->
 <input type='hidden' name="qnum" value="<%=qnum%>">
</form>
</div><!-- body -->
<button id="next" onclick="next()">다음</button>









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
			<tr>
		<td colspan="4" align="center" style="border-top: 1px solid #888;" onclick="location.href='logout.jsp'">로그아웃</td>
		</tr>
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