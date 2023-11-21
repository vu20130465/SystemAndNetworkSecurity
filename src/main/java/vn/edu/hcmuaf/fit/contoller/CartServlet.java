package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.service.BillService;
import vn.edu.hcmuaf.fit.service.CartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.sendRedirect("login");
            return;
        }
        doPost(request, response);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        List<CartItem> cart = new CartService().getListCart(username);
        request.getSession().setAttribute("cart", cart);

    }
}
