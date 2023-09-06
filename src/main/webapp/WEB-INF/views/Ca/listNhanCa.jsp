



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

    <div class="col-md-7 animated bounce">
        <title>Danh sách Nhân Ca</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            h1 {
                background-color: #007bff;
                color: #fff;
                padding: 10px;
                text-align: center;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: #fff;
            }

            th, td {
                border: 1px solid #ccc;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }

            button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 8px 16px;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }

            /* Thêm CSS cho ô input và nút tìm kiếm */
            input[type="text"], button[type="submit"] {
                padding: 8px;
                margin: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            /* CSS cho menu */
            ul.menu {
                list-style-type: none;
                margin: 0;
                padding: 0;
                background-color: #007bff;
                overflow: hidden;
            }

            li.menu-item {
                float: left;
            }

            li.menu-item a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            li.menu-item a:hover {
                background-color: #0056b3;
            }
        </style>
        </head>
        <body>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <!-- Menu -->
        <ul class="menu">
            <li class="menu-item"><a href="/ca">Ca</a></li>
            <li class="menu-item"><a href="/ca/thongKe">Thông tin Ca</a></li>
            <li class="menu-item"><a href="/ca/list">Danh sách Ca</a></li>
        </ul>

        <form action="/ca/search" method="get">
            <input type="text" name="searchQuery" placeholder="Nhập tên, tên đệm hoặc họ">
            <button type="submit">Tìm kiếm</button>
        </form>

        <table border="1">
            <thead>
            <tr>
                <th>STT</th>
                <th>Họ tên nhân viên</th>
                <th>Ngày làm</th>
                <th>Ca làm</th>
                <th>Số lượng đơn</th>
                <th>Tổng tiền</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="info" items="${nhanCaInfo.content}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${info[0]}</td>
                    <td>${info[1]}</td>
                    <td>${info[2]}</td>
                    <td>${info[3]}</td>
                    <td>${info[4]}</td>
                </tr>
            </c:forEach>


            <!-- Tạo liên kết chuyển trang -->
            <%--    <div class="pagination">--%>
            <%--        <ul>--%>
            <%--            <c:forEach var="i" begin="0" end="${nhanCaInfo.totalPages - 1}">--%>
            <%--                <li><a href="?page=${i}&size=${nhanCaInfo.size}">${i + 1}</a></li>--%>
            <%--            </c:forEach>--%>
            <%--        </ul>--%>
            <%--    </div>--%>


            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="?page=0&size=${nhanCaInfo.size}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach var="i" begin="0" end="${nhanCaInfo.totalPages - 1}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${i}&size=${nhanCaInfo.size}">${i + 1}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item">
                        <a class="page-link" href="?page=${nhanCaInfo.totalPages - 1}&size=${nhanCaInfo.size}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>

            </tbody>
        </table>
        </body>

    </div>
</div>

</div>
</body>
</html>
