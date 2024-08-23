<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Thông Tin Sản Phẩm  |  You&Me</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS -->
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">
        <link rel="stylesheet" type="text/css" href="admin/css/main.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>
    <style>.product-buttons {
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
            color: gold; /* Or any other style you want to apply */
        }

        .btn .highlight{
            color: gold;
        }

    </style>

    <body>


        <!-- Main Wrapper Start -->
        <div class="off_canvars_overlay"></div>
        <jsp:include page="layout/menu.jsp"/>

        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area product_bread">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Trang chủ</a></li>
                                <li>/</li>
                                <li>Chi tiết sản phẩm</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--breadcrumbs area end-->

        <!--product details start-->
        <div class="product_details">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-5">
                        <div class="product-details-tab">
                            <div id="img-1" class="zoomWrapper single-zoom">
                                <a href="#">
                                    <img id="zoom1" src="${ProductData.img}" data-zoom-image="${ProductData.img}" alt="product">
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-7 col-md-7">
                        <div class="product_d_right">
                            <form id="productForm" action="cart" method="POST">
                                <input type="hidden" name="action" id="action" value="addtocart">
                                <input type="hidden" name="product_id" value="${ProductData.product_id}">
                                <div class="product_container">                               
                                    <h1>${ProductData.product_name}</h1>
                                    <div class="product_price">
                                        <label >Giá tiền: </label>
                                        <span class="current_price">${ProductData.product_price} VNĐ</span>
                                    </div>
                                    <div class="product_desc">
                                        <h4>Đánh giá trung bình: 
                                            <fmt:formatNumber value="${averageRating}" maxFractionDigits="1"/> <span class="star">&#9733;</span>
                                        </h4>
                                        <label>Mô tả sản phẩm: </label>
                                        <p>${ProductData.product_describe}</p>
                                    </div>
                                </div>


                                <div class="product_variant color">
                                    <h3>Chọn màu sắc :</h3>
                                    <select class="niceselect_option" id="color" name="color">
                                        <c:forEach items="${ColorData}" var="c">
                                            <option value="${c.color}">${c.color}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="product_variant size">
                                    <h3>Chọn size :</h3>
                                    <div class="size-selection-container">
                                        <select class="niceselect_option" id="size" name="size">
                                            <c:forEach items="${SizeData}" var="s">
                                                <option value="${s.size}">${s.size}</option>
                                            </c:forEach>
                                        </select>
                                        <a href="#" id="size-guide-link">
                                            <i class="fas fa-ruler"></i> Hướng dẫn chọn size
                                        </a>
                                    </div>
                                </div>


                                <div class="product_variant quantity">
                                    <label>Số lượng :</label>
                                    <input min="1" max="${ProductData.quantity}" name="quantity" type="number" value="1">
                                    <div class="product-buttons">
                                        <button class="button" type="submit">Thêm vào giỏ hàng</button>
                                        <button class="button button-secondary" type="button" onclick="setActionAndSubmit('buynow')">Mua ngay</button>
                                        
                                       
                                    </div>
                                    
                                </div>
                                    


                            </form>
                                    <div  class="product_variant quantity" style="width: 100%">
                                        <div class="product-buttons">
                                            <button type="button" data-toggle="modal" data-target="#ModalAddAlbum${ProductData.product_id}" class="button" title="Thêm">Thêm vào Album</button>
                                        
                                        </div>
                                    </div>
                        </div>
                    </div>
                                            <div class="modal fade" id="ModalAddAlbum${ProductData.product_id}" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-body" style="padding:0.5rem 1rem">
                                                        <form id="contact-form" action="search?action=addProductAlbum&product_id=${ProductData.product_id}" method="POST">
                                                            <input type="hidden" name="action" value="addProduct">
                                                            <div class="row">   
                                                                <div class="form-group col-md-12">
                                                                    <span class="thong-tin-thanh-toan">
                                                                        <h4>Thêm mới BST</h4>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div    class="row" style="padding: 0.5rem 1rem; width:100%">
                                                                Chọn album mà bạn muốn bổ sung vào:
                                                                
                                                            <input type="hidden" name="product_id" value="${ProductData.product_id}">
                                                            <input type="hidden" name="product_name" value="${ProductData.product_name}">
                                                            <input type="hidden" name="product_price" value="${ProductData.product_price}">
                                                            <input type="hidden" name="product_img" value="${ProductData.img}">

                                                            </div>
                                                            <select style="width: 20%" name="album_id" id="album_id">
                                                                    <c:forEach items="${AlbumData}" var="a">
                                                                        <option value="${a.album_id}">${a.album_name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            <div style="margin-top: 10px; text-align: center">
                                                                <button class="btn" style="background-color: green; color:white" type="submit">Gửi</button>
                                                                <a class="btn" style="background-color: red; color:white"  data-dismiss="modal">Hủy bỏ</a>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                    <ul class="features-list">
                        <li>
                            <div class="icon"><img src="https://routine.vn/static/version1718856864/frontend/Magenest/routine/vi_VN/images/free.png" alt="Freeship toàn quốc từ 399k"></div>
                            <div class="text">
                                <strong>Miễn phí vận chuyển</strong>

                            </div>
                        </li>
                        <li>
                            <div class="icon"><img src="https://routine.vn/static/version1718856864/frontend/Magenest/routine/vi_VN/images/order.png" alt="Theo dõi đơn hàng dễ dàng"></div>
                            <div class="text">
                                <strong>Theo dõi đơn hàng <br>một cách dễ dàng</strong>
                            </div>
                        </li>
                        <li>
                            <div class="icon"><img src="https://routine.vn/static/version1718856864/frontend/Magenest/routine/vi_VN/images/returns.png" alt="Đổi trả tận nơi"></div>
                            <div class="text">
                                <strong>Đổi trả linh hoạt</strong>
                                <p>Với sản phẩm không áp dụng khuyến mãi</p>
                            </div>
                        </li>
                        <li>
                            <div class="icon"><img src="https://routine.vn/static/version1718856864/frontend/Magenest/routine/vi_VN/images/pay.png" alt="Thanh toán dễ dàng"></div>
                            <div class="text">
                                <strong>Thanh toán dễ dàng <br>nhiều hình thức</strong>
                            </div>
                        </li>
                        <li>
                            <div class="icon"><img src="https://routine.vn/static/version1718856864/frontend/Magenest/routine/vi_VN/images/hotline.png" alt="Hotline hỗ trợ Routine"></div>
                            <div class="text"><strong>Hotline hỗ trợ</strong>
                                <h3>0348956373</h3>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--product details end-->
        <!-- Form for adding rating -->
        <c:if test="${user_comment}">
            <div class="form-container">
                <form action="search?action=addComment&product_id=${ProductData.product_id}" method="POST">
                    <input type="hidden" name="action" value="addComment">
                    <input type="hidden" name="product_id" value="${ProductData.product_id}">
                    <input type="hidden" name="user_id" value="${user.user_id}">                
                    <input type="hidden" name="user_name" value="${user.user_name}">  
                    <h3>Đánh giá sản phẩm</h3>
                    <select name="rating" id="star-rating">

                        <option value="1">1&#9733;</option>
                        <option value="2">2&#9733;&#9733;</option>
                        <option value="3">3&#9733;&#9733;&#9733;</option>
                        <option value="4">4&#9733;&#9733;&#9733;&#9733;</option>
                        <option value="5">5&#9733;&#9733;&#9733;&#9733;&#9733;</option>
                    </select>
                    <textarea name="comment" rows="4" cols="50" placeholder="Nhập bình luận của bạn"></textarea>
                    <button type="submit">Gửi bình luận</button>
                </form>
            </div>
        </c:if>



        <c:if test="${haveCmt}">
            <div class="product_reviews">
                <h3>Đánh giá và Bình luận</h3>
                <div class="dropdown" style="width: 100%; text-align: right;">            
                    <a class="${comment_filter == '6' ? 'highlight' : ''}" style="margin-right: 10px;" href="search?action=productdetail&product_id=${ProductData.product_id}">
                        Tất cả (${numberOfComments})
                    </a>
                    <a class="${comment_filter == '1' ? 'highlight' : ''}" style="margin-right: 10px;" href="search?action=productdetail&product_id=${ProductData.product_id}&comment_filter=1">
                        1&#9733; (${numberOfComments1})
                    </a>
                    <a class="${comment_filter == '2' ? 'highlight' : ''}" style="margin-right: 10px;" href="search?action=productdetail&product_id=${ProductData.product_id}&comment_filter=2">
                        2&#9733;&#9733; (${numberOfComments2})
                    </a>
                    <a class="${comment_filter == '3' ? 'highlight' : ''}" style="margin-right: 10px;" href="search?action=productdetail&product_id=${ProductData.product_id}&comment_filter=3">
                        3&#9733;&#9733;&#9733; (${numberOfComments3})
                    </a>
                    <a class="${comment_filter == '4' ? 'highlight' : ''}" style="margin-right: 10px;" href="search?action=productdetail&product_id=${ProductData.product_id}&comment_filter=4">
                        4&#9733;&#9733;&#9733;&#9733; (${numberOfComments4})
                    </a>
                    <a class="${comment_filter == '5' ? 'highlight' : ''}" style="margin-right: 10px;" href="search?action=productdetail&product_id=${ProductData.product_id}&comment_filter=5">
                        5&#9733;&#9733;&#9733;&#9733;&#9733; (${numberOfComments5})
                    </a>
                </div>
                <h5>Bình luận:</h5>
                <c:forEach items="${comments}" var="c">
                    <div class="comment" style="position: relative; display: flex">
                        <div style="width: 90%; text-align: left">
                            <p>Bởi: ${c.user_name}</p> 
                            <p>Đánh giá: ${c.rating}&#9733</p>
                            <p>Ngày: <fmt:formatDate value="${c.createdAt}" pattern="dd/MM/yyyy"/></p>
                            <p>${c.comment}</p>
                        </div>
                        <c:if test="${c.user_name == user.user_name}">
                            <div style="width:10%; text-align: right; display: flex;">
                                <button class="btn btn-primary btn-sm edit" style="margin-right: 10px;  max-height: 34px; background-color: green" type="button" data-toggle="modal" data-target="#ModalEditComment${c.user_name}" class="edit-icon" title="Chỉnh sửa">
                                    <i class="fas fa-edit"></i></button>
                                <button class="btn btn-primary btn-sm trash" style="max-height: 34px; background-color: red" type="button" title="xóa" value="${c.id}">
                                    <i class="fas fa-trash"></i></button>
                            </div>

                        </c:if>
                    </div>
                    <div class="modal fade" id="ModalEditComment${c.user_name}" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-body" style="padding:0 1rem">
                                    <form action="search?action=updatecmt&product_id=${ProductData.product_id}" method="POST">
                                        <input type="hidden" name="action" value="updatecmt">
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <span class="thong-tin-thanh-toan">
                                                    <h5>Chỉnh sửa đánh giá</h5>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="row" style="padding: 0 1rem">
                                            <h5>Đánh giá sản phẩm <b>#${ProductData.product_id}</b></h5>
                                            <!--                                        <select name="rating_filter" id="star-rating">     
                                                                                        <option value="1">1&#9733;</option>
                                                                                        <option value="2">2&#9733;&#9733;</option>
                                                                                        <option value="3">3&#9733;&#9733;&#9733;</option>
                                                                                        <option value="4">4&#9733;&#9733;&#9733;&#9733;</option>
                                                                                        <option value="5">5&#9733;&#9733;&#9733;&#9733;&#9733;</option>
                                                                                    </select>-->
                                            <input name="idproduct" value="${c.id}" hidden="true">
                                            <textarea name="comment-update" style="margin-top: 10px" rows="4" cols="50" placeholder="Nhập bình luận của bạn"></textarea>
                                        </div>
                                        <div style="margin-top: 10px; text-align: right">
                                            <button class="btn btn-save" style="background-color:green" type="submit">Lưu lại</button>
                                            <a class="btn btn-cancel"  style="background-color:red" data-dismiss="modal" href="#">Hủy bỏ</a>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <div class="elfsight-app-94027198-7458-4351-8ca9-9bf86706a713" data-elfsight-app-lazy></div>








        <!--product section area start-->
        <section class="product_section related_product">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Sản phẩm tương tự</h2>
                        </div>
                    </div>
                </div>
                <div class="product_area">
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${ProductByCategory}" var="pc">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img" href="product?action=productdetail&product_id=${pc.product_id}"><img src="${pc.img}" alt=""></a>
                                        </div>
                                        <div class="product_content">
                                            <h3><a href="product?action=productdetail&product_id=${pc.product_id}">${pc.product_name}</a></h3>
                                            <span class="current_price">${pc.product_price} VNĐ</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--product section area end-->

        <!--footer area start-->
        <jsp:include page="layout/footer.jsp"/>
        <!--footer area end-->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
        <script>
                                            function setActionAndSubmit(action) {
                                                document.getElementById('action').value = action;
                                                document.getElementById('productForm').submit();
                                            }
        </script>
        <div id="size-guide-popup" style="display: none; position: fixed; left: 50%; top: 50%; transform: translate(-50%, -50%); background-color: white; padding: 20px; border: 1px solid black; z-index: 1000;">

            <h3>Bảng size</h3>
            <table border="1">
                <tr>
                    <th>SIZE</th>
                    <th>CHIỀU CAO (CM)</th>
                    <th>CÂN NẶNG (KG)</th>
                    <th>NGANG VAI</th>
                    <th>VÒNG NGỰC</th>
                    <th>VÒNG EO</th>
                    <th>DÀI TAY</th>
                    <th>DÀI ÁO</th>
                </tr>
                <tr>
                    <td>S</td>
                    <td>< 168</td>
                    <td>< 62</td>
                    <td>44.5</td>
                    <td>100</td>
                    <td>96</td>
                    <td>19.5</td>
                    <td>67.5</td>
                </tr>
                <tr>
                    <td>M</td>
                    <td>169 - 172</td>
                    <td>63 - 69</td>
                    <td>46</td>
                    <td>104</td>
                    <td>100</td>
                    <td>21</td>
                    <td>69</td>
                </tr>
                <tr>
                    <td>L</td>
                    <td>173 - 176</td>
                    <td>70 - 76</td>
                    <td>47.5</td>
                    <td>108</td>
                    <td>104</td>
                    <td>22.5</td>
                    <td>71</td>
                </tr>
                <tr>
                    <td>XL</td>
                    <td>177 - 180</td>
                    <td>77 - 83</td>
                    <td>49.5</td>
                    <td>114</td>
                    <td>110</td>
                    <td>24</td>
                    <td>73</td>
                </tr>
                <tr>
                    <td>XXL</td>
                    <td>> 180</td>
                    <td>> 83</td>
                    <td>51.5</td>
                    <td>120</td>
                    <td>116</td>
                    <td>25.5</td>
                    <td>75</td>
                </tr>
            </table>
            <p>97% khách hàng của chúng tôi đã chọn đúng size theo bảng này</p>
            <button id="close-popup">Đóng</button>
        </div>

        <script>
            function showNotification(message, isSuccess) {
                Swal.fire({
                    title: isSuccess ? 'Thành công!' : 'Lỗi!',
                    text: message,
                    icon: isSuccess ? 'success' : 'error',
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 6000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                });
            }

// Kiểm tra và hiển thị thông báo khi trang được tải
            document.addEventListener('DOMContentLoaded', function () {
                var successMessage = "${sessionScope.successMessageAdd}";
                var errorMessage = "${sessionScope.errorMessage}";

                if (successMessage) {
                    showNotification(successMessage, true);
                    // Xóa thông báo khỏi session
            <% session.removeAttribute("successMessageAdd"); %>
                } else if (errorMessage) {
                    showNotification(errorMessage, false);
                    // Xóa thông báo khỏi session
            <% session.removeAttribute("errorMessage"); %>
                }
            });

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
                            window.location = "search?action=delete&cmt_id=" + id;
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