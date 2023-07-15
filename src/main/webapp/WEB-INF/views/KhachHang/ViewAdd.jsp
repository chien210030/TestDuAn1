<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<style>
    .crr{
        color: red;
    }
</style>
<body>
<div class="row">
    <div class="col-2"></div>
    <div class="col-8">

        <h3>Add Khách Hàng</h3>
        <br>
        <br>

        <form:form  action="/khach-hang/add" method="post" modelAttribute="kh" onsubmit="return add()">
            <label>Họ :</label>
            <form:input class="form-control" path="ho"/>
            <form:errors cssClass="crr" path="ho"></form:errors>
            <br>

            <label>Tên Đệm :</label>
            <form:input class="form-control" path="tendem"/>
            <form:errors cssClass="crr" path="tendem"></form:errors>
            <br>

            <label>Tên :</label>
            <form:input class="form-control" path="ten"/>
            <form:errors cssClass="crr" path="ten"></form:errors>
            <br>

            <label>Giới Tính :</label>
            <form:radiobuttons path="gioitinh" class="form-check-input" items="${gioitinh}"/>
            <form:errors cssClass="crr" path="gioitinh"></form:errors>
            <br>
            <br>
            <label>Ngày Sinh :</label>
            <form:input class="form-control" type="date" path="ngaysinh"/>
            <br>

            <label>Email :</label>
            <form:input class="form-control" type="email" path="email"/>
            <form:errors cssClass="crr" path="email"></form:errors>
            <br>

            <label>SDT :</label>
            <form:input class="form-control" path="sdt"/>
            <form:errors cssClass="crr" path="sdt"></form:errors>
            <br>

            <label>Điểm Thưởng :</label>
            <form:input class="form-control" path="diemthuong"/>
            <form:errors cssClass="crr" path="diemthuong"></form:errors>
            <br>
            <br>
            <button class="btn btn-outline-primary">Add</button>
            <a class=" btn btn-outline-secondary" href="/khach-hang/hien-thi">Close</a>
        </form:form>


    </div>
    <div class="col-2"></div>
</div>

</body>

<script>
    function add(){
        if (window.confirm("Bạn có muốn add không!")){

        }else {
            return false;
        }
    }
</script>
</html>