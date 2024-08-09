<%-- 
    Document   : newjsp
    Created on : Aug 8, 2024, 10:59:21 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/mainAdmin.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="productmanager?action=insert" title="Thêm"><i class="fas fa-plus"></i>
                                        Tạo mới sản phẩm</a>
                                </div>                                              

                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i
                                            class="fas fa-print"></i> In dữ liệu</a>
                                </div>
                            </div>
                            <form action="productmanager" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="updateproduct">
                                <table class="table table-hover table-bordered" id="sampleTable">
                                    <thead>
                                        <tr>
                                            <th>Mã sản phẩm</th>
                                            <th>Danh mục</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Giá</th>
                                            <th>Size</th>
                                            <th>Màu</th>
                                            <th>Thông tin</th>
                                            <th>Số lượng</th>
                                            <th>Ảnh</th>
                                            <th>Trạng thái</th>
                                            <th>Chức năng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ProductData}" var="p">
                                            <tr>
                                                <td>${p.product_id}</td>
                                                <td>${p.cate.category_name}</td>
                                                <td>${p.product_name}</td>
                                                <td>${p.product_price}</td>
                                                <td>
                                                    <c:forEach items="${SizeData}" var="s">
                                                        <c:if test="${p.product_id==s.product_id}">
                                                            ${s.size}   
                                                        </c:if>
                                                    </c:forEach>
                                                </td>

                                                <td>
                                                    <c:forEach items="${ColorData}" var="c">
                                                        <c:if test="${p.product_id==c.product_id}">
                                                            ${c.color}   
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>${p.product_describe}</td>
                                                <td>${p.quantity}</td>
                                                <td><img src="${p.img}" alt="" width="100px;"></td>
                                                <td>
                                                    <c:forEach items="${ActiveData}" var="s">
                                                        <c:if test="${p.product_id==s.product_id}">
                                                            ${s.acitve}   
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                
                                                <td>
                                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa" value="${p.product_id}"><i
                                                            class="fas fa-trash-alt"></i>
                                                    </button>
                                                    <button class="btn btn-primary btn-sm edit" type="button" title="Sửa" id="show-emp"
                                                            data-toggle="modal" data-target="#ModalUP${p.product_id}"><i class="fas fa-edit"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        
                                        <!--
                                        MODAL
                                        -->

                                        <div class="modal fade" id="ModalUP${p.product_id}" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
                                             data-keyboard="false">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-body">
                                                        <form action="productmanager" method="POST">
                                                            <input type="hidden" name="action" value="updateproduct">
                                                            <div class="row">
                                                                <div class="form-group  col-md-12">
                                                                    <span class="thong-tin-thanh-toan">
                                                                        <h5>Chỉnh sửa thông tin sản phẩm</h5>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Mã sản phẩm </label>
                                                                    <input class="form-control" type="text" readonly name="product_id" value="${p.product_id}">
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label for="exampleSelect1" class="control-label">Danh mục</label>
                                                                    <select name="category_id" class="form-control"  id="exampleSelect1">
                                                                        <option value="">-- Chọn danh mục --</option>
                                                                        <c:forEach items="${CategoryData}" var="cat">
                                                                            <option value="${cat.category_id}" <c:if test="${cat.category_id == p.cate.category_id}">selected</c:if>>${cat.category_name}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Tên sản phẩm</label>
                                                                    <input class="form-control" type="text" name="product_name" required value="${p.product_name}">
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Giá</label>
                                                                    <input class="form-control" type="number" name="product_price" required value="${p.product_price}">
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Màu</label>
                                                                    <input class="form-control" name="product_color" type="text" value="<c:forEach items="${ColorData}" var="c"><c:if test="${p.product_id==c.product_id}">${c.color},</c:if></c:forEach>">
                                                                        </div>

                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Size</label>
                                                                            <input class="form-control" name="product_size" type="text" value="<c:forEach items="${SizeData}" var="s"><c:if test="${p.product_id==s.product_id}">${s.size},</c:if></c:forEach>">
                                                                        </div>

                                                                        <div class="form-group col-md-6">
                                                                            <label class="control-label">Thông tin</label>
                                                                            <textarea class="ckeditor" name="product_describe">${p.product_describe}</textarea>
                                                                    <script>
                                                                        CKEDITOR.replace('product_describe');
                                                                    </script>

                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Trạng thái</label>
                                                                    <select name="permission" class="form-control" id="exampleSelect1">
                                                                        <option value="True">Bật</option>
                                                                        <option value="False">Tắt</option>
                                                                    </select>
                                                                </div>

                                                                <div class="form-group col-md-6">
                                                                    <label class="control-label">Số lượng</label>
                                                                    <input class="form-control" type="text" min="1" name="product_quantity" value="${p.quantity}">
                                                                </div>
                                                                <!--anh san pham-->
                                                                <div class="form-group col-md-12">
                                                                    <label class="control-label">Ảnh sản phẩm</label>
                                                                    <div id="myfileupload">
                                                                        <input type="file" id="uploadfile" name="product_img" value="${p.img}" onchange="readURL(this);" />
                                                                    </div>
                                                                    <div id="thumbbox">
                                                                        <img height="450" width="400" alt="Thumb image" id="thumbimage" style="display: none" />
                                                                        <a class="removeimg" href="javascript:"></a>
                                                                    </div>
                                                                    <div id="boxchoice">
                                                                        <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                                                                        <p style="clear:both"></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <BR>
                                                            <button class="btn btn-save" type="submit">Lưu lại</button>
                                                            <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                                                            <BR>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--
                                      MODAL
                                        -->
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
    </body>
</html>
