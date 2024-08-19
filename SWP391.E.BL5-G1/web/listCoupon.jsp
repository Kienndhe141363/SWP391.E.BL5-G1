<%-- 
    Document   : listCoupon
    Created on : Aug 19, 2024, 11:47:26 AM
    Author     : ThangNPHE151263
--%>

<%@ page import="model.Coupon" %>
<%@ page import="model.CouponType" %>
<!DOCTYPE html>
<html>
<head>
    <title>Coupon List</title>
</head>
<body>
    <h1>List of Coupons</h1>
    <a href="couponManager?action=generate">Generate New Coupon</a>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Usage Limit</th>
                <th>Coupon Type</th>
                <th>Code</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Coupon> coupons = (List<Coupon>) request.getAttribute("coupons");
                for (Coupon coupon : coupons) {
            %>
            <tr>
                <td><%= coupon.getId() %></td>
                <td><%= coupon.getStartDate() %></td>
                <td><%= coupon.getEndDate() %></td>
                <td><%= coupon.getUsageLimit() %></td>
                <td><%= coupon.getCouponTypeId() %></td>
                <td><%= coupon.getCode() %></td>
                <td>
                    <a href="couponManager?action=delete&couponId=<%= coupon.getId() %>">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
