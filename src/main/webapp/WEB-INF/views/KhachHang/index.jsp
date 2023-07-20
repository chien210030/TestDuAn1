<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<head>


<body>


<div class="row">
    <div class="col-1"></div>
    <div class="col-10">
        <br>
        <br>
        <div class="row">
            <div class="col-4">
                <form action="/khach-hang/search" method="get">
                    Mã : <input type="text" name="ma" class="form-control">

                    Tên : <input type="text" name="ten" class="form-control">
                    <br>
                    <button type="submit" class="btn btn-primary">Tìm</button>

                </form>
            </div>
            <div class="col-4"></div>
            <div class="col-4"></div>
        </div>
        <br>
        <a class="btn btn-outline-primary" href="/khach-hang/view-add">Add</a>
        <br>
        <br>
        <table border="1" class="table table-hover">
            <tr>
<%--                <th>ID</th>--%>
                <th>Mã</th>
                <th>Tên Đầy Đủ</th>
                <th>Giới Tính</th>
                <th>Ngày Sinh</th>
                <th>Email</th>
                <th>Số Điện</th>
                <th>Điểm Thưởng</th>
                <th colspan="2">Action</th>
            </tr>
            <c:if test="${not empty khachHang.content}">
                <tbody>
                <c:forEach items="${khachHang.content}" var="ds" varStatus="i">
                    <tr>
<%--                       <td>${ds.id}</td>--%>
                        <td>${ds.ma}</td>
                        <td>${ds.ho} ${ds.tendem} ${ds.ten}</td>
                        <td>${ds.gioitinh == true ? "Nam" : "Nữ"}</td>
                        <td>${ds.ngaysinh}</td>
                        <td>${ds.email}</td>
                        <td>${ds.sdt}</td>
                        <td>${ds.diemthuong}</td>
                        <td>
                            <a class="btn btn-outline-danger" href="javascript:remove('${ds.id}')">Remove</a>
                            <a class="btn btn-outline-success" href="/khach-hang/view-update/${ds.id}">Update</a>
                            <a class="btn btn-outline-warning" href="/khach-hang/detail/${ds.id}">Detail</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </c:if>
            <c:if test="${ empty khachHang.content}"><h2 style="color: red">No data</h2></c:if>
        </table>
        <p>Số Trang : ${khachHang.number + 1} / ${khachHang.totalPages}</p>
        <a class="btn btn-outline-primary"  href="/khach-hang/hien-thi?p=0"> << </a>
        <a class="btn btn-outline-primary"  href="/khach-hang/hien-thi?p=${khachHang.number - 1}"> < </a>
        <a class="btn btn-outline-primary"  href="/khach-hang/hien-thi?p=${khachHang.number + 1}"> > </a>
        <a class="btn btn-outline-primary"  href="/khach-hang/hien-thi?p=${khachHang.totalPages - 1}"> >> </a>

    </div>
    <div class="col-1"></div>
</div>

</body>

<script>
    function remove(id) {
        if (window.confirm("Bạn Có Muốn Xóa Không ?")) {
            location.href = "/khach-hang/remove/" + id;
        } else {
            alert("Đã Hủy")
        }
    }

</script>
</head>
</html>