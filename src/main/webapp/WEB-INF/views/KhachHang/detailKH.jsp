<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="row">
    <div class="col-4"></div>
    <div class="col-4">

        <br>
        <br>
        <ul class="list-group">
            <li class="list-group-item"><h3 style="color: red ; text-align: center"> Chi Tiết Khách Hàng</h3></li>
            <li class="list-group-item">Mã: ${dt.ma}</li>
            <li class="list-group-item">Họ Và Tên : ${dt.ho} ${dt.tendem} ${dt.ten}</li>
            <li class="list-group-item">Giới Tính : ${dt.gioitinh == true ?'Nam':'Nữ'}</li>
            <li class="list-group-item">Ngày Sinh : ${dt.ngaysinh}</li>
            <li class="list-group-item">Email : ${dt.email}</li>
            <li class="list-group-item">SĐT : ${dt.sdt}</li>
            <li class="list-group-item">Điểm Thưởng : ${dt.diemthuong}</li>
            <li class="list-group-item">

                <a class=" btn btn-outline-secondary" href="/khach-hang/hien-thi">Close</a>

            </li>
        </ul>

        <%--        <div class="modal" tabindex="-1">--%>
        <%--            <div class="modal-dialog">--%>
        <%--                <div class="modal-content">--%>
        <%--                    <div class="modal-header">--%>
        <%--                        <h5 class="modal-title" style="color: red">Chi Tiết Khách Hàng</h5>--%>
        <%--                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
        <%--                    </div>--%>
        <%--                    <div class="modal-body">--%>
        <%--                        <p>Họ Và Tên : ${dt.ho} ${dt.tendem} ${dt.ten}</p>--%>
        <%--                        <br>--%>
        <%--                        <p>Giới Tính : ${dt.gioitinh}</p>--%>
        <%--                        <br>--%>
        <%--                        <p>Ngày Sinh : ${dt.ngaysinh}</p>--%>
        <%--                        <br>--%>
        <%--                        <p>Email : ${dt.email}</p>--%>
        <%--                        <br>--%>
        <%--                        <p>SĐT : ${dt.sdt}</p>--%>
        <%--                        <br>--%>
        <%--                        <p>Điểm Thưởng : ${dt.diemthuong}</p>--%>
        <%--                    </div>--%>
        <%--                    <div class="modal-footer">--%>
        <%--                        <a type="button" class="btn btn-secondary" data-bs-dismiss="modal" href="">Close</a>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>


    </div>
    <div class="col-4"></div>
</div>

</body>
</html>