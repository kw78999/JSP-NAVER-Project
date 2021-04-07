package in;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/naver/in/question_up")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		MultipartRequest multi= new MultipartRequest(request, QuestionMgr.SAVEFOLDER,
				QuestionMgr.MAXSIZE,QuestionMgr.ENCTYPE,new DefaultFileRenamePolicy());
		
		int qnum = Integer.parseInt(multi.getParameter("qnum"));
		QuestionMgr mgr = new QuestionMgr();
		if(multi.getParameter("delete")!=null) {
		if(multi.getParameter("delete").equals("delete")) {
			mgr.deleteFile1(qnum);
		}}
		if(multi.getParameter("delete2")!=null) {
		if(multi.getParameter("delete2").equals("delete")) {
			mgr.deleteFile2(qnum);
		}}
		mgr.updateQuestion(multi);
		response.sendRedirect("boardRead.jsp?qnum="+qnum);
		
			 
			 
			 
}}
