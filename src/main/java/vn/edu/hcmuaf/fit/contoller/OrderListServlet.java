package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.model.Order;
import vn.edu.hcmuaf.fit.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

@WebServlet(name = "OrderList", value = "/order-list")
public class OrderListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.sendRedirect("login");
            return;
        }
        ArrayList<Order> orders;
        orders = new OrderService().getListOrder(username);
        // Thực hiện logic để lấy danh sách đơn hàng từ cơ sở dữ liệu hoặc nơi khác
        // Chuyển danh sách đơn hàng thành định dạng JSON
        String json = new Gson().toJson(orders);
        // Đặt kiểu nội dung là application/json để trình duyệt biết là dữ liệu JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Gửi dữ liệu JSON về trình duyệt
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
