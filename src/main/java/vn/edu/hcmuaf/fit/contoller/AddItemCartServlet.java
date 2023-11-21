package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.service.CartService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddItemCart", value = "/add-item")
public class AddItemCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.sendRedirect("login");
            return;
        }
        int idProduct = Integer.parseInt(request.getParameter("idP"));
        int quantity = Integer.parseInt(request.getParameter("quan"));
        boolean cumulative = Boolean.parseBoolean(request.getParameter("cumulative"));
        CartService tmp = new CartService();
        if (quantity < 0)
            tmp.addItem(username, idProduct, quantity = 1);
        if (quantity == 0) {
            tmp.removeItem(username, idProduct);
        }
        int maxQuantity = new ProductService().getMaxQuantityOfProduct(idProduct);
        if (cumulative) {
            int quan = tmp.getQuantityItem(idProduct, tmp.getListCart(username));
            tmp.addItem(username, idProduct, (quan + quantity > maxQuantity) ? maxQuantity : (quan + quantity));
        } else {
            tmp.addItem(username, idProduct, (quantity > maxQuantity) ? maxQuantity : quantity);
        }
        new CartServlet().doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
