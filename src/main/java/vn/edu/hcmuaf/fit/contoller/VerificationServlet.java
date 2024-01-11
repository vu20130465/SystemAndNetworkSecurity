package vn.edu.hcmuaf.fit.contoller;

import vn.edu.hcmuaf.fit.service.VerificationService;
import vn.edu.hcmuaf.fit.service.KeyManagerService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "verification", value = "/verification")
public class VerificationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Lấy tham số từ request (idOrder và username)
            int idOrder = Integer.parseInt(request.getParameter("idOrder"));
            String username = request.getParameter("username");

            // Tạo đối tượng VerificationService để xác thực hóa đơn
            VerificationService verificationService = new VerificationService();

            // Xác thực hóa đơn và gửi kết quả về client
            if (verificationService.verifyOrder(idOrder, username)) {
                out.println("Hóa đơn xác thực thành công!");
            } else {
                out.println("Hóa đơn không hợp lệ!");
            }
        } catch (Exception e) {
            out.println("Đã xảy ra lỗi: " + e.getMessage());
        } finally {
            out.close();
        }
    }
}
