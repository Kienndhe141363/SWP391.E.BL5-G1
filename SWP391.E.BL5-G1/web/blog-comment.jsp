<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sản Phẩm  | You&Me</title>
        <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            .product-buttons {
                display: flex;
                gap: 10px;
            }

            .button {
                display: inline-block;
                padding: 10px 20px;  /* Adjust padding as needed */
                font-size: 16px;
                font-weight: bold;
                text-align: center;
                text-decoration: none;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                white-space: nowrap;  /* Prevent text wrapping */
            }

            .button:hover {
                background-color: #0056b3;
            }

            .button:active {
                background-color: #003d82;
            }

            .button-secondary {
                background-color: #28a745;
            }

            .button-secondary:hover {
                background-color: #218838;
            }

            .button-secondary:active {
                background-color: #1e7e34;
            }
            /* General Styles */
            body {
                font-family: 'Arial', sans-serif;
                line-height: 1.6;
                color: #333;
                margin: 0;
                padding: 0;
                background-color: #f5f5f5;
            }



            /* Product Name */
            h1 {
                font-size: 3em;
                margin-bottom: 20px;
                color: #2c3e50;
                font-weight: bold;
                text-align: center;
            }

            /* Product Price */
            .product_price {
                font-size: 1.5em;
                margin-bottom: 20px;
                color: #e74c3c;
                text-align: center;
                font-weight: bold;
            }
            .product_price label {
                font-weight: bold;
                color: #555;
            }
            .product_price .current_price {
                font-size: 2em;
                color: #e74c3c;
                font-weight: bold;
            }

            /* Product Description */
            .product_desc {
                margin-top: 20px;
                padding: 20px;
                border-radius: 5px;
                background-color: #f9f9f9;
            }
            .product_desc label {
                display: block;
                font-size: 1.5em;
                font-weight: bold;
                color: #555;
                margin-bottom: 10px;
            }
            .product_desc p {
                margin: 0;
                font-size: 1.2em;
                color: #34495e;
                font-weight: bold;
            }

            .product_reviews {
                margin-top: 30px;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 5px;
            }
            .rating, .comment {
                margin-bottom: 15px;
                padding: 10px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            }
            .rating p, .comment p {
                margin: 5px 0;
            }
            .highlight {
                color: gold; /* Or any other style you want to apply */
            }
        </style>
        <style>
            /* Form container style */
            .form-container {
                margin-bottom: 20px;
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            /* Form heading style */
            .form-container h3 {
                font-size: 1.5em;
                margin-bottom: 10px;
                color: #333;
            }

            /* Select input style for rating */
            .form-container select {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                font-size: 1em;
                border: 1px solid #ccc;
                border-radius: 3px;
                box-sizing: border-box;
            }

            /* Textarea input style for comment */
            .form-container textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                font-size: 1em;
                border: 1px solid #ccc;
                border-radius: 3px;
                box-sizing: border-box;
            }

            /* Submit button style */
            .form-container button {
                padding: 10px 20px;
                font-size: 1em;
                font-weight: bold;
                color: #fff;
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .form-container button:hover {
                background-color: #0056b3;
            }

            .form-container button:active {
                background-color: #003d82;
            }
            body {
                font-family: Arial, sans-serif;
            }

            .features-list {
                list-style: none;
                padding: 0;
                margin: 0;
                display: flex;
                flex-wrap: wrap;
            }

            .features-list li {
                flex: 1 1 calc(33.333% - 20px);
                box-sizing: border-box;
                padding: 20px;
                margin: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                text-align: center;
            }

            .features-list .icon img {
                width: 50px;
                height: auto;
                margin-bottom: 10px;
            }

            .features-list .text {
                font-size: 14px;
            }

            .features-list .text strong {
                display: block;
                font-size: 16px;
                margin-bottom: 5px;
            }
            .size-selection-container {
                display: flex;
                align-items: center;
                gap:250px;
            }

            #size {
                margin-right: 200px; /* Add a right margin of 200px to the select element */
            }

            #size-guide-link {
                text-decoration: underline; /* Underline the text */
                color: black;
                font-weight: bold;
                transition: color 0.3s ease;
                display: flex;
                align-items: center;
            }

            #size-guide-link i {
                margin-right: 5px; /* Add some space between the icon and the text */
            }

            #size-guide-link:hover {
                color: orange;
            }
            #size-guide-popup {
                display: none;
                position: fixed;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                background-color: white;
                padding: 20px;
                border: 1px solid black;
                z-index: 1000;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow for depth */
                width: 80%; /* Adjust width as needed */
                max-width: 600px; /* Set maximum width to avoid stretching on larger screens */
                text-align: center; /* Center align content */
            }

            #size-guide-popup h3 {
                font-size: 1.5em;
                margin-bottom: 10px;
                color: #333;
            }

            #size-guide-popup table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 10px;
            }

            #size-guide-popup table, #size-guide-popup th, #size-guide-popup td {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #size-guide-popup th {
                background-color: #f2f2f2;
            }

            #size-guide-popup p {
                margin-bottom: 10px;
                font-style: italic;
                color: #666;
            }

            #size-guide-popup button {
                padding: 10px 20px;
                font-size: 1em;
                font-weight: bold;
                color: white;
                background-color: black;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            #size-guide-popup button:hover {
                background-color: orange;
            }
            .star {
                color: gold; /* Màu vàng */
            }
            .product_thumb {
                position: relative;
                overflow: hidden;
                aspect-ratio: 1 / 1; /* Tạo khung hình vuông */
            }

            .product_thumb img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* Đảm bảo ảnh lấp đầy khung mà không bị méo */
                object-position: center; /* Căn giữa ảnh trong khung */
            }

            .single_product {
                margin-bottom: 20px; /* Tạo khoảng cách giữa các sản phẩm */
            }
            a, a:hover, a:focus {
                text-decoration: none;
            }

            .product_content h3 a,
            .banner_content a,
            .slider_content a {
                text-decoration: none;
            }

            .modal-open {
                overflow: hidden;
            }

            .modal {
                position: fixed;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                z-index: 1050;
                display: none;
                overflow: hidden;
                outline: 0;
            }

            .modal-open .modal {
                overflow-x: hidden;
                overflow-y: auto;
            }

            .modal-dialog {
                position: relative;
                width: auto;
                margin: 0.5rem;
                pointer-events: none;
            }

            .modal.fade .modal-dialog {
                -webkit-transition: -webkit-transform 0.3s ease-out;
                transition: -webkit-transform 0.3s ease-out;
                -o-transition: transform 0.3s ease-out;
                transition: transform 0.3s ease-out;
                transition: transform 0.3s ease-out, -webkit-transform 0.3s ease-out;
                -webkit-transform: translate(0, -25%);
                -ms-transform: translate(0, -25%);
                transform: translate(0, -25%);
            }

            @media screen and (prefers-reduced-motion: reduce) {
                .modal.fade .modal-dialog {
                    -webkit-transition: none;
                    -o-transition: none;
                    transition: none;
                }
            }

            .modal.show .modal-dialog {
                -webkit-transform: translate(0, 0);
                -ms-transform: translate(0, 0);
                transform: translate(0, 0);
            }

            .modal-dialog-centered {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
            }

            .modal-content {
                position: relative;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -ms-flex-direction: column;
                flex-direction: column;
                width: 100%;
                pointer-events: auto;
                background-color: #FFF;
                background-clip: padding-box;
                border: 1px solid rgba(0, 0, 0, 0.2);
                border-radius: 0.3rem;
                outline: 0;
            }

            .modal-backdrop {
                position: fixed;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                z-index: 0;
                background-color: #000;
            }

            .modal-backdrop.fade {
                opacity: 0;
            }

            .modal-backdrop.show {
                opacity: 0.5;
            }

            .modal-header {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: start;
                -ms-flex-align: start;
                align-items: flex-start;
                -webkit-box-pack: justify;
                -ms-flex-pack: justify;
                justify-content: space-between;
                padding: 1rem;
                border-radius: .357rem;
            }

            .modal-header .close {
                padding: 8px;
                margin: 0px 0px 0px auto;
            }

            .modal-title {
                margin-bottom: 0;
                line-height: 1.5;
            }

            .modal-body {
                position: relative;
                -webkit-box-flex: 1;
                -ms-flex: 1 1 auto;
                flex: 1 1 auto;
                padding: 1rem;
            }

            .modal-footer {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                -webkit-box-pack: end;
                -ms-flex-pack: end;
                justify-content: flex-end;
                padding: 1rem;
                border-radius: .357rem;
            }

            .modal-footer > :not(:first-child) {
                margin-left: .25rem;
            }

            .modal-footer > :not(:last-child) {
                margin-right: .25rem;
            }

            .modal-scrollbar-measure {
                position: absolute;
                top: -9999px;
                width: 50px;
                height: 50px;
                overflow: scroll;
            }

            @media (min-width: 576px) {
                .modal-dialog {
                    max-width: 500px;
                    margin: 1.75rem auto;
                }
                .modal-dialog-centered {
                    min-height: calc(100% - (1.75rem * 2));
                }
                .modal-sm {
                    max-width: 300px;
                }
            }

            @media (min-width: 992px) {
                .modal-lg {
                    max-width: 800px;
                }
            }

            .highlight {
                color: white; /* Or any other style you want to apply */
                background-color: cornflowerblue;
            }

            .btn .highlight{
                color: white;
                background-color: cornflowerblue;
            }

            .boldTitle{
                font-weight: 700;
            }

        </style>


    </head>
    <body>
        <%--<jsp:include page="layout/menu.jsp"/>--%>
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>


        <div class="container my-5">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-white">
                    <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Cửa hàng</li>
                </ol>
            </nav>


            <div class="row">
                <div class="col-lg-12" style="margin-top:1rem">
                    <c:forEach items="${BlogData}" var="p">
                        <h1 style="text-align: left">
                            ${p.title}

                        </h1>
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <p class="mb-0">Lượt xem Blog (1000)</p>
                            <div class="dropdown">
                                <!-- <c:if test="${sessionScope.user.isAdmin}">
                                    <button type="button" data-toggle="modal" data-target="#ModalUpdate${blogId}" class="btn btn-save"  title="Thêm">
                                        <i class="fas fa-edit"></i>Chỉnh sửa nội dung Blog</button>
                                </c:if>-->
                                <div class="modal fade" id="ModalUpdate${blogId}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-body" style="padding:0.5rem 1rem">
                                                <form id="contact-form2" action="blog?action=addBlog" method="POST">
                                                    <input type="hidden" name="action" value="addBlog">
                                                    <div class="row">   
                                                        <div class="form-group col-md-12">
                                                            <span class="thong-tin-thanh-toan">
                                                                <h4>Thêm mới chủ đề</h4>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="padding: 0.5rem 1rem; width:100%">
                                                        <input style="font-weight: bolder" name="user_id" readonly type="text" hidden="true">
                                                        <input style="font-weight: bolder" name="blog_id" readonly type="text" hidden="true" value="${blogId}">
                                                        Tiêu đề Blog:
                                                        <input style="font-weight: bolder; margin-bottom: 10px" name="title"  type="text">
                                                        Tóm tắt chung:
                                                        <textarea  style="margin-top: 10px; width:100%" rows="4" cols="50" name="summary" type="text"></textarea>
                                                        Nội dung:
                                                        <textarea  style="margin-top: 10px; width:100%" rows="4" cols="50" name="content" type="text"></textarea>
                                                        <input style="font-weight: bolder" name="blog_img" readonly type="text" hidden="true">
                                                    </div>
                                                    <div style="margin-top: 10px; text-align: center">
                                                        <button class="btn btn-save" style="background-color: green; color:white" type="submit">Gửi</button>
                                                        <a class="btn btn-cancel" style="background-color: red; color:white"  data-dismiss="modal">Hủy bỏ</a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div style="border: 0.5px solid; margin-bottom: 30px">
                                <div class="card-body">
                                    <p class="card-text product-price">${p.content}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>
                <c:if test="${not empty CommentData}">
                    <div>
                        <h4 style="text-align: left">Thảo luận đề tài:</h4>
                        <c:forEach items="${CommentData}" var="c">
                            <div style="width: 100%;margin-top: 10px;">
                                <h5 class="card-title product-title ${c.userId == idUser ? 'boldTitle' : ''}">Người dùng #${c.userId}</h5>
                            </div>
                            <div class="col-md-9 mb-9" style="display: flex; border: 0.5px solid; border-radius: 5px;">


                                <div class="card-body" style="width: 80%; color: black">
                                    <p class="card-text product-price">${c.commentText}</p>
                                </div>
                                <c:if test="${c.userId == idUser}">
                                    <div style="width:9%; text-align: right; display: flex;">
                                        <button class="btn" style="max-height: 30px" type="button" data-toggle="modal" data-target="#ModalEditComment${c.userId}" class="edit-icon" title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i></button>
                                        <a href="blog-comment?action=deleteBlogComment&blog_id=${c.blogId}&comment_id=${c.commentId}" class="btn"><i class="fas fa-trash"></i></a>

                                    </div>
                                    <div class="modal fade" id="ModalEditComment${c.userId}" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body" style="padding:0.5rem 1rem">
                                                    <form id="contact-form2" action="blog-comment?action=updateBlogComment" method="POST">
                                                        <input type="hidden" name="action" value="addBlog">
                                                        <div class="row">   
                                                            <div class="form-group col-md-12">
                                                                <span class="thong-tin-thanh-toan">
                                                                    <h4 style="color: black">Chỉnh sửa nội dung</h4>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="padding: 0.5rem 1rem; width:100%">
                                                            <input style="font-weight: bolder" name="comment_id" readonly type="text" hidden="true" value="${c.commentId}">
                                                            <input style="font-weight: bolder" name="blog_id" readonly type="text" hidden="true" value="${blogId}">
                                                            <textarea  style="margin-top: 10px; width:100%" rows="4" cols="50" placeholder="${c.commentText}" name="comment_text" type="text" value="commentText"></textarea>
                                                        </div>
                                                        <div style="margin-top: 10px; text-align: center">
                                                            <button class="btn btn-save" style="background-color: green; color:white" type="submit">Gửi</button>
                                                            <a class="btn btn-cancel" style="background-color: red; color:white"  data-dismiss="modal">Hủy bỏ</a>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${sessionScope.user}">
            <div class="form-container" style="margin-top: 10px">
                <form action="blog-comment?action=addBlogComment&blog_id=${blogId}" method="POST">
                    <input type="hidden" name="action" value="addBlogComment">
                    <h3>Góc bình luận</h3>
                    <textarea name="comment_text" rows="4" cols="50" placeholder="Nhập bình luận của bạn"></textarea>
                    <c:if test="${not empty sessionScope.user}">
                        <button type="submit">Gửi bình luận</button>
                    </c:if>
                </form>
            </div>
            </c:if>
        </div>

        <%--<jsp:include page="layout/footer.jsp"/>--%>

        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
        <script src="https://static.elfsight.com/platform/platform.js" data-use-service-core defer></script>
        <script>
            jQuery(document).ready(function () {
                // Event delegation for delete buttons
                jQuery(document).on('click', '.aaa', function () {
                    var id = $(this).attr("value");
                    swal({
                        title: "Cảnh báo",
                        text: "Bạn có chắc chắn là muốn xóa phản hồi này?",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    }).then((willDelete) => {
                        if (willDelete) {
                            window.location = "blog-comment?action=deleteBlogComment&blog_id=" + id;
                            swal("Đã xóa thành công!", {
                                icon: "success",
                            });
                        }
                    });
                });
            });
        </script>
    </body>
</html>