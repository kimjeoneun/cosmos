package member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class LoginProc {
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDao dao = new MemberDao();
		map = dao.loginMember(id, pw);
		
		/*
		for(String key : map.keySet()) {
			System.out.println(key);
		}
		*/
		
		String loginStatus = map.get("login");
		String name = map.get("name");
		String viewPage = null;
		
		if(loginStatus.equals("ok")) {
			//세션 id, name 설정, index.jsp로 분기
			HttpSession session = request.getSession();
			session.setAttribute("sessID", id);
			session.setAttribute("sessName", name);
			viewPage = "/index.jsp";
		} else if (loginStatus.equals("pwFail")) {
			//msg 정보 저장, login.jsp로 분기
			request.setAttribute("loginMsg", "비밀번호가 틀렸습니다.");
			viewPage = "/member/login.jsp";
		} else if (loginStatus.equals("fail")) {
			//msg 정보 저장, login.jsp로 분기
			request.setAttribute("loginMsg", "ID가 정보가 없습니다.");
			viewPage = "/member/login.jsp";
		} 
		
		return viewPage;
	}
}
