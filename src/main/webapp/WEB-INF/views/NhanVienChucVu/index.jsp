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
        <div >
            <div>
                <form action="/nhan-vien-chuc-vu/search" method="get">
                    Mã : <input type="text" name="ma" class="form-control">

                    Tên : <input type="text" name="ten" class="form-control">
                    <br>
                    <button type="submit" class="btn btn-primary">Search</button>

                </form>
            </div>
            <div class="col-4"></div>
        </div>
        <table border="1" class="table table-hover">
            <a class="btn btn-primary " href="/nhan-vien-chuc-vu/view-add">THÊM</a>
            <tr>
            <tr>
                <th>Mã NV</th>
                <th>Tên NV</th>
                <th>Ngày Sinh</th>
                <th>Giới Tính</th>
                <th>Số Điện</th>
                <th>Tài Khoản</th>
                <th>Mật Khẩu</th>
                <th>Email</th>
                <th>Trạng Thái</th>
                <th>Mã Chức Vụ</th>
                <th>Tên Chức Vụ</th>
                <th colspan="2">Action</th>
            </tr>
            <c:if test="${not empty NVCV.content}">
                <tbody>
                <c:forEach items="${NVCV.content}" var="ds" varStatus="i">
                    <tr>
                        <td>${ds.ma}</td>
                        <td>${ds.ten}</td>
                        <td>${ds.ngaysinh}</td>
                        <td>${ds.gioitinh == 1? "Nam" : "Nữ"}</td>
                        <td>${ds.sdt}</td>
                        <td>${ds.taikhoan}</td>
                        <td>${ds.matkhau}</td>
                        <td>${ds.email}</td>
                        <td>${ds.trangthai == 1 ?"Hoạt Động" :"Không Hoạt Động"}</td>
                        <td>${ds.chucVu.ma}</td>
                        <td>${ds.chucVu.ten}</td>
                        <td>
                            <a class="btn btn-outline-danger" href="javascript:remove('${ds.id}')">XÓA</a>
                            <a class="btn btn-outline-danger" href="/nhan-vien-chuc-vu/view-update/${ds.id}">SỬA</a>
                            <a class="btn btn-outline-danger" href="/nhan-vien-chuc-vu/detail/${ds.id}">DETAIL</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </c:if>
            <c:if test="${ empty NVCV.content}"><h2 style="color: red">No data</h2></c:if>
        </table>
        <p>Số Trang : ${NVCV.number + 1} / ${NVCV.totalPages}</p>
        <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/hien-thi?p=0"> << </a>
        <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/hien-thi?p=${NVCV.number - 1}"> < </a>
        <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/hien-thi?p=${NVCV.number + 1}"> > </a>
        <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/hien-thi?p=${NVCV.totalPages - 1}"> >> </a>


    </div>
</div>

</div>
</body>
<script>
    function remove(id) {
        if (window.confirm("Bạn Có Muốn Xóa Không ?")) {
            location.href = "/nhan-vien-chuc-vu/delete/" + id;
        } else {
            alert("Đã Hủy")
        }
    }

</script>
</html>