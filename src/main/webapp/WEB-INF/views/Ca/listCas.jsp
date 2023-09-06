<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>List of Cas</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h1 {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
        /* CSS cho menu */
        ul.menu {
            list-style-type: none;
            margin: 0;
            padding: 0;
            background-color: #007bff;
            overflow: hidden;
        }

        li.menu-item {
            float: left;
        }

        li.menu-item a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li.menu-item a:hover {
            background-color: #0056b3;
        }

    </style>

</head>
<body>

<!-- Menu -->
<ul class="menu">
    <li class="menu-item"><a href="/ca">Ca</a></li>
    <li class="menu-item"><a href="/ca/thongKe">Thông tin Ca</a></li>
    <li class="menu-item"><a href="/ca/list">Danh sách Ca</a></li>
</ul>

<form action="${pageContext.request.contextPath}/ca/nhanCa" method="post" id="nhanCaForm">
    <h2>${mess}</h2>
    <!-- Thêm trường ẩn để lưu ID của ca -->
    <input type="hidden" id="caId" name="caId" value="" />

    <div class="form-group">
        <label>Chọn nhân viên</label>
        <select name="nhanvien" class="form-control" style="background-color: #007bff; color: #fff; border: 1px solid #ccc; height: 40px; font-size: 16px;">
            <c:forEach items="${nhanvien}" var="v">
                <option value="${v.id}" style="background-color: #007bff; color: #fff; font-size: 16px;">${v.ho} ${v.tendem} ${v.ten}</option>
            </c:forEach>
        </select>
    </div>

    <table>
        <tr>
            <th>Ca</th>
            <th>Thời gian</th>
            <th>Hành động</th>
        </tr>
        <c:forEach items="${cas}" var="ca">
            <tr>
                <td><c:out value="${ca.tenCa}" /></td>
                <td>
                    <c:choose>
                        <c:when test="${ca.tenCa eq 'Ca Sáng'}">7H - 11H</c:when>
                        <c:when test="${ca.tenCa eq 'Ca Chiều'}">13H - 17H</c:when>
                        <c:when test="${ca.tenCa eq 'Ca Tối'}">17H - 21H</c:when>
                        <c:otherwise>Không xác định</c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <!-- Thêm sự kiện onclick để gọi hàm JavaScript và truyền ID của ca -->
                    <button type="button" onclick="submitForm('${ca.id}')">Ghi Nhận</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>



<script>
    function submitForm(caId) {
        // Đặt giá trị của caId vào trường ẩn 'caId'
        document.getElementById("caId").value = caId;

        // Submit form
        document.getElementById("nhanCaForm").submit();
    }
</script>
</body>


</html>
