package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CreateOrder", value = "/create-order")
public class CreateOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.sendRedirect("login");
            return;
        }
        request.getRequestDispatcher("order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.sendRedirect("login");
            return;
        }
        String lName = request.getParameter("lastName");
        String fName = request.getParameter("firstName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String status = "Đang xác thực";
        int shipCost = Integer.parseInt(request.getParameter("selectedShippingOption"));

        new OrderService().createOrder(username, lName, fName, phone, address, email, status, shipCost);
        PrintWriter pw = response.getWriter();
        pw.println("<script type=\"text/javascript\">");
        pw.println("Swal.fire(\"Tạo key thành công\");");
        pw.println("</script>");
        response.sendRedirect("cart");
    }
}
