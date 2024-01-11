package vn.edu.hcmuaf.fit.contoller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.service.VerificationService;
@WebServlet(name = "verifyUser", value = "/verifyUser")
public class VerifyUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ request, ví dụ: idOrder và username
        int idOrder = Integer.parseInt(request.getParameter("idOrder"));
        String username = request.getParameter("username");

        // Thực hiện xác minh người dùng bằng cách gọi phương thức từ VerificationService
        VerificationService verificationService = new VerificationService();
        boolean result = verificationService.verifyUser(idOrder, username);

        // Trả kết quả về client
        if (result) {
            response.getWriter().write("User verified successfully.");
        } else {
            response.getWriter().write("User verification failed.");
        }
    }
}
