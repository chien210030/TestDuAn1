<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>View Create</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
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
<form action="${pageContext.request.contextPath}/add" method="post">
    <select name="sanpham">
        <c:forEach items="${loadCBbox}" var="cb">
            <option value="${cb.sanpham.ma}">${cb.sanpham.ma}</option>
<%--            <option value="${cb.sanpham.ten}">${cb.sanpham.ten}</option>--%>
<%--            <option value="${cb.dongsp.ten}">${cb.dongsp.ten}</option>--%>
<%--            <option value="${cb.thuonghieu.ten}">${cb.thuonghieu.ten}</option>--%>
        </c:forEach>
    </select>
    <div class="form-control">
        <label>Kich Co</label><input name="kichco" type="number" required="required">
    </div>
    <div class="form-control">
        <label>chat lieu</label><input name="chatlieu" type="text" required="required">
    </div>
    <div class="form-control">
        <label>Mau Sac</label><input name="mausac" type="text" required="required">
    </div>

    <div class="form-control">
        <label>Mo Ta</label><input name="mota" type="text" required="required">
    </div>
    <div class="form-control">
        <label>So Luong Ton</label><input name="soluongton" type="number" required="required">
    </div>
    <div class="form-control">
        <label>Gia Nhap </label><input name="gianhap" type="number" required="required">
    </div>
    <div class="form-control">
        <label>Gia Ban </label><input name="giaban" type="number" required="required">
    </div>

</form>


</body>
</html>