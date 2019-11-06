package product;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import dao.ProductDao;
import dto.Product;

public class ProductView implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		ProductDao dao = new ProductDao();		
		Product dto = dao.getProductId(id);		
		request.setAttribute("newProduct", dto);
	}
	
}
