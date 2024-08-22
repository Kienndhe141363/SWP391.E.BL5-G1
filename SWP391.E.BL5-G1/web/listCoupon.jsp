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
    <style>
        body, h1, table, th, td {
            margin: 0;
            padding: 0;
            border: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f4f4f4;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: #fff;
            padding: 10px;
        }

        td {
            padding: 10px;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a.btn {
            display: inline-block;
            padding: 10px 20px; 
            margin: 5px; 
            text-decoration: none;
            color: #fff;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-add {
            background-color: #007bff; 
        }

        .btn-add:hover {
            background-color: #0056b3;
        }

        .btn-delete {
            background-color: #f44336; 
        }

        .btn-delete:hover {
            background-color: #c62828; 
        }
    </style>
</head>
<body>
    <header>
        <h1>Quản Lý Coupon</h1>
    </header>

    <div class="container">
        <a href="couponmanager?action=generate" class="btn btn-add">Tạo Mới</a>
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
                        <td>${coupon.couponId}</td>
                        <td>${coupon.code}</td>
                        <td>${coupon.startDate}</td>
                        <td>${coupon.endDate}</td>
                        <td>${coupon.usageLimit}</td>
                        <td>${coupon.couponDescription}</td>
                        <td>
                            <a href="couponmanager?action=delete&couponId=${coupon.couponId}" class="btn btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
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
