<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>

<body>
<div class="container">
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
</div>
</body>
</html>


