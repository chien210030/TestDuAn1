<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 6/17/2023
  Time: 2:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>
<body>
<div class="row">
    <div class="col-2"></div>
    <div class="col-8">
        <br>
        <br>
        <a class="btn btn-primary" href="/danh-sach-yeu-thich/view-add">Add</a>
        <br>

        <table border="1" class="table">

            <thead>
            <tr>
                <th>Mã Nhân Viên</th>
                <th>Mã Chức Vụ</th>
                <th>Tên Nhân Viên</th>
                <th>Ngày Sinh</th>
                <th>Giới Tính</th>
                <th>Số Điện</th>
                <th>Tài Khoản</th>
                <th>Mật Khẩu</th>
                <th>Email</th>
                <th>Trạng Thái</th>
                <th>Tên Chức Vụ</th>
                <th colspan="2">Action</th>
            </tr>
            </thead>
            <c:if test="${not empty DSYT.content}">
                <tbody>

                <c:forEach items="${DSYT.content}" var="ds" varStatus="i" >
                    <tr>
                        <td>${ds.ma}</td>
                        <td>${ds.chucvu.ma}</td>
                        <td>${ds.ten}</td>
                        <td>${ds.ngaySinh}</td>
                        <td>${ds.gioiTinh == 1 ? "Nam" : "Nữ"}</td>
                        <td>${ds.sdt}</td>
                        <td>${ds.taiKhoan}</td>
                        <td>${ds.matKhau}</td>
                        <td>${ds.email}</td>
                        <td>${ds.trangThai == 1 ?"Hoạt Động" :"Không Hoạt Động"}</td>
                        <td>${ds.chucvu.ten}</td>
                        <td>
                            <a class="btn btn-danger" href="javascript:remove('${ds.ma}')">Remove</a>
                        </td>
                    </tr>
                </c:forEach>



                </tbody>
            </c:if>
            <c:if test="${ empty DSYT.content}"><h2 style="color: red">No data</h2></c:if>
        </table>


        <p>${DSYT.number + 1} / ${DSYT.totalPages}</p>
        <a href="/danh-sach-yeu-thich/hien-thi?p=0">Fisrt</a>
        <a href="/danh-sach-yeu-thich/hien-thi?p=${DSYT.number - 1}">Priev</a>
        <a href="/danh-sach-yeu-thich/hien-thi?p=${DSYT.number + 1}">Next</a>
        <a href="/danh-sach-yeu-thich/hien-thi?p=${DSYT.totalPages - 1}">Last</a>

    </div>
    <div class="col-2"></div>

</div>


</body>
<script>
    function remove(ma){
        if (window.confirm("Bạn Có Muốn Xóa Không ?")){
            location.href="/danh-sach-yeu-thich/delete/" + ma;
        }else {
            alert("Đã Hủy")
        }
    }

</script>
</html>