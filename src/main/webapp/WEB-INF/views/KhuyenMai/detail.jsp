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
        <h1 class="page-header">Chi tiết Khuyến Mãi</h1>
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home">&nbsp;</span><a href="#">Home</a></li>
            <li><a href="#">Dashboard</a></li>
            <li class="active">Khuyến Mãi</li>
        </ul>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <th>Thông tin</th>
                            <th>Giá trị</th>
                        </tr>
                        <tr>
                            <td><strong>Id</strong></td>
                            <td>${khuyenmai.id}</td>
                        </tr>
                        <tr>
                            <td><strong>Mã</strong></td>
                            <td>${khuyenmai.ma}</td>
                        </tr>
                        <tr>
                            <td><strong>Tên phiếu</strong></td>
                            <td>${khuyenmai.ten}</td>
                        </tr>
                        <tr>
                            <td><strong>Giá trị giảm</strong></td>
                            <td>${khuyenmai.giatrigiam}</td>
                        </tr>
                        <tr>
                            <td><strong>Hình thức giảm</strong></td>
                            <td>${khuyenmai.hinhthuckm}</td>
                        </tr>
                        <tr>
                            <td><strong>Ngày bắt đầu</strong></td>
                            <td>${khuyenmai.ngaybatdau}</td>
                        </tr>
                        <tr>
                            <td><strong>Ngày kết thúc</strong></td>
                            <td>${khuyenmai.ngayketthuc}</td>
                        </tr>
                        <tr>
                            <td><strong>Trạng thái</strong></td>
                            <td>
                                <c:if test="${khuyenmai.trangthai == 1}">Hoạt động</c:if>
                                <c:if test="${khuyenmai.trangthai == 0}">Không hoạt động</c:if>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <a href="/khuyen-mai/index" class="btn btn-primary">Quay lại</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>