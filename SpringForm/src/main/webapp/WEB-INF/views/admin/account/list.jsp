<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<form action="account">
    <label class="form-label">Tìm Kiếm</label>
    <input type="text" name="keyword" value="${param.keyword}" class="form-control" placeholder="Từ khóa"><br>
    <button type="submit" class="btn btn-secondary">Tìm</button>
</form>
<div class="container" style="margin-top: 100px">
    <table class="table table-hover">
        <div class="alert alert-secondary" style="display: ${note==null?"none":"block"}">${note}</div>
        <thead>
        <h2>Danh Sách Người Dùng</h2>
        <a href="account/create" class="btn btn-success">Thêm</a>
        <tr>
            <th>Tên Đăng Nhập</th>
            <th>Họ Tên</th>
            <th>Mật Khẩu</th>
            <th>E-Mail</th>
            <th>Hoạt Động</th>
            <th>Quản Lý</th>
            <th>Thao Tác</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="account">
            <tr>
                <td>${account.username}</td>
                <td>${account.fullname}</td>
                <td>${account.password}</td>
                <td>${account.email}</td>
                <td>${account.activated?"Đang Hoạt Động":"Dừng Hoạt Động"} <input type="checkbox"
                                                                                  class="form-check-input"
                                                                                  disabled ${account.activated?"checked":""}>
                </td>
                <td>${account.admin?"Quản Lý":"Nhân viên"} <input type="checkbox" class="form-check-input"
                                                                  disabled ${account.admin?"checked":""}></td>
                <td>
                    <a href="account/update/${account.username}" class="btn btn-outline-warning">Sửa</a>
                    <a href="account/delete/${account.username}" onclick="return confirm('Bạn có chắc Xóa không?')"
                       class="btn btn-outline-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <a href="/admin/account?keyword=${keyword}" class="btn btn-success"><<</a>
        <a href="/admin/account?p=${page.number-1}&&keyword=${keyword}" class="btn btn-success"
           onclick="if (${page.number==0}){alert('Đây là trang đầu.'); return false;
                   }"><</a>
        <a href="/admin/account?p=${page.number+1}&&keyword=${keyword}" class="btn btn-success" onclick="if (${page.number}==${page.totalPages-1}){alert('Đây là trang cuối.'); return false;
                }">></a>
        <a href="/admin/account?p=${page.totalPages-1}&&keyword=${keyword}" class="btn btn-success">>></a>
        <label>Đang ở trang số ${page.number+1} trong ${page.totalPages} trang.</label>
    </div>
</div>
