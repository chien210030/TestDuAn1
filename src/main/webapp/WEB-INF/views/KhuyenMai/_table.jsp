<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<table border="1" style="width:100%">
    <tr>
        <th>Mã</th>
        <th>Tên</th>
        <th>Ngày bắt đầu</th>
        <th>Ngày kết thúc</th>
        <th>Giá trị giảm</th>
        <th>Trạng thái</th>
        <th>Action</th>
    </tr>
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
                <a href="javascript:remove('${item.id}')">Remove</a>
                <a href="/khuyen-mai/view-update/${item.id}">Update</a>
                <a href="/khuyen-mai/detail/${item.id}">Detail</a>
            </td>
        </tr>
    </c:forEach>
    <c:if test="${page.totalElements == 0}">
        <td colspan="8">Không có bản ghi nào</td>
    </c:if>
</table>

<a href="/khuyen-mai/index?p=0&fromDate=${param.fromDate}&toDate=${param.toDate}&id=${param.id}">First</a>
<a href="/khuyen-mai/index?p=${page.number-1}&fromDate=${param.fromDate}&toDate=${param.toDate}&id=${param.id}">Prev</a>
<a href="/khuyen-mai/index?p=${page.number+1}&fromDate=${param.fromDate}&toDate=${param.toDate}&id=${param.id}">Next</a>
<a href="/khuyen-mai/index?p=${page.totalPages-1}&fromDate=${param.fromDate}&toDate=${param.toDate}&id=${param.id}">Last</a>
<div>Trang hiện tại: ${page.number}</div>
<div>Tổng số trang: ${page.totalPages}</div>
<div>Tổng số bản ghi:${page.totalElements}</div>
<script>
function remove(id){
    if(confirm('Bạn có muốn xóa?')){
        location.href = "/khuyen-mai/remove/" + id;
    }
}
</script>