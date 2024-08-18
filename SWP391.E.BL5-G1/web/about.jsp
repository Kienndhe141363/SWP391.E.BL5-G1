<%-- 
    Document   : about
    Created on : Aug 8, 2024, 1:44:54 AM
    Author     : ThangNPHE151263
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="css/about.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
            }

            header {
                padding: 1rem;
                text-align: center;
            }

            header nav ul {
                list-style: none;
                padding: 0;
            }

            header nav ul li {
                display: inline;
                margin: 0 1rem;
            }

            header nav ul li a {
                color: #fff;
                text-decoration: none;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 2rem;
            }

            section {
                margin-bottom: 2rem;
            }

            section img {
                max-width: 100%;
                height: auto;
                border-radius: 8px;
                margin-bottom: 1rem;
            }

            section h2 {
                border-bottom: 2px solid #333;
                padding-bottom: 0.5rem;
                margin-bottom: 1rem;
            }

            footer {
                text-align: center;
                padding: 1rem;
                width: 100%;
                bottom: 0;
                background-color: #f4f4f4;
            }

            .content-wrapper {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
                gap: 20px;
                flex-wrap: wrap;
            }

            .content-text, .content-image {
                flex: 1;
                min-width: 300px;
            }

            .content-text {
                padding: 10px;
            }

            .content-image {
                max-width: 100%;
            }

            .content-image img {
                width: 100%;
                height: auto;
                border-radius: 8px;
            }

            .c-odd .content-wrapper {
                flex-direction: row-reverse;
            }

            .c-even .content-wrapper {
                flex-direction: row;
            }

        </style>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <header>
        <h1>Giới Thiệu</h1>
    </header>

    <div class="container">
        <section id="about">
            <h2>Chào Mừng Đến Với Cửa Hàng Thời Trang Của Chúng Tôi</h2>
            <p>Chúng tôi là cửa hàng thời trang trực tuyến chuyên cung cấp các sản phẩm quần áo và phụ kiện thời trang chất lượng cao. Từ những bộ sưu tập mới nhất đến các sản phẩm cổ điển, chúng tôi cam kết mang đến cho bạn những sản phẩm tốt nhất với giá cả hợp lý.</p>
            <p>Với đội ngũ thiết kế và mua sắm dày dạn kinh nghiệm, chúng tôi luôn cập nhật các xu hướng thời trang mới nhất để đảm bảo rằng bạn luôn tìm thấy những món đồ phù hợp với phong cách của mình. Chúng tôi tin rằng sự hài lòng của khách hàng là thành công lớn nhất của chúng tôi.</p>
        </section>

        <c:forEach var="item" items="${listAbout}">
            <c:set var="counter" value="${counter + 1}" />
            <section id="${item.aboutId}" class="${(counter % 2 == 0) ? 'c-even' : 'c-odd'}">
                <h2>${item.title}</h2>
                <div class="content-wrapper">
                    <div class="content-text">
                        <p>${item.content}</p>
                    </div>
                    <div class="content-image">
                        <img src="${item.img}" alt="${item.title}">
                    </div>
                </div>
            </section>
        </c:forEach>
    </div>

    <footer>
        <jsp:include page="footer.jsp"/>
    </footer>
</body>
</html>
