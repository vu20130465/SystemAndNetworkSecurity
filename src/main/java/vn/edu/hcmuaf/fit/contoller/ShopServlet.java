package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.model.Category;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.CategoryService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Array;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "shop", value = "/shop")
public class ShopServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().setAttribute("currentPage", "shop");
        try {
            ArrayList<Category> categories = new CategoryService().getAllCategory();
            /* Set attribute để in ds phân loại cột bên phải */
            request.setAttribute("categories", categories);

            /* Lấy attribute từ Category Servlet để biết sẽ hiển thị ds sản phẩm nào */
            ArrayList<Product> productsOfCategory = (ArrayList<Product>) request.getAttribute("productsOfCategory");
            /* Lấy category_id từ Category Servlet để phục vụ cho việc lọc theo giá từ các sản phẩm trên trang shop.jsp */
            Object category_id = request.getAttribute("category_id");

            if (category_id != null)
                request.setAttribute("category_id", category_id);

            ArrayList<Product> currProductList = (ArrayList<Product>) request.getAttribute("products");
            if (currProductList != null)
                request.setAttribute("products", currProductList);
            else {
                if (productsOfCategory == null)
                    currProductList = (ArrayList<Product>) new ProductService().getAllProduct();
                else
                    currProductList = productsOfCategory;
                request.setAttribute("products", currProductList);

                /* Lấy attribute từ Search Servlet để biết sẽ hiển thị ds sản phẩm nào */
                ArrayList<Product> productsSearched = (ArrayList<Product>) request.getAttribute("products-searched");
                if (productsSearched != null)
                    request.setAttribute("products", productsSearched);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public static void main(String[] args) {

    }
}
