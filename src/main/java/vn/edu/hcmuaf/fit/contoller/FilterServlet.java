package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "Filter", value = "/filter")
public class FilterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int fromPrice = Integer.parseInt(request.getParameter("from-price"));
        int toPrice = Integer.parseInt(request.getParameter("to-price"));
        String category_id_param = request.getParameter("category_id");
        try {
            ArrayList<Product> products;
            if (category_id_param == "") {
                products = (ArrayList<Product>) new ProductService().getAllProduct();
            } else {
                int category_id = Integer.parseInt(category_id_param);
                request.setAttribute("category_id", category_id);
                products = new CategoryService().getProductListById(category_id);
            }
            ArrayList<Product> result = new ArrayList<>();

            for (int i = 0; i < products.size(); i++) {
                if (products.get(i).getPrice() >= fromPrice && products.get(i).getPrice() <= toPrice)
                    result.add(products.get(i));
            }
            request.setAttribute("products", result);

            request.getRequestDispatcher("shop").forward(request, response);
//            response.sendRedirect("shop");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
