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
            <h3>Update Khách Hàng</h3>
            <br>
            <br>
            <form action="" method="post">
                <label>Họ :</label>
                <input class="form-control" name="ho" value="${update.ho}">
                <br>

                <label>Tên Đệm :</label>
                <input class="form-control" name="tendem" value="${update.tendem}">
                <br>

                <label>Tên :</label>
                <input class="form-control" name="ten" value="${update.ten}">
                <br>

                <label>Giới Tính :</label>
                <input type="radio" value="true" name="gioitinh" checked ${update.gioitinh == true ? "checked":""}>Nam
                <input type="radio" value="false" name="gioitinh" ${update.gioitinh == false ? "checked":""}>Nữ
                <br>
                <br>
                <label>Ngày Sinh :</label>
                <input class="form-control" type="" name="ngaysinh" value="${update.ngaysinh}">
                <br>

                <label>Email :</label>
                <input class="form-control" name="email" value="${update.email}">
                <br>

                <label>SDT :</label>
                <input class="form-control" name="sdt" value="${update.sdt}">
                <br>

                <label>Điểm Thưởng :</label>
                <input class="form-control" name="diemthuong" value="${update.diemthuong}">
                <br>
            </form>

        </div>
        <div class="col-2"></div>
    </div>

</body>
</html>