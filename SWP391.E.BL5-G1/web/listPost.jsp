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
    <title>Post List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.2);
        }
        header {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        header h1 {
            margin: 0;
            color: #1877f2;
        }
        .add-post-button {
            background-color: #1877f2;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            display: inline-block;
            margin-left: auto;
        }
        .add-post-button:hover {
            background-color: #1558a2;
        }
        .post {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.2);
            margin-bottom: 20px;
            padding: 15px;
            display: flex;
            flex-direction: column;
        }
        .post-header {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .post-title {
            font-size: 18px;
            font-weight: bold;
            margin: 0;
            color: #333;
        }
        .post-meta {
            font-size: 14px;
            color: #888;
        }
        .post-content {
            margin: 10px 0;
        }
        .post-actions {
            margin-top: 10px;
        }
        .button {
            background-color: #1877f2;
            color: white;
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            margin: 0 5px;
            display: inline-block;
        }
        .button:hover {
            background-color: #1558a2;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Post List</h1>
            <a href="addPost" class="add-post-button">Add Post</a>
        </header>
        <div class="posts">
            <c:forEach var="post" items="${posts}">
                <div class="post">
                    <div class="post-header">
                        <h2 class="post-title">${post.title}</h2>
                    </div>
                    <div class="post-meta">
                        <span>Created At: ${post.createAt}</span> | 
                        <span>Updated At: ${post.updateAt}</span>
                    </div>
                    <div class="post-content">
                        <p>${post.content}</p>
                    </div>
                    <div class="post-actions">
                        <a href="editPost?postId=${post.postId}" class="button">Edit</a>
                        <a href="deletePost?postId=${post.postId}" class="button" onclick="return confirm('Are you sure you want to delete this post?');">Delete</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>

