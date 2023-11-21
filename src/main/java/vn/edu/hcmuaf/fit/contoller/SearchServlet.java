package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.SearchService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "Search", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String namePattern = request.getParameter("name-pattern");

        List<Product> products = new SearchService().findProductsByName(namePattern);
        request.setAttribute("products-searched", products);
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
//        int count = 0;
//        for (Product p : products) {
//            System.out.println(++count);
//            System.out.println(p.getName());
//        }

        request.getRequestDispatcher("shop").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        String keyword = request.getParameter("keyword");
        List<Product> productList = new SearchService().findProductsByName(keyword);

        PrintWriter pw = response.getWriter();
        for (Product pro : productList) {
            pw.println("<div class=\"col-sm-6 col-md-6 col-lg-4 col-xl-4 product-cell\">\n" +
                    "           <div class=\"products-single fix\">\n" +
                    "               <div class=\"box-img-hover\" style=\"height: 255px\">\n" +
                    "\n" +
                    "                   <div class=\"type-lb\">\n" +
                    "                       <p class=\"status-param sale\">\n" +
                                                pro.getStatus() + "\n" +
                    "                       </p>\n" +
                    "                   </div>\n" +
                    "\n" +
                    "                   <img src=\"" + pro.getImages() + "\" class=\"img-fluid image-param\"\n" +
                    "                        alt=\"Image\">\n" +
                    "                   <div class=\"mask-icon\">\n" +
                    "                       <a class=\"cart\" href=\"#\">Thêm vào giỏ hàng</a>\n" +
                    "                   </div>\n" +
                    "               </div>\n" +
                    "               <a class=\"id-param\" href=\"product-detail?id= " + pro.getId() + "\"\n" +
                    "                  style=\"cursor: pointer;\">\n" +
                    "                   <div class=\"why-text\" style=\"height: 113px\">\n" +
                    "                       <h4 class=\"name-param\">" + pro.getName() + "</h4>\n" +
                    "                       <h5 class=\"price-param\">" + pro.getPrice() + "</h5>\n" +
                    "                   </div>\n" +
                    "               </a>\n" +
                    "           </div>\n" +
                    "       </div>");
        }

    }
}
