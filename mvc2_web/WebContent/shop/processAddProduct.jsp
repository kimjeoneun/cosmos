<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductDao"%>

<%
	request.setCharacterEncoding("UTF-8");

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

	//ProductRepository dao = ProductRepository.getInstance();
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

	boolean rs = dao.addProduct(newProduct);

	if(rs) { 
		response.sendRedirect("products.jsp");
	} else {
		out.println("제품이 정상적으로 등록되지 않았습니다.");
	}
%>
