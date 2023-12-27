package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.service.AccountService;
import vn.edu.hcmuaf.fit.service.HashService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().setAttribute("currentPage", "login");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = null;
        try {
            password = HashService.hashPassword(request.getParameter("password"));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        try {
            boolean isLogin = new AccountService().login(username, password);
            if (isLogin) {
                request.getSession().setAttribute("username", username);
                new CartServlet().doPost(request, response);
                response.sendRedirect("home");
            } else {
                request.setAttribute("username", username);
                request.setAttribute("errorLogin", true);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                getServletContext().setAttribute("currentPage", "home");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
