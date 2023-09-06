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
            background-color: #222222;
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

        .bmarin {
            /*margin: 40px;*/
            padding: 40px;
        }

        .row {
            display: flex;
            justify-content: space-between;
        }

        .groove {
            border-style: ridge;

        }

        /*TABS*/
        /* Style the tab */
        .tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

        /* Style the buttons inside the tab */
        .tab button {
            background-color: inherit;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
        }

        /* Change background color of buttons on hover */
        .tab button:hover {
            background-color: #ddd;
        }

        /* Create an active/current tablink class */
        .tab button.active {
            background-color: #ccc;
        }

        /* Style the tab content */
        .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }

        /* Style the close button */
        .topright {
            float: right;
            cursor: pointer;
            font-size: 28px;
        }

        .topright:hover {
            color: red;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 0.2rem;
            max-width: 400px;
            margin: 0 auto;
            padding: 1rem;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        h1 {
            text-align: center;
        }

        label {
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        select:focus {
            outline: none;
            border-color: blue;
        }

    </style>
</head>
<body>
<jsp:include page="Templates/navbar.jsp"/>
<div class="container-fluid">
    <div class="col-md-5">
        <div class="col-6 ">
            <form method="get">
                <h1> Hoa Don</h1>
                <label  >Ma Hoa Don: </label>
                <input type="text" name="" required value="${inHoaDon.ma}"/>
                <br>

                <label  > Thoi Gian Tao: </label>
                <input type="text" name="" required value="${inHoaDon.ngaytao}"/>
                <br/>

                <label  > Khach Hang: </label>
                <input type="text" name="" required value="${inHoaDon.khachhang}"/>
                <br/>

                <label  > Thoi Gian Thanh Toan: </label>
                <input type="text" name="" value="${inHoaDon.ngaythanhtoan}" />
                <br/>
                <table>
                    <tr>
                        <th>ten san pham </th>
                    </tr>
                </table>
<%--                <label for "color"> Favorite Color: </label>--%>
<%--                <input type="color" name="color"/>--%>
<%--                <br>--%>

<%--                <label for "comments"> Comments: </label>--%>
<%--                <textarea ="comments" rows="4" cols="40"></textarea>--%>
<%--                <br/>--%>

<%--                <input type="submit"/>--%>
            </form>

        </div>

    </div>


</div>


</body>
</html>