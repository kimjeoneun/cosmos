package product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import dto.Product;
import dao.ProductDao;

public class ProductAdd implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String productId = request.getParameter("productId");
		String name = request.getParameter("name");
		String unitPrice = request.getParameter("unitPrice");
		String description = request.getParameter("description");
		String manufacturer = request.getParameter("manufacturer");
		String category = request.getParameter("category");
		String unitsInStock = request.getParameter("unitsInStock");
		String condition = request.getParameter("condition"); 
		
		Integer price;

		if (unitPrice.isEmpty())
			price = 0;
		else
			price = Integer.valueOf(unitPrice);

		Integer stock;

		if (unitsInStock.isEmpty())
			stock = 0;
		else
			stock = Integer.valueOf(unitsInStock);

		ProductDao dao = new ProductDao();

		Product newProduct = new Product();
		newProduct.setId(productId);
		newProduct.setName(name);
		newProduct.setUnitPrice(price);
		newProduct.setDescription(description);
		newProduct.setManufacturer(manufacturer);
		newProduct.setCategory(category);
		newProduct.setUnitsInStock(stock);
		newProduct.setCondition(condition);

		dao.addProduct(newProduct);	
		
		request.setAttribute("newProduct", newProduct);
				
	}	

}
