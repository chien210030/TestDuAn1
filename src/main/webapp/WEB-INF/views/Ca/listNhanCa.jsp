<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
</html>
