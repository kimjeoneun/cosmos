package product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import dao.ProductDao;
import dto.Product;

public class ProductList implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ProductDao dao = new ProductDao();		
		List<Product> dto = dao.getList();		
		request.setAttribute("list", dto);
	}
	
}
