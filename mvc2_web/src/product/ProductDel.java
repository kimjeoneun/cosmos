package product;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import dao.ProductDao;
import dto.Product;

public class ProductDel implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		ProductDao dao = new ProductDao();		
		dao.delProduct(id);				
	}
	
}
