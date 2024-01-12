package vn.edu.hcmuaf.fit.contoller;

import com.google.gson.JsonObject;
import vn.edu.hcmuaf.fit.service.VerificationService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "verifyUser", value = "/verifyUser")
public class VerifyUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Lấy tham số từ request (idOrder và username)
            int idOrder = Integer.parseInt(request.getParameter("idOrder"));
            String username = request.getParameter("username");

            // Tạo đối tượng VerificationService để xác thực người dùng
            VerificationService verificationService = new VerificationService();

            // Xác thực người dùng và gửi kết quả về client dưới dạng JSON
            boolean isUserVerified = verificationService.verifyUser(idOrder, username);

            // Tạo đối tượng JSON để chứa kết quả
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("isUserVerified", isUserVerified);

            // Gửi kết quả về client dưới dạng JSON
            out.println(jsonResponse.toString());
        } catch (Exception e) {
            // Xử lý lỗi và gửi thông báo lỗi về client dưới dạng JSON
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("error", "Đã xảy ra lỗi: " + e.getMessage());
            out.println(errorResponse.toString());
        } finally {
            out.close();
        }
    }
}
