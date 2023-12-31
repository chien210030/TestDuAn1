<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <%@ page contentType="text/html; charset=UTF-8" %>
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

        .test {
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

        .title {
            text-decoration: none;
            color: #FFFFFF;
            margin: 1.2rem;

        }

        .title:hover {
            text-decoration: none !important;
            color: #c69500;
            margin: 20px;
        }


    </style>
</head>
<body>
<jsp:include page="Templates/navbar.jsp"/>
<div class="container-fluid">
    <jsp:include page="Templates/aside.jsp"/>
    <div class="col-md-9 animated bounce">
        <h1 class="page-header">Categorys</h1>
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home">&nbsp;</span>Home</li>
            <li><a href="#">Categorys</a></li>
        </ul>
        <a class=" btn btn-primary" href="${pageContext.request.contextPath}/viewaddDongSP">add</a>
        <form action="${pageContext.request.contextPath}/loadDongSP">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Mã</th>
                    <th>Tên</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${Dongsp}" var="i">
                    <tr>
                        <td>${i.ma}</td>
                        <td>${i.ten}</td>
                        <td><a class="btn btn-danger" href="${pageContext.request.contextPath}/deleteDongSP/${i.id}">Delete</a></td>
                        <td><a class="btn btn-warning" href="${pageContext.request.contextPath}/updateDongSP/${i.id}">Update</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


        </form>
        <nav style="text-align: center" aria-label="Page navigation example">
            <ul class="pagination">


                <li class="page-item"><a class="page-link" href="?pageNum=${1}">Previous</a></li>
                <c:forEach begin="1" end="${totalpages}" varStatus="status">
                    <li class="page-item"><a class="page-link" href="?pageNum=${status.index}">${status.index}</a></li>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="?pageNum=${totalpages}">Next</a></li>
            </ul>

        </nav>

    </div>

</div>
</body>
</html>