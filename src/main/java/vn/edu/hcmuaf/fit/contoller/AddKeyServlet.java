package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.service.KeyManagerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "KeyManagerServlet", value = "/account-info/key-manager")
public class AddKeyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String) req.getSession().getAttribute("username");
        if (username == null) {
            resp.sendRedirect("login");
            return;
        }
        String key = req.getParameter("key");
        try {
            new KeyManagerService().addKey(username, key);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
