package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.LogOut;
import member.LoginProc;
import member.MemList;
import member.MemRegProc;
import member.MemView;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doAction(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		System.out.println("doAction");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String cmd = uri.substring(path.length());
				
		//PrintWriter out = response.getWriter();
		//out.println("uri :" + uri);
		//out.println("path :" + path);
		//out.println("cmd :" + cmd);		
		
		String viewPage = null;
		if(cmd.equals("/memReg.do")) {
			viewPage = "/member/memReg.jsp";			
		} else if(cmd.equals("/memRegProc.do")) {	
			MemRegProc command = new MemRegProc();
			command.execute(request, response);
			viewPage = "/member/login.jsp";			
		} else if (cmd.equals("/memList.do")) {				
			MemList command =new MemList();
			command.execute(request, response);
			viewPage = "/member/memList.jsp";			
		} else if(cmd.equals("/memView.do")) {
			MemView command = new MemView();
			command.execute(request, response);
			viewPage = "/member/memView.jsp";
		} else if(cmd.equals("/memModify.do")) {
			MemView command = new MemView();
			command.execute(request, response);
			viewPage = "/member/memModify.jsp";
		} else if(cmd.equals("/login.do")) {
			viewPage = "/member/login.jsp";
		} else if(cmd.equals("/loginProc.do")) {
			LoginProc command = new LoginProc();
			viewPage = command.execute(request, response);			 
		} else if(cmd.equals("/logOut.do")) {
			LogOut command = new LogOut();
			command.execute(request, response);
			viewPage = "/index.jsp";
		} 
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
		
	}

}
