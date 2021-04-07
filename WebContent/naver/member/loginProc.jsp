<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="member.MemberMgr" %>

<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>
    
<%

request.setCharacterEncoding("UTF-8");
String cPath = request.getContextPath();
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String msg = "로그인 실패";

boolean result = mgr.loginMember(id,pwd);
if(result){
  session.setAttribute("id",id);
  msg = "로그인 성공";
}
%>
<script>
alert("<%=msg%>");
if(<%=result%>)
  location.href = "../in/naverin_main.jsp";
else
  location.href = "login.jsp";
</script>