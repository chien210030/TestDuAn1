<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khuyến Mãi</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style>

    </style>
</head>
<body>
<div class="container">
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th>Ngày bắt đầu</th>
            <th>Ngày kết thúc</th>
            <th>Giá trị giảm</th>
            <th>Trạng thái</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="item">
            <tr>
                <td>${item.ma}</td>
                <td>${item.ten}</td>
                <td>${item.ngaybatdau}</td>
                <td>${item.ngayketthuc}</td>
                <td>${item.giatrigiam}</td>
                <td>
                    <c:if test="${item.trangthai == 0}">Không hoạt động</c:if>
                    <c:if test="${item.trangthai == 1}">Hoạt động</c:if>
                </td>
                <td>
                    <a href="javascript:remove('${item.id}')" class="btn btn-danger">Remove</a>
                    <a href="/khuyen-mai/view-update/${item.id}" class="btn btn-primary">Update</a>
                    <a href="/khuyen-mai/detail/${item.id}" class="btn btn-info">Detail</a>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${page.totalElements == 0}">
            <tr>
                <td colspan="8">Không có bản ghi nào</td>
            </tr>
        </c:if>
        </tbody>
    </table>
<div class="form-group">
    <div class="col-sm-offset-4 col-sm-8">

<%--    <div class="container">--%>
        <div class="btn-group" role="group" aria-label="Pagination">
            <a href="/khuyen-mai/index?p=0&fromDate=${param.fromDate}&toDate=${param.toDate}&id=${param.id}" class="btn btn-default">First</a>
            <a href="/khuyen-mai/index?p=${page.number-1}&fromDate=${param.fromDate}&toDate=${param.toDate}&id=${param.id}" class="btn btn-default">Prev</a>
            <a href="/khuyen-mai/index?p=${page.number+1}&fromDate=${param.fromDate}&toDate=${param.toDate}&id=${param.id}" class="btn btn-default">Next</a>
            <a href="/khuyen-mai/index?p=${page.totalPages-1}&fromDate=${param.fromDate}&toDate=${param.toDate}&id=${param.id}" class="btn btn-default">Last</a>
        </div>
        <div>
            <div class="col-sm-offset-1 col-sm-4">
            <div>Trang hiện tại: ${page.number}</div>
            <div>Tổng số trang: ${page.totalPages}</div>
            <div>Tổng số bản ghi: ${page.totalElements}</div>
            </div>
        </div>
<%--    </div>--%>

    </div>
</div>





</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script>
    function remove(id){
        if(confirm('Bạn có muốn xóa?')){
            location.href = "/khuyen-mai/remove/" + id;
        }
    }
</script>
</body>
</html>

