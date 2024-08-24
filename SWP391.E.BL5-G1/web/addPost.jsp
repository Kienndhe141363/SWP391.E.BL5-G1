<%-- 
    Document   : addPost
    Created on : Aug 23, 2024, 2:26:35 PM
    Author     : Putaa
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Post</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #1877f2;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }
        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #1877f2;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #145dbf;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Post</h2>
        <form action="addPost" method="post">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>

            <label for="content">Content:</label>
            <textarea id="content" name="content" rows="4" required></textarea>

            <label for="postTypeId">Post Type:</label>
            <select id="postTypeId" name="postTypeId" required>
                <c:forEach var="type" items="${postTypes}">
                    <option value="${type.id}">${type.type}</option>
                </c:forEach>
            </select>

            <button type="submit">Add Post</button>
        </form>
    </div>
</body>
</html>
