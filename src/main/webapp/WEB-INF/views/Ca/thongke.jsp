<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Summary</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h2 {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        h3 {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
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
            margin-top: 20px;
        }

        button:hover {
            background-color: #0056b3;
        }

        a {
            display: block;
            text-align: center;
            text-decoration: none;
            color: #007bff;
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


<h3>Tổng Tiền Các Ca:</h3>
<table>
    <tr>
        <th>Ca</th>
        <th>Tổng Tiền</th>
    </tr>
    <c:forEach items="${shiftTotals}" var="shiftTotal">
        <tr>
            <td><c:out value="${shiftTotal.tenCa}" /></td>
            <td><c:out value="${shiftTotal.totalTien}" /></td>
        </tr>
    </c:forEach>
    <tr>
        <td><strong>Tổng Tiền Ca</strong></td>
        <td>
            <c:set var="totalTienSum" value="0" />
            <c:forEach items="${shiftTotals}" var="shiftTotal">
                <c:set var="totalTienSum" value="${totalTienSum + shiftTotal.totalTien}" />
            </c:forEach>
            <c:out value="${totalTienSum}" />
        </td>
    </tr>
</table>
<h1>${completedOrders}</h1>


<form action="${pageContext.request.contextPath}/ca/ketCa" method="post">
    <button type="submit">Kết Ca</button>
</form>

<a href="${pageContext.request.contextPath}/ca">Thoát</a>
</body>
</html>
