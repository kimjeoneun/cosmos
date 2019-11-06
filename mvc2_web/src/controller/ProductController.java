package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import product.ProductAdd;
import product.ProductDel;
import product.ProductList;
import product.ProductModifyProc;
import product.ProductSearch;
import product.ProductView;


@WebServlet(asyncSupported = true, urlPatterns = { "*.me" })
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 2L;
       
   
    public ProductController() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String cmd = uri.substring(path.length());
				
		PrintWriter out = response.getWriter();
		out.println("uri :" + uri);
		out.println("path :" + path);
		out.println("cmd :" + cmd);		
		
		String viewPage = null;
		Command command = null;
		
		if(cmd.equals("/welcome.me")) {
			viewPage = "/shop/welcome.jsp";
		} else if (cmd.equals("/productList.me")) {
			command = new ProductList();
			command.execute(request, response);
			viewPage = "/shop/productList.jsp";
		} else if (cmd.equals("/productRegForm.me")) {
			viewPage = "/shop/productRegForm.jsp";
		} else if (cmd.equals("/searchName.me")) {
			command = new ProductSearch();
			command.execute(request, response);
			viewPage = "/shop/productList.jsp";
		} else if (cmd.equals("/addProduct.me")) {
			command = new ProductAdd();
			command.execute(request, response);
			viewPage = "/shop/productView.jsp";
		} else if (cmd.equals("/productView.me")) {
			command = new ProductView();
			command.execute(request, response);
			viewPage = "/shop/productView.jsp";
		} else if (cmd.equals("/productModify.me")) {
			command = new ProductView();
			command.execute(request, response);
			viewPage = "/shop/productModify.jsp";			
		} else if (cmd.equals("/productDel.me")) {
			command = new ProductDel();
			command.execute(request, response);
			
			command = new ProductList();
			command.execute(request, response);
			viewPage = "/shop/productList.jsp";			
		} else if (cmd.equals("/productModifyProc.me")) {
			command = new ProductModifyProc();
			command.execute(request, response);
			viewPage = "/shop/productView.jsp";	
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
		
	}
}
