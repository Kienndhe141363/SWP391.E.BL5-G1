<%-- 
    Document   : listPost
    Created on : Aug 23, 2024, 2:22:58 PM
    Author     : ThangNPHE151263
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bài Đăng | You&Me</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link rel="stylesheet" href="assets/css/style.css">
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
                position: relative;
            }
            .post-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 10px;
            }
            .post-user {
                font-weight: bold;
                margin-right: auto; 
            }
            .post-actions {
                display: flex;
                align-items: center;
                gap: 10px; 
            }
            .post-actions a {
                display: inline-flex;
                width: 24px;
                height: 24px;
                text-align: center;
                line-height: 24px;
                color: #007bff; 
                font-size: 16px;
                text-decoration: none;
                background-color: transparent; 
                border: none; 
            }
            .post-actions a:hover {
                color: #0056b3; 
            }
            .post-time {
                margin-left: 10px;
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
        </style>

    </head>
    <body>
        <div class="off_canvars_overlay"></div>
        <jsp:include page="menu.jsp"/>

        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Trang chủ</a></li>
                                <li>/</li>
                                <li>Bài đăng</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>

        <div class="container">
            <h2>Danh sách bài viết</h2>
            <a href="addPost" class="button">Thêm bài viết</a>
            <c:forEach var="post" items="${posts}">
                <div class="post-container">
                    <div class="post-header">
                        <span class="post-user">${post.username}</span>
                        <div class="post-actions">
                            <c:if test="${user.user_id == post.userid}">
                                <a href="editPost?postId=${post.postId}" class="button">✎</a> 
                            </c:if>
                            <c:if test="${user.user_id == post.userid || user.isAdmin == 'TRUE'}">
                                <a href="deletePost?postId=${post.postId}"  class="button" onclick="return confirm('Bạn có chắc chắn muốn xóa bài viết này?');">🗑️</a> <!-- Xóa -->
                            </c:if>
                            <span class="post-time">${post.createAt}</span>
                        </div>
                    </div>
                    <div class="post-title">
                        ${post.title}
=======
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
>>>>>>> 071aa024a747e4020b2b8fa1120ae60971fc3dfa
                    </div>
                    <div class="post-content">
                        <p>${post.content}</p>
                    </div>
<<<<<<< HEAD
                </div>
            </c:forEach>
        </div>
        <jsp:include page="footer.jsp"/>

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
=======
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

>>>>>>> 071aa024a747e4020b2b8fa1120ae60971fc3dfa
