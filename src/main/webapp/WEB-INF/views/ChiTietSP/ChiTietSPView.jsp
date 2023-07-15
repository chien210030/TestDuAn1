<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">
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
            color: #eee;
            width: 220px;
        }

        .side-bar li a:hover,
        .side-bar li a:focus {
            background-color: #333;
        }

        .tmargin {
            margin-top: 15px;
        }

    </style>
</head>
<body>
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
<div class="container-fluid">
    <div class="col-md-3">

        <div id="sidebar">
            <div class="container-fluid tmargin">
<%--                <form action="#" class="search-wrap"></form>--%>
                <div class="input-group">
                    <input type="search" class="form-control" placeholder="Search..."/>
                    <span class="input-group-btn">
              <button class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
          </span>
                </div>
            </div>

            <ul class="nav navbar-nav side-bar">
                <li class="side-bar tmargin"><a href="#"><span
                        class="glyphicon glyphicon-list">&nbsp;</span>Dashboard</a></li>
                <li class="side-bar"><a href="#"><span class="glyphicon glyphicon-flag">&nbsp;</span>Purok</a></li>
                <li class="side-bar"><a href="#"><span class="glyphicon glyphicon-star">&nbsp;</span>Blotter</a></li>
                <li class="side-bar">
                    <a href="#"><span class="glyphicon glyphicon-certificate">&nbsp;</span>Officials</a></li>

                <li class="side-bar"><a href="#"><span class="glyphicon glyphicon-signal">&nbsp;</span>Statistics</a>
                </li>
                <li class="side-bar"><a href="#"><span class="glyphicon glyphicon-cog">&nbsp;</span>Settings</a></li>

            </ul>
        </div>
    </div>
    <div class="col-md-9 animated bounce">
        <h1 class="page-header">Products</h1>
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home">&nbsp;</span>Home</li>
            <li><a href="#">Dashboard</a></li>
        </ul>
        <button> <a href="${pageContext.request.contextPath}/showcreate">add</a></button>

        <form action="${pageContext.request.contextPath}/loadsp">
            <table class="table table-hover">
            <thead>
            <th>ma</th>
            <th class="text-center">Ten</th>
            <th>Mo Ta</th>
            <th class="text-center">So Luong Ton</th>
            <th>Gia Nhap</th>
            <th>Gia Ban</th>
            <th>Dong SP</th>
            <th>Nha San Xuat</th>
            <th>mau sac</th>
            <th>kich Co</th>
            <th>Chat Lieu</th>
            <th>Thuong Hieu</th>
            <th>Action</th>

            </thead>
            <tbody>
            <!-- START CONTENT END -->
            <c:forEach items="${loadSP}" var="sp">


                <tr>

                    <td>${sp.sanpham.ma}</td>
                    <td>${sp.sanpham.ten}</td>
                    <td>${sp.mota}</td>
                    <td>${sp.soluongton}</td>
                    <td>${sp.gianhap}</td>
                    <td>${sp.giaban}</td>
                    <td>${sp.dongsp.ten}</td>
                    <td>${sp.nsx.ten}</td>
                    <td>${sp.mausac.ten}</td>
                    <td>${sp.kichco.ten}</td>
                    <td>${sp.chatlieu.ten}</td>
                    <td>${sp.thuonghieu.ten}</td>

                    <td><a href="${pageContext.request.contextPath}/delete/${sp.id}">Remove</a>
                        <a href="${pageContext.request.contextPath}/viewupdate/${sp.id}">Update</a>
                    </td>
                </tr>


                <!-- DUMP CONTENT END -->
            </c:forEach>
            </tbody>
        </table>
        </form>
        <div>
            <ul class="pagination">
            <a href="?pageNum=${1}">Pre</a>
                <c:forEach begin="1" end="${totalpages}" varStatus="status">
                <a href="?pageNum=${status.index}">${status.index}</a>

                </c:forEach>
                <a href="?pageNum=${totalpages}">next</a>
            </ul>

    </div>
</div>

</div>
</body>
</html>