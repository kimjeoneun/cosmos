package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.Member;

public class MemRegProc {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String gender = request.getParameter("gender");
		
		//취미
		String[] hobby = request.getParameterValues("hobby");	
		String str = new String();		
		//String str = null; 
				
		if(hobby != null) {						
			for(int i=0; i < hobby.length; i++){			
				str += hobby[i];
				if(i != hobby.length-1) {
					str += ",";
				}
			}
		} else {
			str = "";
		}
		
		Member m = new Member();
		m.setId(id);
		m.setPw(pw);
		m.setName(name);
		m.setGender(gender);
		m.setHobby(str);		
		
		MemberDao dao = new MemberDao();		
		dao.addMember(m);
	}
}
