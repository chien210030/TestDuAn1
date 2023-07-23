<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khuyến Mãi</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style>

    </style>
</head>
<body>
<div class="container">
    <p>Id: ${khuyenmai.id}</p>
    <p>Mã: ${khuyenmai.ma}</p>
    <p>Tên phiếu: ${khuyenmai.ten}</p>
    <p>Giá trị giảm: ${khuyenmai.giatrigiam}</p>
    <p>Hình thức giảm: ${khuyenmai.hinhthuckm}</p>
    <p>Ngày bắt đầu: ${khuyenmai.ngaybatdau}</p>
    <p>Ngày kết thúc: ${khuyenmai.ngayketthuc}</p>
    <p>Trạng thái:
        <c:if test="${khuyenmai.trangthai == 1}">Hoạt động</c:if>
        <c:if test="${khuyenmai.trangthai == 0}">Không hoạt động</c:if>
    </p>
    <a href="/khuyen-mai/index" class="btn btn-primary">Back</a>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
