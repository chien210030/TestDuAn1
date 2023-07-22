
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
        <h1 class="page-header">Nhân Viên</h1>
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home">&nbsp;</span>Home</li>
            <li><a href="#">Dashboard</a></li>
        </ul>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <br>
                <br>
                <div class="row">
                    <div class="col-4">
                        <form action="/khach-hang/search" method="get">
                            Mã : <input type="text" name="ma" class="form-control">

                            Tên : <input type="text" name="ten" class="form-control">
                            <br>
                            <button type="submit" class="btn btn-primary">Tìm</button>

                        </form>
                    </div>
                    <div class="col-4"></div>
                    <div class="col-4"></div>
                </div>
                <br>
                <a class="btn btn-outline-primary" href="/khach-hang/view-add">Add</a>
                <br>
                <br>
                <table border="1" class="table table-hover">
                    <tr>
                        <%--                <th>ID</th>--%>
                        <th>Mã</th>
                        <th>Tên Đầy Đủ</th>
                        <th>Giới Tính</th>
                        <th>Ngày Sinh</th>
                        <th>Email</th>
                        <th>Số Điện</th>
                        <th>Điểm Thưởng</th>
                        <th colspan="2">Action</th>
                    </tr>
                    <c:if test="${not empty khachHang.content}">
                        <tbody>
                        <c:forEach items="${khachHang.content}" var="ds" varStatus="i">
                            <tr>
                                    <%--                       <td>${ds.id}</td>--%>
                                <td>${ds.ma}</td>
                                <td>${ds.ho} ${ds.tendem} ${ds.ten}</td>
                                <td>${ds.gioitinh == true ? "Nam" : "Nữ"}</td>
                                <td>${ds.ngaysinh}</td>
                                <td>${ds.email}</td>
                                <td>${ds.sdt}</td>
                                <td>${ds.diemthuong}</td>
                                <td>
                                    <a class="btn btn-outline-danger" href="javascript:remove('${ds.id}')">Remove</a>
                                    <a class="btn btn-outline-success" href="/khach-hang/view-update/${ds.id}">Update</a>
                                    <a class="btn btn-outline-warning" href="/khach-hang/detail/${ds.id}">Detail</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </c:if>
                    <c:if test="${ empty khachHang.content}"><h2 style="color: red">No data</h2></c:if>
                </table>
                <p>Số Trang : ${khachHang.number + 1} / ${khachHang.totalPages}</p>
                <a class="btn btn-outline-primary"  href="/khach-hang/hien-thi?p=0"> << </a>
                <a class="btn btn-outline-primary"  href="/khach-hang/hien-thi?p=${khachHang.number - 1}"> < </a>
                <a class="btn btn-outline-primary"  href="/khach-hang/hien-thi?p=${khachHang.number + 1}"> > </a>
                <a class="btn btn-outline-primary"  href="/khach-hang/hien-thi?p=${khachHang.totalPages - 1}"> >> </a>

            </div>
            <div class="col-1"></div>
        </div>
    </div>
</div>

</div>
</body>
<script>
    function remove(id) {
        if (window.confirm("Bạn Có Muốn Xóa Không ?")) {
            location.href = "/khach-hang/remove/" + id;
        } else {
            alert("Đã Hủy")
        }
    }

</script>
</html>