<%@page import="java.util.Vector"%>
<%@page import="in.UtilMgr"%>
<%@page import="in.QuestionBean"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<%request.setCharacterEncoding("UTF-8");
      String searchKey = request.getParameter("searchKey");
      
      int totalTitleCount = 0;//총게시물수
      int totalContentCount= 0;//총게시물수
       
  	int numPerPage = 5;//페이지당 레코드 개수
  	int pagePerBlock = 10;//블럭당 페이지 개수
  	
  	int totalPage = 0;//총 페이지 개수 
  	int totalPage2 = 0;//총 페이지 개수 
  	
  	int totalBlock =0;//총 블럭 개수
  	int totalBlock2 =0;//총 블럭 개수
  	
  	int nowPage11 = 1;//현재 페이지 
  	int nowPage22 = 1;//현재 페이지 
  	
  	int nowBlock = 1;//현재 블럭
  	int nowBlock2 = 1;//현재 블럭
  	
  	//리스트 정렬조건값
	int where=9;
	if(request.getParameter("where")!=null){
		where = Integer.parseInt(request.getParameter("where"));
	}
  	//전체 게시물 갯수 
	totalTitleCount = mgr.getTitleCount(searchKey);
	totalContentCount = mgr.getContentCount(searchKey);
	
	//요청된 페이지 받기
	if(request.getParameter("nowPage11")!=null){
		nowPage11 = UtilMgr.parseInt(request, "nowPage11");
	}
	if(request.getParameter("nowPage22")!=null){
		nowPage22 = UtilMgr.parseInt(request, "nowPage22");
	}
	
	//sql문에 들어갈 limit값 설정 
	int start =  (nowPage11*numPerPage)-numPerPage;
	int cnt = numPerPage;
	int start2 =  (nowPage22*numPerPage)-numPerPage;
	int cnt2 = numPerPage;
	
	
	//전체페이지 개수
	totalPage = (int)Math.ceil((double)totalTitleCount/numPerPage);
	//전체블럭 개수
	 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	//현재블럭
	nowBlock = (int)Math.ceil((double)nowPage11/pagePerBlock);
	//전체페이지 개수2
	totalPage2 = (int)Math.ceil((double)totalContentCount/numPerPage);
	//전체블럭 개수2
	 totalBlock2 = (int)Math.ceil((double)totalPage2/pagePerBlock);
	//현재블럭2
	nowBlock2 = (int)Math.ceil((double)nowPage22/pagePerBlock);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
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
.tagA{
background: rgb(119,188,215,0.3);
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
#body{
 background-color: white;
 padding-bottom: 30px;
 height: 100%;
 }
 #optionTable{
 width:1000px;
 margin: 50px auto;
 }
 #titleTable{
 width:1000px;
 margin: 50px auto;
 border-spacing: 0px;
 }
  #contentTable{
 width:1000px;
 margin: 50px auto;
 border-spacing: 0px;
 }
 .tdcss{
 border-right: 2px solid #aaa;
 color:#aaa;
 }
 li{
 float: left;
 margin-left: 30px;
 font-size: 18px;
 color:#aaaaaa;
 cursor: pointer;
 font-weight:900;
 }
li:hover{
 color:#40c700;
 font-weight: 900;
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
function boardlist(where) {
	document.readFrm15.where.value = where;
	document.readFrm15.submit();
}
function pageing(page) {
	document.readFrm15.nowPage11.value=page;
	document.readFrm15.searchKey.value="<%=searchKey%>";
	document.readFrm15.submit();
}
function block(block) {
	document.readFrm15.nowPage11.value=<%=pagePerBlock%>*(block-1)+1;
	document.readFrm15.searchKey.value="<%=searchKey%>";
	document.readFrm15.submit();
}

function pageing2(page) {
	document.readFrm15.nowPage22.value=page;
	document.readFrm15.searchKey.value="<%=searchKey%>";
	document.readFrm15.submit();
}
function block2(block) {
	document.readFrm15.nowPage22.value=<%=pagePerBlock%>*(block-1)+1;
	document.readFrm15.searchKey.value="<%=searchKey%>";
	document.readFrm15.submit();
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
//텍스트값중 key값은 <b> 처리
function textReplace(text,key) {  
	var key2 = new RegExp(key,"g");
	var retext = text.replace(key2,'<b>'+key+'</b>');
	return retext;
}
//content길이 검색어 부터 180으로 자르기
function contentSubstring(content,key) {
	
	var e = content.indexOf(key);
	
		return content.substring(e,180);
		
}
</script>
</head> 
<%@ include file="header.jsp" %> 
<body>
<div id="body">
<hr style="margin-top:0px;margin-bottom: 20px;">


<table id="optionTable">
<tr><td style="padding-bottom: 5px;"><b><font color="#40c700"><%=searchKey%></font> 에 대한 검색결과 입니다</b></td></tr>
<tr><td  style="border-top: 2px solid #aaa;padding-top: 5px;">
<form name = "whereFrm" method="post">
	<li id="9"  style="margin-left: 10px" onclick="boardlist(9)">최신순</li>
	<li id="7" onclick="boardlist(7)">답변적은순</li>
	<li id="6" onclick="boardlist(6)">내공높은순</li>
	</form>
	<script>
	var w = document.getElementById('<%=where%>');
			w.style.color='#40c700';
			w.style.fontWeight='bold';
	</script>
	</td></tr>
</table>
 
<%Vector<QuestionBean> vlist = mgr.getSearchTitleList(searchKey,start,cnt,where);%>
<table id ="titleTable"> 
<tr><td colspan="5" height="50px"  style="padding-left: 10px;"><b>제목 검색 (총  <%=mgr.getTitleCount(searchKey) %>건)</b></td></tr>
<%if(mgr.getTitleCount(searchKey)==0){ %>
 <tr><td>검색내용이 없습니다.</td></tr>
	<%}else{%>
<%
for(int i=0;i<vlist.size();i++){
	QuestionBean bean = vlist.get(i);
%> 
<tr>
<%if(bean.getFilename()!=null&&!bean.getFilename().equals("")){ %>
<td rowspan="4" width="100px"><img src="fileupload/<%=bean.getFilename()%>" width="100px" height="100px"></td>
<%}else{ %>
<td rowspan="4" width="100px"><img src="img/noimg.jpg" width="100px" height="100px"></td>

<%} %>
<td height="20px;" colspan="4"><a href="boardRead.jsp?qnum=<%=bean.getQnum()%>">
<script>
document.write(textReplace('<%=bean.getTitle()%>','<%=searchKey%>'));
</script></a>
<%if(bean.getPoint()!=0){ %>
		<span style="color:#40c700;font-weight: bold;"> [<%=bean.getPoint() %>]</span>
		<%} %>
		<%if(bean.getFilename()!=null){ %>
		<img  src="img/down.png" style="width: 20px;height: 20px;">
		<%} %> </td></tr>
<tr><td height="50px;" style="word-break:break-all" colspan="4">
<script>
var cont = `<%=bean.getContent()%>`;
document.write(contentSubstring(cont)+'...');
</script>
</td></tr>

<tr><td colspan="4" height="20px;">
<%if(bean.getTag()!=null){
	String[] tagArray = bean.getTag().split("#");
	for(int j=1;j<tagArray.length;j++){  /*0번배열은 공백이므로 1번부터 시작(split 특성)*/%>
	        <a class="tagA"><%="#"+tagArray[j]%></a>&nbsp;&nbsp;&nbsp;
	<%} }%>
</td></tr>

<tr><td width="80px" class="tdcss">조회수 : <%=bean.getHits() %></td>
 <td width="70px"class="tdcss"> &nbsp답변 : <%=bean.getAnswer_count() %></td>
 <td width="120px" class="tdcss">&nbsp&nbsp<script>document.write(Cal('<%=bean.getDate()%>'));</script></td>
<td height="20px;"  style="color:#aaa;">&nbsp&nbspQ&A > <%=bean.getDirectory()%></td>
 </tr>
  <tr><td height="30px"></td></tr>
<%} %>

<tr>
<td colspan="5" align="center">
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
			<%if(nowPage11==pageStart){%><font color="blue"><%}%>
				<%=pageStart%>
			<%if(nowPage11==pageStart){%></font><%}%>
		</a>
		
		<%}//--for%>
		<!-- 다음블럭 -->
			<%if(totalBlock>nowBlock){%>
			
			<a id="page" href="javascript:block('<%=nowBlock+1%>')">다음 ></a>
			<%} %>
		<!-- 페이징 및 블럭 End -->
			</td>
</tr>

<%} %>
</table>


<hr width="70%" style="height: 3px;">

<table id ="contentTable"> 
<%Vector<QuestionBean> vlist2 = mgr.getSearchContentList(searchKey,start2,cnt2,where);%>
<tr><td colspan="5" height="50px" style="padding-left: 10px;"><b>내용 검색 (총  <%=mgr.getContentCount(searchKey) %>건)</b></td></tr>
<%if(mgr.getContentCount(searchKey)==0){ %>
<tr><td>검색내용이 없습니다.</td></tr>
<%}else{ %>
<%for(int i=0;i<vlist2.size();i++){
	QuestionBean bean = vlist2.get(i);
%> 
<tr>
<%if(bean.getFilename()!=null&&!bean.getFilename().equals("")){ %>
<td rowspan="4" width="100px" ><img src="fileupload/<%=bean.getFilename()%>" width="100px" height="100px"></td>
<%}else{ %>
<td rowspan="4" width="100px"><img src="img/noimg.jpg" width="100px" height="100px"></td>

<%} %>
<td height="30px;" colspan="4">
<a href="boardRead.jsp?qnum=<%=bean.getQnum()%>"><%=bean.getTitle()%></a>
<%if(bean.getPoint()!=0){ %>
<span style="color:#40c700;font-weight: bold;" > [<%=bean.getPoint() %>]</span>
<%} %> 
<%if(bean.getFilename()!=null&&!bean.getFilename().equals("")){ %>
<img  src="img/down.png" style="width: 20px;height: 20px;">
<%} %> 
</td></tr>
<tr><td height="50px;" style="word-break:break-all" colspan="4">
<script>
var con = `<%=bean.getContent() %>`;
//본문 내용에서 검색값 부터 시작하도록 자르고 검색값을 bold 처리
document.write("..."+textReplace(contentSubstring(con,'<%=searchKey%>'),'<%=searchKey%>')+"...");   
</script></td></tr>

<tr><td colspan="4" height="20px;">
<%if(bean.getTag()!=null){
	String[] tagArray = bean.getTag().split("#");
	for(int j=1;j<tagArray.length;j++){  /*0번배열은 공백이므로 1번부터 시작(split 특성)*/%>
	        <a class="tagA"><%="#"+tagArray[j]%></a>&nbsp;&nbsp;&nbsp;
	<%} }%>
</td></tr>

<tr><td width="80px" class="tdcss">조회수 : <%=bean.getHits() %></td>
 <td width="70px"class="tdcss"> &nbsp답변 : <%=bean.getAnswer_count() %></td>
 <td width="120px" class="tdcss">&nbsp&nbsp<script>document.write(Cal('<%=bean.getDate()%>'));</script></td>
<td height="20px;"  style="color:#aaa;">&nbsp&nbspQ&A > <%=bean.getDirectory()%></td>
 </tr>
 <tr><td height="30px"></td></tr>
 <%} %>
 <tr>
<td colspan="5" align="center">
<!-- 페이징 및 블럭 Start -->
		<!-- 이전블럭 -->
		<%if(nowBlock2>1){%>
		<a id="page" href="javascript:block2('<%=nowBlock2-1 %>')"><%="< "%>이전</a>
			<%} %>
			<!-- 페이징 -->
		<%
	         	 int pageStart2 = (nowBlock2-1)*pagePerBlock+1;
				int pageEnd2 = (pageStart2+pagePerBlock/*5*/)<totalPage2?
						pageStart2+pagePerBlock:totalPage2+1; 
				for(;pageStart2<pageEnd2;pageStart2++){
		%>
		
		<a id="page" href="javascript:pageing2('<%=pageStart2%>')">
			<%if(nowPage22==pageStart2){%><font color="blue"><%}%>
				<%=pageStart2%>
			<%if(nowPage22==pageStart2){%></font><%}%>
		</a>
		
		<%}//--for%>
		<!-- 다음블럭 -->
			<%if(totalBlock>nowBlock2){%>
			
			<a id="page" href="javascript:block2('<%=nowBlock2+1 %>')">다음 ></a>
			<%} %>
		<!-- 페이징 및 블럭 End -->
			</td>
</tr>
<%} %>
</table>



</div><!-- body div -->
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
		<tr>
		<td colspan="4" align="center" style="border-top: 1px solid #888;" onclick="location.href='logout.jsp'">로그아웃</td>
		</tr>
	</table>
</span>


<form name="readFrm15">
	<input type="hidden" name="nowPage11" value="<%=nowPage11%>">
	<input type="hidden" name="nowPage22" value="<%=nowPage22%>">
	<input type="hidden" name="where" value="<%=where%>"> 
	<input type="hidden" name="searchKey" value="<%=searchKey%>">
</form>





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