<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div>
    <p>Id: ${khuyenmai.id}</p>
    <p>Mã: ${khuyenmai.ma}</p>
    <p>Tên phiếu: ${khuyenmai.ten}</p>
    <p> Giá trị giảm: ${khuyenmai.giatrigiam}</p>
    <p>Hình thức giảm: ${khuyenmai.hinhthuckm}</p>
    <p>Ngày bắt đầu: ${khuyenmai.ngaybatdau}</p>
    <p>Ngày kết thúc: ${khuyenmai.ngayketthuc}</p>
    <p>Trạng thái:
        <c:if test="${khuyenmai.trangthai == 1}">Hoạt động</c:if>
        <c:if test="${khuyenmai.trangthai == 0}">Không hoạt động</c:if>
    </p>
    <a href="/khuyen-mai/index">Back</a>
</div>