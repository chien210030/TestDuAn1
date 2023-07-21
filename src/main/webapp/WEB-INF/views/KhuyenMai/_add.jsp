<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>

<body>
<form:form modelAttribute="khuyenmai" method="post" action="/khuyen-mai/add" class="form-horizontal">


    <div class="form-group">
        <label class="col-sm-2 control-label">Mã:</label>
        <div class="col-sm-10">
            <form:input path="ma" class="form-control"/>
            <form:errors path="ma" element="div" class="alert alert-danger"/>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">Tên phiếu:</label>
        <div class="col-sm-10">
            <form:input path="ten" class="form-control"/>
            <form:errors path="ten" element="div" class="alert alert-danger"/>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">Hình thức khuyến mãi:</label>
        <div class="col-sm-10">
            <form:input path="hinhthuckm" class="form-control"/>
            <form:errors path="hinhthuckm" element="div" class="alert alert-danger"/>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">Giá trị giảm:</label>
        <div class="col-sm-10">
            <form:input path="giatrigiam" class="form-control"/>
            <form:errors path="giatrigiam" element="div" class="alert alert-danger"/>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">Ngày bắt đầu:</label>
        <div class="col-sm-10">
            <form:input path="ngaybatdau" placeholder="dd/MM/yyyy" class="form-control"/>
            <form:errors path="ngaybatdau" element="div" class="alert alert-danger"/>
            <div>${dateError}</div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">Ngày kết thúc:</label>
        <div class="col-sm-10">
            <form:input path="ngayketthuc" placeholder="dd/MM/yyyy" class="form-control"/>
            <form:errors path="ngayketthuc" element="div" class="alert alert-danger"/>
        </div>
    </div>

    <%--    <p>Khách hàng:--%>
    <%--        <form:select path="nguoisohuu.makhachhang">--%>
    <%--            <option value="">----</option>--%>
    <%--            <form:options items="${dsKhachHang}"--%>
    <%--                itemLabel="tenkhachhang" itemValue="makhachhang"--%>
    <%--            />--%>
    <%--        </form:select>--%>
    <%--        <div>${maKHError}</div>--%>
    <%--    </p>--%>

    <div class="form-group">
        <label class="col-sm-2 control-label">Trạng thái:</label>
        <div class="col-sm-10">
            <form:radiobuttons path="trangthai" items="${dsTrangThai}" class="form-control"/>
            <form:errors path="trangthai" element="div" class="alert alert-danger"/>
        </div>
    </div>

    ${message}

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-primary">Add</button>
        </div>
    </div>
</form:form>
</body>
</html>