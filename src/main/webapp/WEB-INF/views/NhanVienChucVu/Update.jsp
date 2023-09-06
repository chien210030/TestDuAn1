
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
        .test{
            height: 10rem;
            display: none;

        }
        .tesst1:hover + .test,
        .test:hover {
            display: block;

        }
        .tmargin {
            margin-top: 20px;

        }
        .title{
            text-decoration: none;
            color: #FFFFFF;
            margin: 1.2rem;

        }
        .title:hover{
            text-decoration: none !important;
            color: #c69500;
            margin: 20px;
        }
    </style>
</head>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Admin Panel</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user">&nbsp;</span>Hello Admin</a></li>
                <li class="active"><a title="View Website" href="#"><span class="glyphicon glyphicon-globe"></span></a>
                </li>
                <li><a href="#">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
<body>
<div class="container-fluid">
    <jsp:include page="Templates/aside.jsp"/>

    <div class="col-md-9 animated bounce">
        <h1 class="page-header">NhanVien Update</h1>
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home">&nbsp;</span>Home</li>
            <li><a href="#">Dashboard</a></li>
        </ul>
        <br>
        <form action="/nhan-vien-chuc-vu/update" method="post">
            <label>ID Nhân Viên :</label>
            <input class="form-control" name=id value="${update.id}">
            <br>

            <label>Mã Nhân Viên:</label>
            <input class="form-control" name=ma value="${update.ma}">
            <br>

            <label>Họ :</label>
            <input class="form-control" name="ho" value="${update.ho}">
            <br>

            <label>Tên Đệm :</label>
            <input class="form-control" name="tendem" value="${update.tendem}">
            <br>

            <label>Tên Nhân Viên :</label>
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

            <label>Tên Chức Vụ:</label>
            <select name="chucVu">
                <c:forEach items="${chucVu}" var="cv">
                    <option value="${cv.id}" ${cv.id == update.chucVu.id ?'selected = "selected"':""}>${cv.ten}</option>
                </c:forEach>
            </select>
            <br>
            <hr>
            <button class="btn btn-outline-primary">Update</button>
            <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/hien-thi">HOME</a>
        </form>
    </div>
</div>

</div>
</body>
</html>