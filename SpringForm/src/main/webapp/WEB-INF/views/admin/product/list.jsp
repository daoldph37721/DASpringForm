<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="product">
    <label class="form-label">Tìm Kiếm</label>
    <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="Từ khóa"><br>
    <button type="submit" class="btn btn-secondary">Tìm</button>
</form>
<div class="container" style="margin-top: 100px">
    <table class="table table-hover">
        <div class="alert alert-secondary" style="display: ${note==null?"none":"block"}">${note}</div>
        <thead>
        <h2>Danh Sách Điện Thoại</h2>
        <a href="/admin/product/create" class="btn btn-success">Thêm</a>
        <tr>
            <th>Điện Thoại</th>
            <th>Hãng</th>
            <th>Hình Ảnh</th>
            <th>Giá</th>
            <th>Kho Hàng</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="product">
            <tr>
                <td>${product.name}</td>
                <td>${product.category.name}</td>
                <td><img src="/static/images/${product.image}" alt="Ảnh cho ${product.name}" width="150" height="180"></td>
                <td>${product.price}</td>
                <td>${product.available?"Còn Hàng  ":"Hết Hàng  "}<input type="checkbox" class="form-check-input"
                                                                         disabled ${product.available?"checked":""}>
                </td>
                <td>
                    <a href="product/update/${product.id}" class="btn btn-outline-warning">Sửa</a>
                    <a href="product/delete/${product.id}" onclick="return confirm('Bạn có chắc xóa không?')" class="btn btn-outline-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <a href="/admin/product?keyword=${keyword}" class="btn btn-success"><<</a>
        <a href="/admin/product?p=${page.number-1}&&keyword=${keyword}" class="btn btn-success"
           onclick="if (${page.number==0}){alert('Đây là trang đầu.'); return false;
                   }"><</a>
        <a href="/admin/product?p=${page.number+1}&&keyword=${keyword}" class="btn btn-success" onclick="if (${page.number}==${page.totalPages-1}){alert('Đây là trang cuối.'); return false;
                }">></a>
        <a href="/admin/product?p=${page.totalPages-1}&&keyword=${keyword}" class="btn btn-success">>></a>
        <label>Đang ở trang số ${page.number+1} trong ${page.totalPages} trang.</label>
    </div>
</div>
