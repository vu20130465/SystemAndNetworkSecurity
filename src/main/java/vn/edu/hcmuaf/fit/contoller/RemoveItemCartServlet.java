package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.service.CartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveItemCartServlet", value = "/remove-item-cart")
public class RemoveItemCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = (String) request.getSession().getAttribute("username");
        int idProduct = Integer.parseInt(request.getParameter("idP"));
        new CartService().removeItem(user, idProduct);
        new CartServlet().doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
