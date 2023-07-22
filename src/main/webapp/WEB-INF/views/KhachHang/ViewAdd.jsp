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
        <h1 class="page-header">KhachHang</h1>
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home">&nbsp;</span>Home</li>
            <li><a href="#">Dashboard</a></li>
        </ul>
        <form:form  action="/khach-hang/add" method="post" modelAttribute="kh" onsubmit="return add()">

            <label>Mã</label>
            <form:input class="form-control" path="ma"/>
            <form:errors cssClass="crr" path="ma"></form:errors>
            <br>

            <label>Họ :</label>
            <form:input class="form-control" path="ho"/>
            <form:errors cssClass="crr" path="ho"></form:errors>
            <br>

            <label>Tên Đệm :</label>
            <form:input class="form-control" path="tendem"/>
            <form:errors cssClass="crr" path="tendem"></form:errors>
            <br>

            <label>Tên :</label>
            <form:input class="form-control" path="ten"/>
            <form:errors cssClass="crr" path="ten"></form:errors>
            <br>

            <label>Giới Tính :</label>
            <form:radiobuttons path="gioitinh" class="form-check-input" items="${gioitinh}"/>
            <form:errors cssClass="crr" path="gioitinh"></form:errors>
            <br>
            <br>
            <label>Ngày Sinh :</label>
            <form:input class="form-control" type="date" path="ngaysinh"/>
            <br>

            <label>Email :</label>
            <form:input class="form-control" type="email" path="email"/>
            <form:errors cssClass="crr" path="email"></form:errors>
            <br>

            <label>SDT :</label>
            <form:input class="form-control" path="sdt"/>
            <form:errors cssClass="crr" path="sdt"></form:errors>
            <br>

            <label>Điểm Thưởng :</label>
            <form:input class="form-control" path="diemthuong"/>
            <form:errors cssClass="crr" path="diemthuong"></form:errors>
            <br>
            <br>
            <button class="btn btn-outline-primary">Add</button>
            <a class=" btn btn-outline-secondary" href="/khach-hang/hien-thi">Close</a>
        </form:form>

    </div>
</div>

</div>
</body>
<script>
    function add(){
        if (window.confirm("Bạn Có muồn thêm không trang Thêm Không ?")){

        }else {
            return false;
        }
    }
</script>
</html>