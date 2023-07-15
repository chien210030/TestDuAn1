<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form:form modelAttribute="khuyenmai" method="post" action="/khuyen-mai/update/${khuyenmai.id}">
    <form:input type="hidden" path="id" />
    <p>Mã phiếu:
        <form:input path="ma"/>
        <form:errors path="ma" element="div"/>
    </p>
    <p>Tên phiếu:
        <form:input path="ten"/>
        <form:errors path="ten" element="div"/>
    </p>
    <p>
        Giá trị giảm: <form:input path="giatrigiam"/>
        <form:errors path="giatrigiam" element="div"/>
    </p>
    <p>
        Hình thức Khuyến Mãi: <form:input path="hinhthuckm"/>
        <form:errors path="hinhthuckm" element="div"/>
    </p>
    <p>
        Ngày bắt đầu: <form:input path="ngaybatdau" placeholder="dd/MM/yyyy"/>
        <form:errors path="ngaybatdau" element="div"/>
        <div>${dateError}</div>
    </p>
    <p>
        Ngày kết thúc: <form:input path="ngayketthuc" placeholder="dd/MM/yyyy"/>
        <form:errors path="ngayketthuc" element="div"/>
    </p>
    <p>
        Trạng thái:
        <form:radiobuttons path="trangthai" items="${dsTrangThai}"/>
        <form:errors path="trangthai" element="div"/>
    </p>
    ${message}
    <button>Update</button>
</form:form>