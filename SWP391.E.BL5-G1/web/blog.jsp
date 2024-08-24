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
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f8f9fa;
            }
            .navbar {
                box-shadow: 0 2px 4px rgba(0,0,0,.1);
            }
            .sidebar {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,.05);
                padding: 20px;
            }
            .sidebar h2 {
                font-size: 1.2rem;
                color: #333;
                margin-bottom: 15px;
                border-bottom: 2px solid #007bff;
                padding-bottom: 10px;
            }
            .sidebar ul {
                list-style-type: none;
                padding-left: 0;
            }
            .sidebar ul li {
                margin-bottom: 10px;
                text-decoration: none;
                background-color: #f1f1f1;
                padding: 10px;
                border-radius: 8px;
                transition: background-color 0.3s ease;
            }
            .sidebar ul li a {
                color: #555;
                text-decoration: none;
                display: block;
                width: 100%;
                font-family: serif;
            }
            .sidebar ul li:hover {
                background-color: #007bff;
            }
            .sidebar ul li:hover a {
                color: #fff;
            }
            .form-check {
                margin-bottom: 10px;
                background-color: #f1f1f1;
                padding: 10px;
                border-radius: 8px;
                transition: background-color 0.3s ease;
                padding-left: 25px!important;
            }
            .form-check:hover {
                background-color: #007bff;
            }
            .form-check-label {
                color: #555;
            }
            .form-check:hover .form-check-label {
                color: #fff;
            }
            .product-card {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,.05);
                transition: transform 0.3s ease;
            }
            .product-card:hover {
                transform: translateY(-5px);
            }
            .product-img {
                height: 200px;
                object-fit: cover;
                border-top-left-radius: 8px;
                border-top-right-radius: 8px;
            }
            .product-title {
                font-size: 1rem;
                margin-top: 15px;
            }
            .product-price {
                font-weight: bold;
                color: #007bff;
            }
            .pagination .page-item.active .page-link {
                background-color: #007bff;
                border-color: #007bff;
            }
            .breadcrumb_content ul li:last-child {
                margin-right: 0;
            }
            .breadcrumb_content ul li a {
                color: #999999;
            }
            .breadcrumb_content ul li a:hover {
                color: #ff6a28;
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


                <div class="col-lg-12" style="margin-top: 30px">
                    <h1 class="mb-4">Danh sách các mục thảo luận</h1>
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <p class="mb-0">Hiển thị ${BlogData.size()} Blog</p>
                        <div class="dropdown">
                                 <!--<c:if test="${sessionScope.user.isAdmin}">
                            <button type="button" data-toggle="modal" data-target="#ModalAdd" class="btn btn-save"  title="Thêm">
                                <i class="fas fa-plus"></i>Thêm mới Blog</button>
                                </c:if>-->
                            <div class="modal fade" id="ModalAdd" tabindex="-1" role="dialog" aria-hidden="true">
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
                                                    <input style="font-weight: bolder" name="blog_id" readonly type="text" hidden="true" value="${blog_id}">
                                                    Tên Blog:
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
<!--                        <button value="${album_id}" class="btn btn-trash btn-sm trash" style="background-color:red; color: white" >
                        <i class="fas fa-trash"></i>
                    </button>-->
                            <%--<c:if test="${album_id}">--%>
                                <!--<a class="btn btn-cancel" href="album?action=deleteAlbum&album_id=${album_id}" style="background-color: red; color:white"  data-dismiss="modal"><i class="fas fa-trash"></i></a>-->
                            <%--</c:if>--%>

                        </div>
                    </div>
                    <div class="row">
                        <c:choose>
                            <c:when test="${empty BlogData}">
                                <div class="col-12 text-center">
                                    <img src="assets/img/logo/no-products-found.jpg" alt="No products found" class="img-fluid mb-3" style="max-width: 200px;">
                                    <p class="lead">Chưa có BLOG nào trong đây</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${BlogData}" var="p">
                                    <div class="col-md-4 mb-4">
                                        <div class="card product-card">
                                            <img src="${p.images}" class="card-img-top product-img">
                                            <div class="card-body">
                                                <h5 class="card-title product-title">${p.title}</h5>
                                                <p class="card-text product-price">${p.summary}</p>
                                                <a href="blog-comment?action=blogdetail&blog_id=${p.blogId}" class="btn btn-primary btn-sm">Đọc nội dung</a>
                                                <!--<a href="blog?action=deleteBlog&blog_id=${p.blogId}" class="btn btn-trash btn-sm" style="background-color:red"><i class="fas fa-trash"></i></a>-->
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>

                   
                </div>
            </div>
            <div class="elfsight-app-94027198-7458-4351-8ca9-9bf86706a713" data-elfsight-app-lazy></div>

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
                            window.location = "album?action=deleteAlbum&product_id=" + id;
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