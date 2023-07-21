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
</head>
<body>
<div class="container">
    <form:form modelAttribute="khuyenmai" method="post" action="/khuyen-mai/update/${khuyenmai.id}" class="form-horizontal">
        <form:input type="hidden" path="id" />
        <div class="form-group">
            <label class="col-sm-2 control-label">Mã phiếu:</label>
            <div class="col-sm-10">
                <form:input path="ma" class="form-control"/>
                <form:errors path="ma" element="div" class="text-danger"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Tên phiếu:</label>
            <div class="col-sm-10">
                <form:input path="ten" class="form-control"/>
                <form:errors path="ten" element="div" class="text-danger"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Giá trị giảm:</label>
            <div class="col-sm-10">
                <form:input path="giatrigiam" class="form-control"/>
                <form:errors path="giatrigiam" element="div" class="text-danger"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Hình thức Khuyến Mãi:</label>
            <div class="col-sm-10">
                <form:input path="hinhthuckm" class="form-control"/>
                <form:errors path="hinhthuckm" element="div" class="text-danger"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Ngày bắt đầu:</label>
            <div class="col-sm-10">
                <form:input path="ngaybatdau" placeholder="dd/MM/yyyy" class="form-control"/>
                <form:errors path="ngaybatdau" element="div" class="text-danger"/>
                <div>${dateError}</div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Ngày kết thúc:</label>
            <div class="col-sm-10">
                <form:input path="ngayketthuc" placeholder="dd/MM/yyyy" class="form-control"/>
                <form:errors path="ngayketthuc" element="div" class="text-danger"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Trạng thái:</label>
            <div class="col-sm-10">
                <form:radiobuttons path="trangthai" items="${dsTrangThai}" class="form-control"/>
                <form:errors path="trangthai" element="div" class="text-danger"/>
            </div>
        </div>
        ${message}
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </div>
    </form:form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
