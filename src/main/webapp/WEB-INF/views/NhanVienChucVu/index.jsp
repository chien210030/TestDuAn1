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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>

<body>

</div>
<div class="row">
    <div class="col-8">

        <table border="1" class="table">

            <thead>
            <tr>
                <th>Mã NV</th>
                <th>Mã CV</th>
                <th>Tên NV</th>
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
            <c:if test="${not empty NVCV.content}">
                <tbody>
                <c:forEach items="${NVCV.content}" var="ds" varStatus="i">
                    <tr>

                        <td>${ds.ma}</td>
                        <td>${ds.chucVu.ma}</td>
                        <td>${ds.ten}</td>
                        <td>${ds.ngaysinh}</td>
                        <td>${ds.gioitinh == 1 ? "Nam" : "Nữ"}</td>
                        <td>${ds.sdt}</td>
                        <td>${ds.taikhoan}</td>
                        <td>${ds.matkhau}</td>
                        <td>${ds.email}</td>
                        <td>${ds.trangthai == 1 ?"Hoạt Động" :"Không Hoạt Động"}</td>
                        <td>${ds.chucVu.ten}</td>
                        <td>
                           <a class="btn btn-danger" href="/nhan-vien-chuc-vu/delete/${ds.id}">Remove</a>
<%--                            <a class="btn btn-danger" href="javascript:remove('${ds.id}')">Remove</a>--%>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>

            </c:if>
            <c:if test="${ empty NVCV.content}"><h2 style="color: red">No data</h2></c:if>
        </table>

        <p>${DSYT.number + 1} / ${NVCV.totalPages}</p>
        <a href="/nhan-vien-chuc-vu/hien-thi?p=0">Fisrt</a>
        <a href="/nhan-vien-chuc-vu/hien-thi?p=${NVCV.number + 1}">Next</a>

    </div>
    <div class="col-2"></div>

</div>


</body>
<%--<script>--%>
<%--    function remove(id) {--%>
<%--        if (window.confirm("Bạn Có Muốn Xóa Không ?")) {--%>
<%--            location.href = "/nhan-vien-chuc-vu/delete/" + id;--%>
<%--        } else {--%>
<%--            alert("Đã Hủy")--%>
<%--        }--%>
<%--    }--%>

<%--</script>--%>
</html>