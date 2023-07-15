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
        <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/view-add">THÊM</a>
        <br>
        <table border="1" class="table table-hover">
            <tr>
            <tr>
                <th>ID</th>
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
            <c:if test="${not empty NVCV.content}">
                <tbody>
                <c:forEach items="${NVCV.content}" var="ds" varStatus="i">
                    <tr>
                        <td>${ds.id}</td>
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
                            <a class="btn btn-outline-danger" href="javascript:remove('${ds.id}')">XÓA</a>
                            <a class="btn btn-outline-danger" href="/nhan-vien-chuc-vu/view-update/${ds.id}">SỬA</a>
                            <a class="btn btn-outline-danger" href="/nhan-vien-chuc-vu/detail/${ds.id}">DETAIL</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </c:if>
            <c:if test="${ empty NVCV.content}"><h2 style="color: red">No data</h2></c:if>
        </table>
        <p>Số Trang : ${NVCV.number + 1} / ${NVCV.totalPages}</p>
        <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/hien-thi?p=0"> << </a>
        <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/hien-thi?p=${NVCV.number - 1}"> < </a>
        <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/hien-thi?p=${NVCV.number + 1}"> > </a>
        <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/hien-thi?p=${NVCV.totalPages - 1}"> >> </a>

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