<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>
<body>
<div class="row">
    <div class="col-3"></div>
    <div class="col-6">
        <br>
        <br>
        <form>
            <label>ID NV :</label>
            <span style="color: red">${nhanVien.id}</span>
            <br>
            <label>Tên Chức Vụ :</label>
            <span style="color: red">${nhanVien.chucVu.ten}</span>
            <br>

            <label>Họ :</label>
            <span style="color: red">${nhanVien.ho}</span>
            <br>

            <label>Tên Đệm :</label>
            <span style="color: red">${nhanVien.tendem}</span>
            <br>

            <label>Tên NV :</label>
            <span style="color: red">${nhanVien.ten}</span>
            <br>
            
            <label>Ngày Sinh :</label>
            <span style="color: red">${nhanVien.ngaysinh}</span>
            <br>
            <label>Số Điện :</label>
            <span style="color: red">${nhanVien.sdt}</span>
            <br>
            <label>Tài Khoản :</label>
            <span style="color: red">${nhanVien.taikhoan}</span>
            <br>
            <label>Mật Khẩu :</label>
            <span style="color: red">${nhanVien.matkhau}</span>
            <br>
            <label>Email :</label>
            <span style="color: red">${nhanVien.email}</span>
            <br>
            <label>Trạng Thái :</label>
            <span style="color: red">${nhanVien.trangthai}</span>
            <br>
            <label>Giới Tính :</label>
            <span style="color: red">${nhanVien.gioitinh}</span>
            <br>
            <hr>
        </form>
        <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/hien-thi">HOME</a>

    </div>
    <div class="col-3"></div>
</div>

</body>
</html>