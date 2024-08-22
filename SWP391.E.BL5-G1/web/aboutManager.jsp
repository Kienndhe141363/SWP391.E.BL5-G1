<%-- 
    Document   : aboutManager
    Created on : Aug 12, 2024, 11:39:20 PM
    Author     : ThangNPHE151263
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Giới Thiệu</title>
    <link rel="stylesheet" href="css/aboutManager.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <header>
        <h1>Quản Lý Giới Thiệu</h1>
    </header>

    <div class="container">
        <a href="addAbout.jsp" class="btn btn-add">Thêm Mới</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tác giả</th>
                    <th>Tiêu Đề</th>
                    <th>Ảnh</th>
                    <th>Nội Dung</th>
                    <th>Thao Tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${listAbout}">
                    <tr>
                        <td id="id">${item.aboutId}</td>
                        <td>${item.userName}</td>
                        <td>${item.title}</td>
                        <td><img src="${item.img}" alt="${item.title}" style="width:100px;"/></td>
                        <td>${item.content}</td>
                        <td>
                            <a href="editAbout?id=${item.aboutId}" class="btn btn-edit">Sửa</a>
                            <a href="deleteAbout?id=${item.aboutId}" class="btn btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
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
