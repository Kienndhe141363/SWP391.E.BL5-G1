<%-- 
    Document   : generateCoupon
    Created on : Aug 19, 2024, 11:48:10 AM
    Author     : ThangNPHE151263
--%>

<%@ page import="model.CouponType" %>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Coupon</title>
</head>
<body>
    <h1>Generate New Coupon</h1>
    <form action="couponManager" method="post">
        <input type="hidden" name="action" value="create" />
        <label for="couponTypeId">Coupon Type:</label>
        <select id="couponTypeId" name="couponTypeId">
            <% 
                List<CouponType> couponTypes = (List<CouponType>) request.getAttribute("couponTypes");
                for (CouponType type : couponTypes) {
            %>
            <option value="<%= type.getCouponTypeId() %>"><%= type.getCouponDescription() %></option>
            <% } %>
        </select>
        <br />
        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" required />
        <br />
        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" required />
        <br />
        <label for="usageLimit">Usage Limit:</label>
        <input type="number" id="usageLimit" name="usageLimit" required />
        <br />
        <input type="submit" value="Generate Coupon" />
    </form>
    <a href="couponManager?action=list">Back to List</a>
</body>
</html>
