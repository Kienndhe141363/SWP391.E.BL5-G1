<%-- 
    Document   : register
    Created on : Aug 8, 2024, 10:51:37 PM
    Author     : hieupham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link rel="stylesheet" href="css/register.css">
    </head>
   <body>
       <div class="col-lg-6 col-md-6">
                        <div class="account_form register">
                            <h2>Đăng ký</h2>
                            <form action="user?action=signup" method="POST">
                                <p>   
                                    <label>Email <span></span></label>
                                    <input type="email" name="user_email" placeholder="Nhập email của bạn" required>
                                </p>                                                               
                                <p>   
                                    <label>Mật khẩu <span></span></label>
                                    <input type="password" name="user_pass" placeholder="Nhập mật khẩu " required>
                                </p>
                                <p>   
                                    <label>Nhập lại mật khẩu <span></span></label>
                                    <input type="password" name="re_pass" placeholder="Nhập lại mật khẩu">
                                </p>
                                <button type="submit"  onclick="onSubmit()">Đăng Ký</button>
                            </form>
                             </div>
                          
                    </div>
   </body>
</html>
