<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		boolean result = mgr.checkId(id);
%>
<!doctype html>
<html>
<head>
	<title>ID 중복체크</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script> 
 
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            padding: 20px;
            border: 1px solid #888;
            height:100%;
            width: 90%; /* Could be more or less, depending on screen size */                          
        }
	</style>
</head>
<body>
<!-- The Modal -->

      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <%if(result){ %>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><%=id%>는 이미 존재하는 아이디입니다.</span></p>
                <%} else { %>
                <p style="text-align: center; line-height: 1.5;"><span style="font-size: 14pt;"><%=id%>는 사용 가능합니다.</span></p>
                <%} %>
                <p style="text-align: center; line-height: 1.5;"><br /></p>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
        <!--End Modal-->

</body>
    <script type="text/javascript">
      
        jQuery(document).ready(function() {
                $('#myModal').show();
        });
        //팝업 Close 기능
        function close_pop(flag) {
             $('#myModal').hide();
            self.close();
        };
        
      </script>
</html>