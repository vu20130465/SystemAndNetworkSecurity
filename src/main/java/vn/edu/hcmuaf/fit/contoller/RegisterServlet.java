package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.service.AccountService;
import vn.edu.hcmuaf.fit.service.HashService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
        System.out.print("doGet");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> errors = new HashMap<String, String>();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("usernameIn");
        if (username.isEmpty()) {
            errors.put("username", "Bạn chưa điền Tên tài khoản.");
        }
        String password = request.getParameter("password");
        if (password.isEmpty()) {
            errors.put("password", "Bạn chưa điền Mật khẩu.");
        }
        String pwconfirm = request.getParameter("pwconfirm");
        if (pwconfirm.isEmpty()) {
            errors.put("pwconfirm", "Bạn chưa điền Nhập lại mật khẩu.");
        }
        String lastname = request.getParameter("lastname");
        if (lastname.isEmpty()) {
            errors.put("lastname", "Bạn chưa điền Họ.");
        }
        String firstname = request.getParameter("firstname");
        if (firstname.isEmpty()) {
            errors.put("firstname", "Bạn chưa điền Tên.");
        }
        String phone = request.getParameter("phone");
        if (phone.isEmpty()) {
            errors.put("phone", "Bạn chưa điền Số điện thoại.");
        }
        String email = request.getParameter("email");
        if (email.isEmpty()) {
            errors.put("email", "Bạn chưa điền Email.");
        }
        String address = request.getParameter("address");
        if (address.isEmpty()) {
            errors.put("address", "Bạn chưa điền Địa chỉ.");
        }

        try {
            boolean isExist = new AccountService().checkAccountExist(username);
            if (isExist) {
                errors.put("username", "Tên tài khoản đã tồn tại");
            }
            if (!password.equals(pwconfirm)) {
                errors.put("pwconfirm", "Mật khẩu bạn điền không trùng khớp");
            }
            if (errors.isEmpty()) {
                new AccountService().register(username, HashService.hashPassword(password), lastname, firstname, phone, email, address);
                PrintWriter pw = response.getWriter();
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Đăng ký thành công');window.location.href = 'login'");
//                Swal.fire("Tạo key thành công");
                pw.println("</script>");
                request.getRequestDispatcher("").include(request, response);

            } else {
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
