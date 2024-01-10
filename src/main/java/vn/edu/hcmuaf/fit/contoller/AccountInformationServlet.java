package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AccountInformationServlet", value = "/account-info")
public class AccountInformationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().setAttribute("currentPage", "account-info");
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.sendRedirect("login");
            return;
        }
        User user;
        try {
            user = new AccountService().getUserInfo(username);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("user", user);
        request.getRequestDispatcher("account-info.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
