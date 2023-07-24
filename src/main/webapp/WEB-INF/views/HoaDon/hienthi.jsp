<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <title>Document</title>
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
        .center-button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            font-size: large;
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
                <li class="active"><a title="View Website" href="#"><span class="glyphicon glyphicon-globe"></span></a></li>
                <li><a href="#">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="col-md-3">

        <div id="sidebar">
            <div class="container-fluid tmargin">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search..." />
                    <span class="input-group-btn">
              <button class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
          </span>
                </div>
            </div>

            <ul class="nav navbar-nav side-bar">
                <li class="side-bar tmargin"><a href="#"><span class="glyphicon glyphicon-list">&nbsp;</span>Dashboard</a></li>
                <li class="side-bar"><a href="#"><span class="glyphicon glyphicon-flag">&nbsp;</span>Purok</a></li>
                <li class="side-bar"><a href="#"><span class="glyphicon glyphicon-star">&nbsp;</span>Blotter</a></li>
                <li class="side-bar">
                    <a href="#"><span class="glyphicon glyphicon-certificate">&nbsp;</span>Officials</a></li>

                <li class="side-bar"><a href="#"><span class="glyphicon glyphicon-signal">&nbsp;</span>Statistics</a></li>
                <li class="side-bar"><a href="#"><span class="glyphicon glyphicon-cog">&nbsp;</span>Settings</a></li>

            </ul>
        </div>
    </div>
    <div class="col-md-9 animated bounce">
        <h1 class="page-header">Danh sach hoa don</h1>
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home">&nbsp;</span>Home</li>
            <li><a href="#">Hoa Don</a></li>
        </ul>

        <form action="${pageContext.request.contextPath}/hoa-don/clear" method="post">
            <button type="submit">Remove all</button>
        </form>


            <table class="table table-hover">
                <thead>
                <th>Ma hoa don</th>
                <th>Thong tin</th>
                <th>Ngay tao</th>
                <th>Trang thai</th>
                <th>Action</th>

                </thead>

                <tbody>

                <c:forEach items="${HoaDon}" var="hd">
                    <tr>
                        <td>${hd.ma}</td>
                        <td width="50%"></td>
                        <td width="10%">
                            <fmt:formatDate value="${hd.ngaytao}" pattern="dd/MM/yyyy" />
                        </td>
                        <td>${hd.trangthai == 0 ? 'chua thanh toan' : 'da thanh toan'}</td>
                        <td>
                            <button>Edit</button>
                            <button><a href="">Xóa</a></button>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>

            </table>
            <c:if test="${empty HoaDon}">
                <h2 class="text-center">Khong co hoa don nao</h2>
            </c:if>

        <div class="center-button">
            <button type="button"> <a href="${pageContext.request.contextPath}/hoa-don/tao-moi">Tao hoa don moi</a> </button>
        </div>

        <nav style="text-align: center" aria-label="Page navigation example">
            <ul class="pagination">


                <li class="page-item"><a class="page-link" href="?pageNum=${1}">Previous</a></li>
                <c:forEach begin="1" end="${totalPages}" varStatus="status">
                    <li class="page-item"><a class="page-link" href="?pageNum=${status.index}">${status.index}</a></li>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="?pageNum=${totalPages}">Next</a></li>
            </ul>

        </nav>
    </div>
</div>
</body>
</html>