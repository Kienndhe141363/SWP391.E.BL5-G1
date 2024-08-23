<%-- 
    Document   : editPost
    Created on : Aug 23, 2024, 2:27:12 PM
    Author     : Putaa
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Post</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Post</h2>
        <form action="editPost" method="post">
            <input type="hidden" name="postId" value="${post.postId}">
            
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${post.title}" required>

            <label for="content">Content:</label>
            <textarea id="content" name="content" rows="4" required>${post.content}</textarea>

            <label for="postTypeId">Post Type:</label>
            <select id="postTypeId" name="postTypeId">
                <c:forEach var="type" items="${postTypes}">
                    <option value="${type.id}" <c:if test="${type.id == post.postTypeId}">selected</c:if>>${type.type}</option>
                </c:forEach>
            </select>

            <button type="submit">Update Post</button>
        </form>
    </div>
</body>
</html>


