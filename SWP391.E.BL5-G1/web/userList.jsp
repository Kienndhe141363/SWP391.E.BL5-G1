<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Danh sách user</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS 
        ========================= -->
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>
        <!-- shopping cart area start -->
        <div class="shopping_cart_area">
            <div class="container">  
                <div class="row">
                    <div class="col-12">
                        <div class="table_desc">
                            <div class="cart_page table-responsive">
                                <table border="1px">
                                    <thead>
                                        <tr>
                                            <th>user_id</th>
                                            <th>user_name</th>
                                            <th>user_email</th>
                                            <th>isAdmin</th>
                                            <th>dateOfBirth</th>
                                            <th>address</th>
                                            <th>phoneNumber</th>
                                            <th>banned</th>
                                            <th>adminReason</th>
                                            <th>isStoreStaff</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${users}" var="user">
                                            <tr>
                                                <td>${user.user_id}</td>
                                                <td>${user.user_name}</td>
                                                <td>${user.user_email}</td>
                                                <td>${user.isAdmin}</td>
                                                <td>${user.dateOfBirth}</td>
                                                <td>${user.address}</td>
                                                <td>${user.phoneNumber}</td>
                                                <td>${user.banned}</td>
                                                <td>${user.adminReason}</td>
                                                <td>${user.isStoreStaff}</td>
                                                <td></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>   
                            </div> 
                        </div>
                    </div>
                </div>
            </div>     
        </div>
        <!-- shopping cart area end -->
    </body>
</html>