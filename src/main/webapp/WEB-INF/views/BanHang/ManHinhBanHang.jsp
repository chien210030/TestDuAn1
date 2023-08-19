<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.33/moment-timezone.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

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

    </style>
</head>
<body>
<jsp:include page="Templates/navbar.jsp"/>
<div class="container-fluid">
    <jsp:include page="Templates/aside.jsp"/>

    <div class="col-md-5">
        <%--        --HOA DON  ----%>
        <div class="col-6 bmarin groove">
            <h4><b>Hóa Đơn </b></h4>
            <form action="/banhang-hoadon" method="get">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Ma HD</th>
                        <th>Ngay Tao</th>
                        <th>Ten NV</th>
                        <th>Ten KH</th>
                        <th>Tong tien</th>
                        <th>Tien km</th>
                        <th>Tien Thanh Toan</th>
                        <th>Ngay Thanh Toan</th>
                        <th>Trang Thai</th>

                    </tr>
                    </thead>
                    <c:forEach items="${HoaDon}" var="i">
                        <tbody>
                        <tr>
                            <td>${i.ma}</td>
                            <td>
                                <fmt:formatDate value="${i.ngaytao}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                            <td>${i.nhanVien.ten}</td>
                            <td>${i.khachhang.ten}</td>
                            <td>${i.tongtien}</td>
                            <td>${i.tongtienkm}</td>
                            <td>${i.tongtientt}</td>
                            <td><fmt:formatDate value="${i.ngaythanhtoan}" pattern="dd/MM/yyyy "/>
                            </td>
                            <td>${i.trangthai == 1 ? 'Đã Thanh toán':'Chưa Thanh Toán'}</td>
                            <td><a class="btn btn-primary glyphicon glyphicon-pencil"
                                   href="/banhang-hoadon/gethoadon/${i.id}"></a></td>
                        </tr>

                        </tbody>
                    </c:forEach>
                </table>
            </form>
            <ul class="pagination">


                <li class="page-item"><a class="page-link" href="?pageNum=${1}">Previous</a></li>
                <c:forEach begin="1" end="${totalPages}" varStatus="status">
                    <li class="page-item"><a class="page-link" href="?pageNum=${status.index}">${status.index}</a></li>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="?pageNum=${totalPages}">Next</a></li>
            </ul>
        </div>
        <%--    GIO HANG--%>
        <div class="col-6 bmarin groove">
            <h4><b>Giỏ Hàng</b></h4>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Id Hoa Don CT</th>
                    <th>id Hoa Don</th>
                    <th>id ct sp</th>
                    <th>So luong</th>
                    <th>Don Gia</th>
                </tr>
                </thead>
                <c:forEach items="${CTHoaDon.hoaDonChiTiets}" var="chitiet">
                    <tbody>
                    <tr>
                          <td> ${chitiet.id}</td>
                          <td> ${chitiet.soluong}</td>
                          <td>${chitiet.dongia}</td>
                    </tr>
                    </tbody>
                </c:forEach>
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
        <div class="col-6 bmarin groove">
            <h4><b>Sản Phẩm</b></h4>
            <table class="table table-bordered table-hover">
                <span>Tim Kiem <input class="form-control-range"/>&#160&#160&#160<a
                        class="btn btn-primary">Search</a></span>

                <div class="row">
                    <div class="col-custom">

                        <label>Loai SP:</label>
                        <select name="">
                            <c:forEach items="${dongsp}" var="h">
                                <option value="${h.id}">${h.ten}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-custom">
                        <label>Size :</label>
                        <select name="">
                            <c:forEach items="${kichco}" var="h">
                                <option value="${h.id}">${h.ten}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-custom">
                        <label>Thuong Hieu :</label>
                        <select name="">
                            <c:forEach items="${thuonghieu}" var="h">
                                <option value="${h.id}">${h.ten}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <form action="/banhang-hoadon/banhang" method="get">

                    <thead>
                    <tr>
                        <th>Ma SP</th>
                        <th>Ten SP</th>
                        <th>Gia</th>
                        <th>So Luong</th>
                        <th>Mau</th>
                        <th>Chat Lieu</th>
                        <th>Mo Ta</th>
                        <th>So luong them</th>
                    </tr>
                    </thead>

                    <c:forEach items="${loadchitietsp}" var="d">
                        <tbody>
                        <tr>
                            <td>${d.sanpham.ma}</td>
                            <td>${d.sanpham.ten}</td>
                            <td>${d.giaban}</td>
                            <td>${d.soluongton}</td>
                            <td>${d.mausac.ten}</td>
                            <td>${d.chatlieu.ten}</td>
                            <td>${d.mota}</td>
                            <td><input type="number" name="soluong" value="1" min="1" class="form-control"></td>
                            <td>
                                <button onclick="reloadpage();" formmethod="post"
                                        formaction="/banhang-hoadon/add/${d.id}"
                                        class="btn btn-primary glyphicon glyphicon-shopping-cart"
                                        type="submit"></button>
                            </td>
                        </tr>

                        </tbody>

                    </c:forEach>
                </form>
            </table>
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="?pageNum=${1}">Previous</a></li>
                <c:forEach begin="1" end="${chitietPages}" varStatus="status">
                    <li class="page-item"><a class="page-link" href="?pageNum=${status.index}">${status.index}</a></li>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="?pageNum=${chitietPages}">Next</a></li>
            </ul>

        </div>
        <%--        END SAN PHAM--%>

    </div>
    <%--   HOA DON VA KHACH HANG--%>
    <div class="col-md-4 animated bounce">
        <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'viewhoadon')" id="defaultOpen">Hoa Don</button>
            <button class="tablinks" onclick="openCity(event, 'viewkhachhang')">Khach Hang</button>
        </div>
        <%--            PHAN TẠO HÓA ĐƠN --%>
        <div id="viewhoadon" class="tabcontent">
            <form action="/taohoadon" method="post" id="hoaDonForm">
                <div class="form-group">
                    <label>Ma HD</label><input type="hidden" class="form-control-range" name="ma">

                </div>
                <div class="form-group">
                    <label>Ngay Tao</label><input type="datetime-local" id="ngaytao" class="form-control"
                                                  name="ngaytao">

                </div>
                <div class="form-group">
                    <label>NV TT </label>
                    <select name="nhanvien" class="form-control">
                        <c:forEach items="${nhanvien}" var="v">
                            <option value="${v.id}">${v.ten}</option>
                        </c:forEach>
                    </select>

                </div>
                <div class="form-group">
                    <label>Ten Khach Hang</label><input class="form-control" name="khachhang.ten">

                </div>
                <div class="form-group">
                    <label>Trạng Thái :</label> <input type="radio" name="trangthai" value="1">Đã Thanh Toán
                    <input type="radio" name="trangthai" value="0" checked>Chưa Thanh Toán

                </div>

                <div class="form-group">
                    <label>Tong Tien Hang </label><input class="form-control" name="tongtien">

                </div>
                <div class="form-group">
                    <label>Tien khuyen mai</label><input class="form-control" name="tongtienkm">

                </div>

                <div class="form-group">
                    <label> Tong Tien Thanh Toan</label><input class="form-control-range" name="tongtientt">

                </div>
                <div class="form-group">
                    <label>Khach Thanh Toan</label><input class="form-control-range" name="tienkhachhangtra">

                </div>

                <%--                <button type="submit"> add</button>--%>

            </form>
        </div>

        <%--     END  TẠO HÓA ĐƠN --%>
        <div id="viewkhachhang" class="tabcontent">
            <div class="form-group">
                <label>Tim KH</label><input class="form-control-range">&#160&#160&#160<a
                    class="btn btn-warning">Search</a>

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
        <div class="row" style="padding-top: 10px">
            <div class="col-custom" style="padding-top: 10px">
                <div class="col-4">

                    <button class="btn btn-primary" id="btnThemHoaDon">Tao Hoa Don</button>
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
                <a class="btn btn-primary" href="">Check</a>
            </div>
            <div class="col-custom">
                <label>MaKM</label>
                <select name="">
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
    //lấy ngày và giờ hiện tại
    // document.getElementById("ngaytao").value = new Date().toISOString().slice(0,10);
    // Đặt múi giờ mặc định là "Asia/Ho_Chi_Minh" (múi giờ Việt Nam - GMT+7)
    moment.tz.setDefault("Asia/Ho_Chi_Minh");

    // Lấy ngày và giờ hiện tại theo múi giờ đã đặt
    let nowInVietnam = moment().format("YYYY-MM-DDTHH:mm");

    // Gán giá trị vào trường input "ngaytao"
    document.getElementById("ngaytao").value = nowInVietnam;

    // nút button
    document.getElementById('btnThemHoaDon').addEventListener('click', function (event) {
        event.preventDefault();

        var formData = new FormData(document.getElementById('hoaDonForm'));
        axios.post("/banhang-hoadon/taohoadon", formData)
            .then(function (reponse) {
                alert("tạo hóa đơn thành công!");
                window.location.reload();

            }).catch(function (error) {
            alert("ko tao duoc hoa don");
        });

    });

    function reloadpage() {

        location.reload();
    }


</script>


</body>
</html>