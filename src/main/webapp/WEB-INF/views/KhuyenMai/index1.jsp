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
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-header">Danh sách Khuyến Mãi</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <a href="/khuyen-mai/add" class="btn btn-primary">Add</a> <!-- Thêm nút "Add" -->
        </div>
    </div>
    <table class="table table-bordered table-striped">
        <!-- Phần table chi tiết khuyến mãi không thay đổi -->
    </table>
    <div class="form-group">
        <!-- Phần phân trang không thay đổi -->
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
