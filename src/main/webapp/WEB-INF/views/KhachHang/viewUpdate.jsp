
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
        <h1 class="page-header">Khách Hàng Update</h1>
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home">&nbsp;</span>Home</li>
            <li><a href="#">Dashboard</a></li>
        </ul>
        <br>
        <form action="/khach-hang/update?id=${update.id}" method="post" onsubmit="return update()">

            <label>Mã :</label>
            <input class="form-control" name="ma" value="${update.ma}">
            <br>

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
            <input class="form-control" type="date" name="ngaysinh" value="${update.ngaysinh}">
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
            <br>
            <button class="btn btn-outline-success">Update</button>
            <a class=" btn btn-outline-secondary" href="/khach-hang/hien-thi">Close</a>
        </form>
    </div>
</div>

</div>
</body>
<script>
    function update(){
        if (window.confirm("Bạn có muốn update không!")){

        }else {
            return false;
        }
    }
</script>
</html>