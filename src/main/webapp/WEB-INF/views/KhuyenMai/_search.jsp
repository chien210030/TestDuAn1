<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


    <form:form action="/khuyen-mai/index" method="post" modelAttribute="searchForm" class="form-inline">


        <div class="form-group">
            <label>Từ ngày:</label>
            <form:input placeholder="dd/MM/yyyy" path="fromDate" class="form-control"/>
        </div>

        <div class="form-group">
            <label>Đến ngày:</label>
            <form:input placeholder="dd/MM/yyyy" path="toDate" class="form-control"/>
        </div>

        <button type="submit" class="btn btn-primary">Tìm</button>
    </form:form>



