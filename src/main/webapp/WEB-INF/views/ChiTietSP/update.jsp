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

    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
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
<body>
<jsp:include page="Templates/navbar.jsp"/>
<div class="container-fluid">
<jsp:include page="Templates/aside.jsp"/>

    <div class="col-md-9 animated bounce">
        <h1 class="page-header">Update</h1>
        <form action="${pageContext.request.contextPath}/add" method="post">
            <div class="mb-3 mt-3">
                <label>Sản Phẩm </label>  <select name="sanpham">
                <c:forEach items="${sanphams}" var="cb">
                    <option value="${loadupdate.sanpham.id}" >${loadupdate.sanpham.ten}</option>
                </c:forEach>
            </select>

            </div>
            <div class="mb-3 mt-3">
                <label>Dòng Sản Phẩm </label>  <select name="dongsp">
                <c:forEach items="${dongsps}" var="cb">
                    <option value="${loadupdate.dongsp.id}">${loadupdate.dongsp.ten}</option>
                </c:forEach>
            </select>

            </div>
            <div class="mb-3 mt-3">
                <label>Chất Liệu</label>  <select name="chatlieu">
                <c:forEach items="${chatlieus}" var="cb">
                    <option value="${loadupdate.chatlieu.id}">${loadupdate.chatlieu.ten}</option>
                </c:forEach>
            </select>

            </div>
            <div class="mb-3 mt-3">
                <label>Thương Hiệu </label> <select name="thuonghieu">
                <c:forEach items="${thuonghieus}" >
                    <option value="${loadupdate.thuonghieu.id}">${loadupdate.thuonghieu.ten}</option>
                </c:forEach>
            </select>

            </div>
            <div class="mb-3 mt-3">
                <label>Kích Cỡ</label> <select name="kichco">
                <c:forEach items="${kichcos}" var="cb">
                    <option value="${loadupdate.kichco.id}">${loadupdate.kichco.ten}</option>
                </c:forEach>
            </select>
            </div>
            <div class="mb-3 mt-3">
                <label>Màu Sắc</label>  <select name="mausac">
                <c:forEach items="${mausacs}" var="cb">
                    <option value="${loadupdate.mausac.id}">${loadupdate.mausac.ten}</option>
                </c:forEach>
            </select>

            </div>
            <div class="mb-3 mt-3">
                <label>Nhà Sản Xuất</label>  <select name="nsx">
                <c:forEach items="${nsxs}" var="cb">
                    <option value="${loadupdate.nsx.id}">${loadupdate.nsx.ten}</option>
                </c:forEach>
            </select>

            </div>
            <div class="mb-3 mt-3">
                <label >Id:</label>
                <input type="hidden" class="form-control"   placeholder="Enter mota" name="id" value="${loadupdate.id}">
            </div>
            <div class="mb-3 mt-3">
                <label >Mô Tả:</label>
                <input type="text" class="form-control"  placeholder="Enter mota" name="mota" value="${loadupdate.mota}">
            </div>
<%--            <div class="mb-3">--%>
<%--                <label>Gia Nhap:</label>--%>
<%--                <input type="number" class="form-control"   placeholder="Enter gianhap" name="gianhap" value="${loadupdate.gianhap}">--%>
<%--            </div>--%>
            <div class="mb-3">
                <label>Giá Bán:</label>
                <input type="number" class="form-control"   placeholder="Enter giaban" name="giaban" value="${loadupdate.giaban}">
            </div>
            <div class="mb-3">
                <label>Số Lượng Tồn:</label>
                <input type="number" class="form-control"   placeholder="Enter soluongton" name="soluongton" value="${loadupdate.soluongton}">
            </div>
            <button type="submit">Thêm</button>


        </form>


    </div>
</div>


</body>
</html>