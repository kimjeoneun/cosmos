package member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.Member;

public class MemView {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");		
		MemberDao dao = new MemberDao();
		Member dto = dao.getMemById(id);
		request.setAttribute("member_dto", dto);
	}
	
}
