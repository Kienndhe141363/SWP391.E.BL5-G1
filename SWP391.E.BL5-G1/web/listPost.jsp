<%-- 
    Document   : listPost
    Created on : Aug 23, 2024, 2:22:58 PM
    Author     : Putaa
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Post List - Facebook Style</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
        }
        .post-container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 15px;
        }
        .post-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .post-user {
            font-weight: bold;
            margin-right: 10px;
        }
        .post-time {
            color: #666;
            font-size: 0.9em;
        }
        .post-title {
            font-size: 1.2em;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .post-content {
            margin-bottom: 10px;
        }
        .post-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
        .post-actions button {
            padding: 8px 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        .post-actions button:hover {
            background-color: #0056b3;
        }
        .post-actions a {
            color: #007bff;
            text-decoration: none;
            margin-right: 10px;
        }
        .post-actions a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Danh sách bài viết</h2>
        <a href="addPost" class="button">Thêm bài viết</a>
        <c:forEach var="post" items="${posts}">
            <div class="post-container">
                <div class="post-header">
                    <span class="post-user">${post.username}</span>
                    <span class="post-time">${post.createAt}</span>
                </div>
                <div class="post-title">
                    ${post.title}
                </div>
                <div class="post-content">
                    <p>${post.content}</p>
                </div>
                <div class="post-actions">
                    <a href="#">Thích</a>
                    <a href="#">Bình luận</a>
                    <c:if test="${user.user_id == post.userid || user.isAdmin == 'TRUE'}">
                        <a href="editPost?postId=${post.postId}" class="button">Chỉnh sửa</a>
                        <a href="deletePost?postId=${post.postId}" class="button" onclick="return confirm('Bạn có chắc chắn muốn xóa bài viết này?');">Xóa</a>
                    </c:if>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
