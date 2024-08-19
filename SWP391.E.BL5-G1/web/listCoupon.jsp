<%-- 
    Document   : listCoupon
    Created on : Aug 19, 2024, 11:47:26 AM
    Author     : ThangNPHE151263
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản Lý Coupon</title>
        <link rel="stylesheet" href="css/couponManager.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <header>
            <h1>Quản Lý Coupon</h1>
        </header>

        <div class="container">
            <a href="generateCoupon.jsp" class="btn btn-add">Tạo Mới</a>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>                    
                        <th>Mã Coupon</th>
                        <th>Ngày Bắt Đầu</th>
                        <th>Ngày Kết Thúc</th>
                        <th>Số Lượt Sử Dụng</th>
                        <th>Loại Coupon</th>
                        <th>Thao Tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="coupon" items="${coupons}">
                        <tr>
                            <td>${coupon.id}</td>
                            <td>${coupon.code}</td>
                            <td>${coupon.startDate}</td>
                            <td>${coupon.endDate}</td>
                            <td>${coupon.usageLimit}</td>
                            <td>${coupon.couponTypeId}</td>
                            <td>
                                <a href="couponManager?action=delete&couponId=${coupon.id}" class="btn btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <footer>
            <jsp:include page="footer.jsp"/>
        </footer>
    </body>
</html>
