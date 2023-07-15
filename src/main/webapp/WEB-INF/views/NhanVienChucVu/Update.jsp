<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="row">
    <div class="col-2"></div>
    <div class="col-8">
        <h3>Update Nhân Viên Chức Vụ</h3>
        <br>
        <form action="/nhan-vien-chuc-vu/update" method="post">
            <label>ID Nhân Viên :</label>
            <input class="form-control" name=id value="${update.id}">
            <br>

            <label>Mã Nhân Viên :</label>
            <input class="form-control" name="ma" value="${update.ma}">
            <br>

            <label>Mã Chức Vụ :</label>
            <input class="form-control" name="ten" value="${update.ten}">
            <br>

            <label>Giới Tính :</label>
            <input type="radio" value="1" name="gioitinh" checked ${update.gioitinh == 1 ? "checked":""}>Nam
            <input type="radio" value="0" name="gioitinh" ${update.gioitinh == 0 ? "checked":""}>Nữ
            <br>
            <br>
            <label>Trạng Thái :</label>
            <input type="radio" value="1" name="trangthai" checked ${update.trangthai == 1 ? "checked":""}>Hoạt Động
            <input type="radio" value="0" name="trangthai" ${update.trangthai == 0 ? "checked":""}>Ngừng Hoạt Động
            <br>
            <br>
            <label>Ngày Sinh :</label>
            <input class="form-control" type="date" name="ngaysinh" value="${update.ngaysinh}">
            <br>

            <label>Email :</label>
            <input class="form-control" name="email" value="${update.email}">
            <br>

            <label>SDT :</label>
            <input class="form-control" name="sdt" value="${update.sdt}">
            <br>

            <label>Tài Khoản :</label>
            <input class="form-control" name="taikhoan" value="${update.taikhoan}">
            <br>

            <label>Mật Khẩu:</label>
            <input class="form-control" name="matkhau" value="${update.matkhau}">
            <br>

            <label>Mã Chức Vụ:</label>
            <select name="chucVu">
                <c:forEach items="${chucVu}" var="cv">
                    <option value="${cv.id}" ${cv.id == update.chucVu.id ?'selected = "selected"':""}>${cv.ma}</option>
                </c:forEach>
            </select>
            <br>
            <hr>
            <br>
            <button class="btn btn-outline-primary">Update</button>
            <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/hien-thi">HOME</a>
        </form>

    </div>
    <div class="col-2"></div>
</div>

</body>
</html>