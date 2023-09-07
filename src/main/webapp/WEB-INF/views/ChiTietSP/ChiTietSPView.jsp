<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
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
<div class="container-fluid" >
    <jsp:include page="Templates/aside.jsp"/>

    <div class="col-md-9 animated bounce" >
<%--        <a class="btn btn-success"  onclick="window.history.back()">Back</a>--%>
        <h1 class="page-header">Products Result</h1>
        <ul class="breadcrumb">
            <li><span class="glyphicon glyphicon-th-large">&nbsp;</span>Products Result</li>
            <%--            <li><a href="#">Dashboard</a></li>--%>
        </ul>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/showcreate">add</a>
    <a class="btn btn-success" href="${pageContext.request.contextPath}/exportChiTietSPExcel">Excel</a>


    <form action="${pageContext.request.contextPath}/loadsp" >
            <table class="table table-hover" border="1">
                <thead>
                <th>ma</th>
                <th class="text-center">Ten</th>
                <th>Mo Ta</th>
                <th class="text-center">So Luong Ton</th>
                <th>Gia Ban</th>
                <th>Dong SP</th>
                <th>Nha San Xuat</th>
                <th>mau sac</th>
                <th>kich Co</th>
                <th>Chat Lieu</th>
                <th>Thuong Hieu</th>


                </thead>
                <tbody>
                <!-- START CONTENT END -->
                <c:forEach items="${loadSP}" var="sp">


                    <tr>

                        <td>${sp.sanpham.ma}</td>
                        <td>${sp.sanpham.ten}</td>
                        <td>${sp.mota}</td>
                        <td>${sp.soluongton}</td>
                        <td>${sp.giaban}</td>
                        <td>${sp.dongsp.ten}</td>
                        <td>${sp.nsx.ten}</td>
                        <td>${sp.mausac.ten}</td>
                        <td>${sp.kichco.ten}</td>
                        <td>${sp.chatlieu.ten}</td>
                        <td>${sp.thuonghieu.ten}</td>

                        <td><a class="btn btn-danger"
                               href="${pageContext.request.contextPath}/delete/${sp.id}">Remove</a></td>
                        <td><a class="btn btn-warning" href="${pageContext.request.contextPath}/viewupdate/${sp.id}">Update</a>
                        </td>
                        <td>
                            <a class="btn btn-success"
                               href="${pageContext.request.contextPath}/exportExcelCTSP/${sp.id}">Excel</a>
                        </td>

                    </tr>


                    <!-- DUMP CONTENT END -->
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