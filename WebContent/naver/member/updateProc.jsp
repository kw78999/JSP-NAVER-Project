<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:useBean id="mgr" class="member.MemberMgr"/>

<%
		request.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("id");
		String pwd = request.getParameter("pwd");
		String newPwd = request.getParameter("pwd1");
		boolean flag = mgr.updatePassword(id, pwd, newPwd);
		if(flag==true){
%>			
<script type="text/javascript">
	alert("수정완료");
	location.href="myAccount.jsp";
</script>
<%	}else{%>
<script type="text/javascript">
	alert("수정실패");
	location.href="update.jsp";
</script>
<%	}%>