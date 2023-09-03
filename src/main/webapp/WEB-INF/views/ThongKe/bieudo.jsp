<%@ page pageEncoding="utf-8"%>





<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style>

        body {
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
        .test{
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
        .title{
            text-decoration: none;
            color: #FFFFFF;
            margin: 1.2rem;

        }
        .title:hover{
            text-decoration: none !important;
            color: #c69500;
            margin: 20px;
        }
    </style>
</head>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Admin Panel</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user">&nbsp;</span>Hello Admin</a></li>
                <li class="active"><a title="View Website" href="#"><span class="glyphicon glyphicon-globe"></span></a>
                </li>
                <li><a href="#">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
<body>
<div class="container-fluid">
    <jsp:include page="Templates/aside.jsp"/>
    <div class="col-md-8 animated bounce">
        <head>
            <meta charset="UTF-8">
            <title>Dashboard</title>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        </head>
        <style>
            .container {
                /*max-width: 1200px;*/
                margin: 0 auto;
            }

            .container .row {
                display: flex;
                flex-wrap: wrap;
            }

            .col-6 {
                width: 50%;
                padding: 10px;
                box-sizing: border-box;
            }

            .product-container, .summary-container {
                border: 1px solid #ccc;
                padding: 20px;
                margin: 10px 0;
            }

            .product-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
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

            h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            /* Định dạng form chọn năm */
            form {
                text-align: center;
                margin-bottom: 20px;
            }

            /* Định dạng select box */
            select {
                padding: 8px 12px;
                font-size: 16px;
                border-radius: 5px;
                border: 1px solid #ccc;
                margin-right: 10px;
            }

            /* Định dạng nút tìm kiếm */
            button {
                padding: 10px 20px;
                font-size: 16px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            /* Định dạng container chứa biểu đồ */
            #chartContainer {
                max-width: 100%;
                height: 500px;
                margin-bottom: 40px;
                border: 1px solid #ccc;
                border-radius: 5px;
                overflow: hidden;
            }

            /* Định dạng canvas biểu đồ */
            #myChart {
                width: 100%;
                height: 100%;
            }
        </style>
        <body>



        <div class="row">
            <h1>Dashboard</h1>

            <form action="/thongke/dashboard" method="post">
                <!-- Thay thế checkbox bằng select box -->
                <label for="selectedYear">Chọn năm:</label>
                <select name="selectedYear" id="selectedYear">
                    <c:forEach var="year" begin="2015" end="2030">
                        <option value="${year}" <c:if test="${year == selectedYear}">selected</c:if>>${year}</option>
                    </c:forEach>
                </select>
                <button type="submit">Search</button>
            </form>



            <!-- Đặt canvas cho biểu đồ -->
            <div style="max-width: 100%; height: 500px;">
                <canvas id="myChart" style="width: 100%; height: 100%;"></canvas>
            </div>
        </div>



        <div class="container">
            <div class="row">
                <div class="col-6">
                    <div class="product-container">
                        <h2>Top 5 sản phẩm bán chạy</h2>
                        <table class="product-table">
                            <tr>
                                <th>Product Name</th>
                                <th>Số lượng</th>
                            </tr>
                            <c:forEach items="${top5ProductsData}" var="productData">
                                <tr>
                                    <td>${productData[0].sanpham.ten}</td>
                                    <td>${productData[1]}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <div class="col-6">
                    <div class="summary-container">
                        <h2>Summary</h2>
                        <p> <h4>Tổng số lượng sản phẩm: ${totalProductQuantity}</h4></p>
                        <p><h4>Tổng số lượng đơn hàng: ${totalOrderCount}</h4></p>
                        <p><h4>Tổng doanh thu: ${totalProfit}</h4></p>
                    </div>
                </div>
            </div>


        </div>

        <script th:inline="javascript">
            // Parse the JSON data from the model attribute
            var productStatsData = ${productStatsDataJson}
            var orderStatsData = ${orderStatsDataJson}
            var profitStatsData = ${profitStatsDataJson}

        </script>


        <script>
            // Lấy context của canvas
            var ctx = document.getElementById('myChart').getContext('2d');

            // Tạo biểu đồ bằng Chart.js
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
                    datasets: [
                        {
                            label: 'Sản phẩm',
                            data: productStatsData.map(item => item[1]),
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1
                        },
                        {
                            label: 'Đơn hàng',
                            data: orderStatsData.map(item => item[1]),
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        },
                        {
                            label: 'Doanh thu',
                            data: profitStatsData.map(item => item[1]),
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }
                    ]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

        </script>
        <script>
            document.querySelector("form").addEventListener("submit", function (event) {
                var selectedYear = document.getElementById("selectedYear").value;
                localStorage.setItem("selectedYear", selectedYear);
            });
            document.addEventListener("DOMContentLoaded", function () {
                var selectedYear = localStorage.getItem("selectedYear");
                if (selectedYear) {
                    document.getElementById("selectedYear").value = selectedYear;
                }
            });
        </script>

        </body>
</div>

</div>
</body>
</html>