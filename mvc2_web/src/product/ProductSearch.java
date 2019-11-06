package product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import dao.ProductDao;
import dto.Product;

public class ProductSearch implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String searchName = request.getParameter("searchName");
		
		ProductDao dao = new ProductDao();		
		List<Product> dto = dao.searchProduct(searchName);		
		request.setAttribute("list", dto);
	}
	
}
