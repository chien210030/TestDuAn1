<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <h1 class="page-header">Size</h1>
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-home">&nbsp;</span>Home</li>
            <li><a href="#">Products</a></li>
        </ul>
        <a class=" btn btn-primary" href="${pageContext.request.contextPath}/viewaddMauSac">add</a>
        <form action="${pageContext.request.contextPath}/loadMauSac">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ma</th>
                    <th>ten</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${MauSac}" var="i">
                    <tr>
                        <td>${i.ma}</td>
                        <td>${i.ten}</td>
                        <td><a class="btn btn-danger" href="${pageContext.request.contextPath}/deleteMauSac/${i.id}">Delete</a></td>
                        <td><a class="btn btn-warning" href="${pageContext.request.contextPath}/updateMauSac/${i.id}">update</a></td>
                    </tr>
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