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
<div class="col-10">
    <table border="1" class="table-header">
        <tr>
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
    </table>
</div>
</body>
</head>
</html>