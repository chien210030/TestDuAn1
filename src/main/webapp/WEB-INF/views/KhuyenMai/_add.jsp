<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 80px;
        }

        #sidebar {
            position: fixed;
            top: 50px;
            left: 220px;
            width: 220px;
            margin-left: -220px;
            border: none;
            border-radius: 0;
            overflow-y: auto;
            background-color: #222;
            bottom: 0;
            overflow-x: hidden;
            padding-bottom: 40px;
        }

        .side-bar > li > a {
            colo: #eee;
            width: 220px;
        }

        .side-bar li a:hover,
        .side-bar li a:focus {
            background-color: #333;
        }

        .test {
            height: 15rem;
            display: none;

        }

        .tesst1:hover + .test,
        .test:hover {
            display: block;

        }

        .tmargin {
            margin-top: 20px;

        }

        .title {
            text-decoration: none;
            color: #FFFFFF;
            margin: 1.2rem;

        }

        .title:hover {
            text-decoration: none !important;
            color: #c69500;
            margin: 20px;
        }
    </style>
</head>

<body>
<jsp:include page="Templates/navbar.jsp"/>
<div class="container-fluid">
    <jsp:include page="Templates/aside.jsp"/>
    <div class="col-md-9 animated bounce">
        <h1 class="page-header">Thêm Khuyến Mãi</h1>
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home">&nbsp;</span>Home</li>
            <li><a href="#">Dashboard</a></li>
            <li class="active">Thêm Khuyến Mãi</li>
        </ul>
            <form:form modelAttribute="khuyenmai" method="post" action="/khuyen-mai/add" class="form-horizontal">


                <div class="form-group">
                    <label class="col-sm-2 control-label">Mã:</label>
                    <div class="col-sm-6">
                        <form:input path="ma" class="form-control"/>
                        <form:errors path="ma" element="div" class="alert alert-danger"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Tên phiếu:</label>
                    <div class="col-sm-6">
                        <form:input path="ten" class="form-control"/>
                        <form:errors path="ten" element="div" class="alert alert-danger"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Hình thức khuyến mãi:</label>
                    <div class="col-sm-6">
                        <form:input path="hinhthuckm" class="form-control"/>
                        <form:errors path="hinhthuckm" element="div" class="alert alert-danger"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Giá trị giảm:</label>
                    <div class="col-sm-6">
                        <form:input path="giatrigiam" class="form-control"/>
                        <form:errors path="giatrigiam" element="div" class="alert alert-danger"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Ngày bắt đầu:</label>
                    <div class="col-sm-6">
                        <form:input path="ngaybatdau" placeholder="dd/MM/yyyy" class="form-control"/>
                        <form:errors path="ngaybatdau" element="div" class="alert alert-danger"/>
                        <div>${dateError}</div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Ngày kết thúc:</label>
                    <div class="col-sm-6">
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

                <div class="form-group form-inline">
                    <label class="col-sm-2 control-label">Trạng thái:</label>
                    <div class="col-sm-6">
                        <form:radiobuttons path="trangthai" items="${dsTrangThai}" class="form-control"/>
                        <form:errors path="trangthai" element="div" class="alert alert-danger"/>
                    </div>
                </div>

                ${message}

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </div>
            </form:form>

    </div>
</div>
</body>
</html>