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

        .topright:hover {color: red;}

    </style>
</head>
<body>
<jsp:include page="Templates/navbar.jsp"/>
<div class="container-fluid">
    <jsp:include page="Templates/aside.jsp"/>

    <div class="col-md-5">
<%--        --HOA DON CHO ----%>
        <div class="col-6 bmarin groove">
            <h4><b>HOA DON CHO</b></h4>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>Email</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>John</td>
                    <td>Doe</td>
                    <td>john@example.com</td>
                </tr>

                </tbody>
            </table>
        </div>
<%--    GIO HANG--%>
        <div class="col-6 bmarin groove">
            <h4><b>GIO HANG</b></h4>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>Email</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>John</td>
                    <td>Doe</td>
                    <td>john@example.com</td>
                </tr>

                </tbody>
            </table>
            <div class="row">
                <div class="col-custom">
                    <a class="btn btn-primary">Remove</a>
                </div>
                <div class="col-custom">
                    <a class="btn btn-primary">Update quantity</a>
                </div>
            </div>


        </div>

<%--    SAN PHAM--%>
        <div class="col-6 bmarin groove" >
            <h4><b>SAN PHAM</b></h4>
            <table class="table table-bordered">
              <span>Tim Kiem <input class="form-control-range"/>&#160&#160&#160<a class="btn btn-primary">Search</a></span>

                <div class="row">
                    <div class="col-custom">
                        <label>Loai SP:</label> <select name="">
                        <option value=""></option></select>
                    </div>
                    <div class="col-custom">
                        <label>MauSP :</label> <select name=""  >
                        <option value=""></option>
                    </select>
                    </div>
                    <div class="col-custom">
                        <label>Size :</label> <select name="">
                        <option value=""></option></select>
                    </div>

                    <div class="col-custom">
                        <label>Thuong Hieu :</label> <select name="">
                        <option value=""></option></select>
                    </div>
                    <div class="col-custom">
                        <label>NSX :</label> <select name="">
                        <option value=""></option></select>
                    </div>
                    <div class="col-custom">
                        <label>Chat Lieu:</label> <select name="">
                        <option value=""></option></select>
                    </div>

                </div>
                <thead>
                <tr>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>Email</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>John</td>
                    <td>Doe</td>
                    <td>john@example.com</td>
                </tr>

                </tbody>
            </table>
        </div>
<%--        END SAN PHAM--%>

    </div>
<%--   HOA DON VA KHACH HANG--%>
    <div class="col-md-4 animated bounce">
        <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'viewhoadon')" id="defaultOpen">Hoa Don</button>
            <button class="tablinks" onclick="openCity(event, 'viewkhachhang')">Khach Hang</button>
        </div>

        <div id="viewhoadon" class="tabcontent">

            <div class="form-group">
                <label>Ma HD</label><input class="form-control-range">

            </div>

            <div class="form-group">
                <label>Ngay Tao</label><input class="form-control">

            </div>
            <div class="form-group">
                <label>NV TT </label><input class="form-control">

            </div>
            <div class="form-group">
                <label>Ten Khach Hang</label><input class="form-control">

            </div>
            <div class="form-group">
                <label>Tien Khach Dua</label><input class="form-control-range">

            </div>
            <div class="form-group">
                <label>Tien Thua</label><input class="form-control">

            </div>
            <div class="form-group">
                <label>Tong Tien</label><input class="form-control">

            </div>


        </div>
        <div id="viewkhachhang" class="tabcontent">
            <div class="form-group">
                <label>Tim KH</label><input class="form-control-range">&#160&#160&#160<a class="btn btn-warning">Search</a>

            </div>
            <div class="form-group">
                <label>Ma KH</label><input class="form-control-range">&#160&#160&#160<a class="btn btn-warning">Add</a>

            </div>

            <div class="form-group">
                <label>Ten KH</label><input class="form-control">

            </div>
            <div class="form-group">
                <label>Dia Chi </label><input class="form-control">

            </div>
            <div class="form-group">
                <label>SDT </label><input class="form-control">

            </div>
            <div class="form-group">
                <label>Ngay Sinh</label><input class="form-control">

            </div>
        </div>

<%--        <div class="col-md-2" >--%>
<%--            &#160&#160--%>
<%--                <a class="btn btn-primary">Tao Hoa Don</a>--%>
<%--            &#160&#160--%>
<%--             <a class="btn btn-danger">Huy Don</a>--%>
<%--            &#160&#160--%>
<%--            <a class="btn btn-success">Thanh Toan</a>--%>
<%--        </div>--%>
<%--        <div class="col-md-2 " style="padding-left: 100px">--%>
<%--            MaKM--%>
<%--            <select name="" id="">--%>
<%--            <option value=""></option>--%>
<%--            </select>--%>

<%--        </div>--%>
        <div class="row" style="padding-top: 10px">
            <div class="col-custom" style="padding-top: 10px">
                <div class="col-4">

                    <a href="#" class="btn btn-primary">Tao Hoa Don</a>
                </div>
                &#160&#160&#160
                <div class="col-4">

                    <a href="#" class="btn btn-danger">Huy Don</a>
                </div>
                &#160&#160&#160
                <div class="col-4">
                    <a href="#" class="btn btn-success">Thanh Toan</a>

                </div>


            </div>

            <div class="col-custom">
               <label>Nhap MaKH</label><input class="">
            </div>
            <div class="col-custom">
             <label>MaKM</label>
                <select name="" >
                    <option value=""></option>
                </select>
            </div>
        </div>



    </div>



</div>
<script>
    function openCity(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();
</script>
</body>
</html>