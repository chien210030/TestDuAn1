<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            padding-top: 80px;
        }

        #sidebar {
            position: fixed;
            top: 50px;
            left: 220px;
            width: 220px;
            margin-left: -220px;
            border: none;
            border-radius: 0;
            overflow-y: auto;
            background-color: #222;
            bottom: 0;
            overflow-x: hidden;
            padding-bottom: 40px;
        }

        .side-bar > li > a {
            colo: #eee;
            width: 220px;
        }

        .side-bar li a:hover,
        .side-bar li a:focus {
            background-color: #333;
        }

        .test {
            height: 15rem;
            display: none;

        }

        .tesst1:hover + .test,
        .test:hover {
            display: block;

        }

        .tmargin {
            margin-top: 20px;

        }

        .title {
            text-decoration: none;
            color: #FFFFFF;
            margin: 1.2rem;

        }

        .title:hover {
            text-decoration: none !important;
            color: #c69500;
            margin: 20px;
        }
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="date"], input[type="time"], input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
        /* CSS code for the select element */
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            /* Customize the appearance of the dropdown arrow */
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg fill="gray" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
            background-repeat: no-repeat;
            background-position: right 8px center;
            /* Add some padding to make room for the arrow */
            padding-right: 30px;
        }

        /* Style the options inside the select dropdown */
        select option {
            padding: 8px;
            font-size: 14px;
        }

        /* Style the select dropdown when it's open */
        select:focus {
            outline: none;
            border-color: #4CAF50; /* Change the border color when focused */
            box-shadow: 0 0 5px #4CAF50; /* Add a shadow when focused */
        }

    </style>
</head>
<body>

<jsp:include page="Templates/navbar.jsp"/>
<div class="container-fluid">
    <jsp:include page="Templates/aside.jsp"/>
    <div class="container">
        <h2>Thông tin giao ca</h2>
        <div class="form-group">
            <label for="date">Ngày:</label>
            <input type="date" id="date" name="date" required>
        </div>

        <div class="form-group">
            <label for="shiftType">Loại ca:</label>
            <select id="shiftType" name="shiftType" required>
                <option value="Sáng">Sáng</option>
                <option value="Chiều">Chiều</option>
                <option value="Tối">Tối</option>
            </select>
        </div>
        <div class="form-group">
            <label for="ordersProcessed">Số lượng đơn hàng đã xử lý:</label>
            <input type="number" id="ordersProcessed" name="ordersProcessed" required>
        </div>
        <div class="form-group">
            <label for="totalRevenue">Tổng doanh thu:</label>
            <input type="number" id="totalRevenue" name="totalRevenue" required>
        </div>
        <button type="button" onclick="submitForm()">Xác nhận giao ca</button>
        <button type="button" onclick="completeShift()">Xác nhận kết thúc ca</button>
    </div>
</div>
</body>
</html>