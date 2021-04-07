<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:useBean id="mgr" class="member.MemberMgr"/>

<%
		request.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("id");
		
		String pwd = request.getParameter("pwd1");
		
		boolean flag = mgr.deleteMember(id, pwd);
		if(flag==true){	
%>
<script>
	alert("회원탈퇴성공");
</script>
<%
		session.invalidate();
		}else{
%>
<script>
	alert("회원탈퇴실패");
</script>
<%}%>