<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>
<body>
<div class="row">
    <div class="col-3"></div>
    <div class="col-6">
        <h3>Thêm Nhân Viên Chức Vụ</h3>
        <br>
        <form action="/nhan-vien-chuc-vu/add" method="post" onsubmit=" return add()">
            <label>Tên NV :</label>
            <input class="form-control" name="ten">
            <span style="color: red">${erro}</span>
            <br>
            <label>Tên Chức Vụ :</label>
            <select name="chucVu">
                <c:forEach items="${chucVu}" var="cv">
                    <option value="${cv.id}">${cv.ten}</option>
                </c:forEach>
            </select>
            <br>
            <label>Ngày Sinh :</label>
            <input class="form-control" type="date" name="ngaysinh">
            <span style="color: red">${erro}</span>
            <br>
            <label>Số Điện :</label>
            <input class="form-control" name="sdt">
            <span style="color: red">${erro}</span>
            <br>
            <label>Tài Khoản :</label>
            <input class="form-control" name="taikhoan">
            <span style="color: red">${erro}</span>
            <br>
            <label>Mật Khẩu :</label>
            <input class="form-control" name="matkhau">
            <span style="color: red">${erro}</span>
            <br>
            <label>Email :</label>
            <input class="form-control" name="email">
            <span style="color: red">${erro}</span>
            <br>
            Trạng Thái :<input type="radio" name="trangthai" value="1" checked>Hoạt Động
            <input type="radio" name="trangthai" value="0">Ngừng Hoạt Động
            <br>
            <br>
            Giới Tính :<input type="radio" name="gioitinh" value="1" checked>Nam
            <input type="radio" name="gioitinh" value="0">Nữ
            <hr>
            <button class="btn btn-outline-primary">THÊM</button>
            <a class="btn btn-outline-primary" href="/nhan-vien-chuc-vu/hien-thi">HOME</a>
        </form>


    </div>
    <div class="col-3"></div>
</div>

</body>
<script>
    function add(){
        if (window.confirm("Bạn Có muồn thêm không trang Thêm Không ?")){

        }else {
            return false;
        }
    }
</script>
</html>