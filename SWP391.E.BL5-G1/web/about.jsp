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
