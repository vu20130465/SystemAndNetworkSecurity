package vn.edu.hcmuaf.fit.contoller;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import vn.edu.hcmuaf.fit.model.Order;
import vn.edu.hcmuaf.fit.service.DigitalSignattureManager;
import vn.edu.hcmuaf.fit.service.KeyManagerService;
import vn.edu.hcmuaf.fit.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Spliterator;

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
        try {
            String username = (String) request.getSession().getAttribute("username");
            if (username == null) {
                response.sendRedirect("login");
                return;
            }
            String privateKey = request.getParameter("privateKey");
            String data = "test";
            boolean check = verify(data, new DigitalSignattureManager().sign(data, privateKey), new KeyManagerService().getReadyKey(username));
            if (!check) {
                PrintWriter pw = response.getWriter();
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert(\"Khóa không hợp lệ\");");
                pw.println("</script>");
                response.sendRedirect("cart");
                return;
            }
            String lName = request.getParameter("lastName");
            String fName = request.getParameter("firstName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            int shipCost = Integer.parseInt(request.getParameter("selectedShippingOption"));
            OrderService orderService = new OrderService();
            DigitalSignattureManager digit = new DigitalSignattureManager();

            orderService.createOrder(username, lName, fName, phone, address, email, shipCost);
            Order order = orderService.getOrder(orderService.getLastOrderId(username), username);
            KeyManagerService key = new KeyManagerService();
            int id_key = key.getReadyKeyID(username);
            System.out.println("idkey"+id_key);
            String hashedOrder = digit.hashOrder(order);
            String signature = digit.sign(hashedOrder, privateKey);
            digit.addSignature(id_key, order.getId(), signature);

            PrintWriter pw = response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("Swal.fire(\"Thanh toán thành công\");");
            pw.println("</script>");
            response.sendRedirect("cart");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

//    public static boolean isMatch(String publicKeyPem, String privateKeyPem) throws Exception {
//        // Decode public key
//        byte[] publicKeyBytes = Base64.getDecoder().decode(parsePEMKey(publicKeyPem));
//        X509EncodedKeySpec publicKeySpec = new X509EncodedKeySpec(publicKeyBytes);
//        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
//        PublicKey publicKey = keyFactory.generatePublic(publicKeySpec);
//
//        // Decode private key
//        byte[] privateKeyBytes = Base64.getDecoder().decode(parsePEMKey(privateKeyPem));
//        PKCS8EncodedKeySpec privateKeySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
//        PrivateKey privateKey = keyFactory.generatePrivate(privateKeySpec);
//
//        // Check if the keys are a match
//        return publicKey.getAlgorithm().equals(privateKey.getAlgorithm());
//    }
//    private static byte[] parsePEMKey(String pemKey) {
//        // Loại bỏ tiêu đề và chân trang PEM cho khóa công khai
//        pemKey = pemKey.replace("-----BEGIN PUBLIC KEY-----", "")
//                .replace("-----END PUBLIC KEY-----", "");
//
//        // Loại bỏ tiêu đề và chân trang PEM cho khóa riêng
//        pemKey = pemKey.replace("-----BEGIN RSA PRIVATE KEY-----", "")
//                .replace("-----END RSA PRIVATE KEY-----", "");
//
//        pemKey = pemKey.replaceAll("\\s", "+");
//        pemKey = pemKey.replaceAll("\\n", "");
//        System.out.println(pemKey);
//        return org.bouncycastle.util.encoders.Base64.decode(pemKey);
//    }
    public boolean verify(String hashedOrder, String signature, String publicKeyPem) throws Exception {
        Security.addProvider(new BouncyCastleProvider());

        // Đọc Public Key từ định dạng PEM
        byte[] publicKeyBytes = org.bouncycastle.util.encoders.Base64.decode(publicKeyPem.replaceAll("\\n", "")
                .replaceAll("-----BEGIN PUBLIC KEY-----", "")
                .replaceAll("-----END PUBLIC KEY-----", "")
                .replaceAll("\\s", "+"));

        KeyFactory keyFactory = KeyFactory.getInstance("RSA", "BC");
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
        PublicKey publicKey = keyFactory.generatePublic(keySpec);

        // Tạo đối tượng ký
        Signature sig = Signature.getInstance("SHA256withRSA", "BC");
        sig.initVerify(publicKey);
        sig.update(hashedOrder.getBytes(StandardCharsets.UTF_8));

        // Chuyển đổi chữ ký sang định dạng Base64
        byte[] signatureBytes = Base64.getDecoder().decode(signature);

        // Xác minh chữ ký
        return sig.verify(signatureBytes);
    }
    public static void main(String[] args) throws Exception {
        String privateKey = "-----BEGIN RSA PRIVATE KEY-----MIIEogIBAAKCAQEAqaMBnV/p1kMXkzNHJxO3JbM05n9aofG7PaIUy5W5fxEy395oqSlflB2ZgGSN0Zj1Q4bI3FhG4CinIdlGeXkoyqpVaQxTOSYxRtHx/WJWU+tUX343XDl+ZJKwIA9eUY4uzKiodc6FPMFsk5Pot67cFO1zX/COp9j7Q2BuK8bOuMpPkKVK14ug+RqvjLoeULhmk71sFGE7B2Y7PCUBVQFuURygeHjhWDaHqSfz88gFgX0XkbdVU604RwyfjQrllI0EOgFDrPKKo7qreMC4Wy4OJGZNGhL7pBplb02n27Lys85yHXz6gGxU3G20gmTawqNZwl1s2S6e+/AOySNR7kjTzQIDAQABAoIBADrGasHPQKLnPhzXcHi+oP9j9xlB2PIxYjG5ncDoEIxRNjJQyiyKVD5qfwv4SxbrC1epNKD7yRrTmwzkTkG6VALcP5mVFqS/ceVayqCDWOvcprAreBzxIrTQCkwhZwmU3Ow2J6AhvRJO5kK/xasW39Q0bXw5SgQn7u7qU2HBkVB+3Oen3F4j1rTsdXjV/OpH/hdhSgl/Jrre2WEWNJN5W+BRlSoBNhS3xNbpYn9ctHuscbyo49HOTjHLR0wyFAo8WXRits4zD9Zyl1UlS9pdzQel5rQUzEo7pgI48zqrskAJNgMSanaO6u3p69+bYyKBeEjOPgvkZxRo1IhCbwH4xVUCgYEA/2+Pj0lK1Ns8DBWWrYMoJIPmCSMx+U1fj/LvS57UOuZ66qVrK7BV/PRhtuDG3SizyAFBPQpfDLYZSS2x8g8KLk0u6okQL/7OMgSb8RmdqjFr0Zhj4S7H+2XRt3pMe1VGJfaVFbFn34o5RPQVn0Ckt/2IE6Tp0h0MgmPciZSrDI8CgYEAqgLt71lDQb3Yv7+oxTs6MA2SK5yJb3Q4ymz26sg/5orZBs+FQjuXbFwoYsnvYVJWo0MAYIXM74fenVk7kYM6tS1LzSx5/V5DroYNEasu6/cvN/D8stDHG/c1mFWY35y55xxWVBKW/jOKg/1jzJsprbpAnIrnobz9IUHakjriv+MCgYBo40eA3+ixdQC4OZkw0J2IOP0ZnXEk3Mez1V67n5GoSgIJHjneq77zaupA7RXbtJ32L8W5KewTzSae7PuX2OMmVh1Aw115R9kloszh+NHMFBUg8MF6svn9Wjb+b2K+diqi5hkb2kg7+4c+sDe8uA+rWZkp79rvo2wCkrz5ZanDMwKBgAbNQzO2QIiazdcuFdR+QB+4C0cPZjg9UCBZJ6/Q/y18FJ6/Ire5pp9BOKRrK9aa8rhpb9Rsxfw3VWK6NTXnKCwjecrloqPOZ6rN1iwEy0XJh+wXCiUlUTH/O/eyRQF9RbrHWXTXoY7eBQau1pVTB+HZd8hLjmTcKMxx1ArRrEy9AoGAJPyVL1np+QgUs6aBa8VveGb5RAttmAR0diWTJPsJXncuDN/bNJrXq6lCkCxVJwM9fddwJaF1+tDsjEEBazBemWuvdNEQy8rw0CvOh1q/g72CImNGTNxlnGFvM0+biz5b5dBPH8mgx8gu7jNQr6y0j1X9EDO4YtNP4RPteR6timw=-----END RSA PRIVATE KEY-----";
        String data = "test";
        boolean check = new CreateOrderServlet().verify(data, new DigitalSignattureManager().sign(data, privateKey), new KeyManagerService().getReadyKey("vu"));
        System.out.println(check);
    }
}
