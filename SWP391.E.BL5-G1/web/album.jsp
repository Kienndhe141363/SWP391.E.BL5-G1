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
                <div class="col-lg-3">
                    <div class="sidebar mb-4">
                        <h2><i class="fas fa-th-list mr-2"></i>Danh mục</h2>
                        <ul>
                            <c:forEach items="${AlbumData}" var="c">
                                <li><a href="album?action=filter&album_id=${c.album_id}">${c.album_name}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-9">
                    <h1 class="mb-4">Sản phẩm</h1>
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <p class="mb-0">Hiển thị ${ProductData.size()} sản phẩm</p>
                        <!--                        <div class="dropdown">
                                                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        Sắp xếp
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                        <a class="dropdown-item" href="search?action=sort&type=low">Giá từ thấp đến cao</a>
                                                        <a class="dropdown-item" href="search?action=sort&type=high">Giá từ cao xuống thấp</a>
                                                        <a class="dropdown-item" href="search?action=sort&type=a-z">A-Z</a>
                                                    </div>
                                                </div>-->
                        <div class="dropdown">
                        <button type="button" data-toggle="modal" data-target="#Modal${album_id}" class="edit-icon" title="Thêm">
                                                    <i class="fas fa-plus"></i>Thêm Album</button>
                            <div class="modal fade" id="Modal${album_id}" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-body" style="padding:0.5rem 1rem">
                                                <form id="contact-form" action="album?action=addAlbum?album_id=${album_id}" method="POST">
                                                    <input type="hidden" name="action" value="addAlbum">
                                                    <div class="row">   
                                                        <div class="form-group col-md-12">
                                                            <span class="thong-tin-thanh-toan">
                                                                <h4>Thêm mới BST</h4>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="padding: 0.5rem 1rem; width:100%">
                                                        <input style="font-weight: bolder" name="user_id" readonly type="text" hidden="true">
                                                        Tên Album:
                                                        <input style="font-weight: bolder; margin-bottom: 10px" name="album_name"  type="text">
                                                        Nội dung mô tả:
                                                        <textarea  style="margin-top: 10px; width:100%" rows="4" cols="50" name="album_description" type="text"></textarea>

                                                    </div>
                                                    <div style="margin-top: 10px; text-align: center">
                                                        <button class="btn btn-save" style="background-color: green; color:white" type="submit">Gửi</button>
                                                        <a class="btn btn-cancel" style="background-color: red; color:white"  data-dismiss="modal" href="#">Hủy bỏ</a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        <button value="${album_id}" class="btn btn-trash btn-sm trash" style="background-color:red; color: white" >
                            <i class="fas fa-trash"></i>
                        </button>
                        </div>
                    </div>
                    <div class="row">
                        <c:choose>
                            <c:when test="${empty ProductData}">
                                <div class="col-12 text-center">
                                    <img src="assets/img/logo/no-products-found.jpg" alt="No products found" class="img-fluid mb-3" style="max-width: 200px;">
                                    <p class="lead">Bạn chưa thêm sản phẩm vào BST này</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${ProductData}" var="p">
                                    <div class="col-md-4 mb-4">
                                        <div class="card product-card">
                                            <img src="${p.img}" class="card-img-top product-img" alt="${p.product_name}">
                                            <div class="card-body">
                                                <h5 class="card-title product-title">${p.product_name}</h5>
                                                <p class="card-text product-price">${p.product_price} VNĐ</p>
                                                <a href="search?action=productdetail&product_id=${p.product_id}" class="btn btn-primary btn-sm">Xem chi tiết</a>
                                                <a href="album?action=deleteProduct&product_id=${p.product_id}" class="btn btn-trash btn-sm" style="background-color:red"><i class="fas fa-trash"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <nav aria-label="Page navigation" class="mt-4">
                        <ul class="pagination justify-content-center">
                            <c:forEach begin="${1}" end="${num}" var="i">
                                <li class="page-item ${i==page?'active':''}">
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.selectedCategoryId}">
                                            <a class="page-link" href="search?action=listByCategory&category_id=${sessionScope.selectedCategoryId}&page=${i}">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="page-link" href="product?page=${i}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
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
        jQuery(document).on('click', '.trash', function () {
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