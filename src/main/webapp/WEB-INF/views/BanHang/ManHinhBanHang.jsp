<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Du An Ban Quan Ao</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.33/moment-timezone.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js" crossorigin=""></script>

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
        <div  class="col-6 bmarin groove">
            <h4><b>Hóa Đơn </b></h4>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Ma HD</th>
                    <th>Ngay Tao</th>
                    <th>Ten KH</th>
                    <th>Tong tien</th>
                    <th>Trang Thai</th>
                </tr>
                </thead>
                <c:forEach items="${HoaDon}" var="i">


                    <c:if test="${i.trangthai==0}">


                        <tbody>
                        <tr>
                            <form action="/banhang-hoadon/gethoadon/${i.id}" method="get">

                                <td>${i.ma}</td>
                                <td>
                                    <fmt:formatDate value="${i.ngaytao}" pattern="dd/MM/yyyy HH:mm:ss"/></td>
                                    <%--                                <td>${i.nhanVien.ten}</td>--%>
                                <td>${i.khachhang.ten}</td>
                                <td>${i.tongtien}</td>
                                    <%--                                <td>${i.tongtienkm}</td>--%>
                                    <%--                                <td>${i.tongtientt}</td>--%>
                                    <%--                                <td><fmt:formatDate value="${i.ngaythanhtoan}" pattern="dd/MM/yyyy "/>--%>
                                    <%--                                </td>--%>
                                <td>${i.trangthai == 0 ? 'Chưa Thanh toán':''}</td>
                                <td><a class="btn btn-primary glyphicon glyphicon-pencil"
                                       href="/banhang-hoadon/gethoadon/${i.id}"></a></td>
                            </form>
                        </tr>

                        </tbody>
                    </c:if>
                </c:forEach>
            </table>
            <div class="col-4">
                <button type="submit" formaction="/banhang-hoadon/taohoadon" formmethod="post "
                        class="btn btn-primary" id="btnThemHoaDon">Tao Hoa Don
                </button>
            </div>

            <ul class="pagination">


                <li class="page-item"><a class="page-link" href="?pageNum=${1}">Previous</a></li>
                <c:forEach begin="1" end="${totalPages}" varStatus="status">
                    <li class="page-item"><a class="page-link" href="?pageNum=${status.index}">${status.index}</a></li>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="?pageNum=${totalPages}">Next</a></li>
            </ul>
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
                        <%--                        <th>So luong them</th>--%>
                    </tr>
                    </thead>

                    <c:forEach items="${loadchitietsp}" var="d" varStatus="loop">
                        <tbody>
                        <tr>
                            <td>${d.sanpham.ma}</td>
                            <td>${d.sanpham.ten}</td>
                            <td>${d.giaban}</td>
                            <td>${d.soluongton}</td>
                            <td>${d.mausac.ten}</td>
                            <td>${d.chatlieu.ten}</td>
                            <td>${d.mota}</td>
                                <%--                            <td><input type="number" name="soluong" value="1" min="1" class="form-control"></td>--%>
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
                <li class="page-item"><a class="page-link" href="?pageNumCT=${1}">Previous</a></li>
                <c:forEach begin="1" end="${chitietPages}" varStatus="status">
                    <li class="page-item"><a class="page-link" href="?pageNumCT=${status.index}">${status.index}</a>
                    </li>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="?pageNumCT=${chitietPages}">Next</a></li>
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
            <form action="#" method="post" id="hoaDonForm">
                <div class="form-group">

                    <label>Ma HD</label><input type="text" class="readonly-input form-control" name="ma"
                                               style="color: red"
                                               value="${HoaDonTo.ma}" readonly>

                </div>
                <div class="form-group">
                    <label>Ngay Tao</label>
                    <%--                    <input type="text"   class="form-control"--%>
                    <%--                                                  name="ngaytao" value="${HoaDonTo.ngaytao}">--%>
                    <fmt:formatDate value="${HoaDonTo.ngaytao}" pattern="dd/MM/yyyy hh:mm:ss" var="formattedNgayTao"/>
                    <input class="readonly-input form-control" type="text" value="${formattedNgayTao}" readonly/>
                </div>


                <div class="form-group">
                    <label>Ten Khach Hang</label><input class=" form-control" name="khachhang.ten"
                                                        value="${HoaDonTo.khachhang.tendem} ${HoaDonTo.khachhang.ten}">

                </div>

                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>san pham</th>
                        <th>So luong</th>
                        <th>Don Gia</th>

                    </tr>
                    </thead>
                    <c:forEach items="${CTHoaDon}" var="chitiet">

                        <tbody>
                        <tr>
                            <form action="#" method="post" id="ChiTietHoaDonForm">
                                <td> ${chitiet.chiTietSP.sanpham.ten}</td>
                                <td><input type="number" min="0" max="${chitiet.chiTietSP.soluongton} + 1"
                                           name="soluong"
                                           class="form-control-range" value="${chitiet.soluong}" id="">
                                </td>
                                <td>${chitiet.dongia}</td>
                                <td>
                                    <button type="submit" id="idbutton"
                                            formmethod="post"
                                            class="btn btn-primary glyphicon glyphicon-plus"
                                            formaction="/banhang-hoadon/updateSoLuong/${chitiet.id }"
                                    ></button>
                                </td>
                                <td>
                                    <button type="submit" formmethod="post"
                                            formaction="/banhang-hoadon/XoaSanPham/${chitiet.id}"
                                            class="btn btn-danger glyphicon glyphicon-trash"
                                            onclick="return confirm('bạn có muốn xóa sản phẩm')"></button>
                                </td>
                            </form>
                        </tr>
                        </tbody>
                    </c:forEach>
                </table>
                <%--            </c:if>--%>
                <c:if test="${empty CTHoaDon}">
                    <p style="font-family:'Segoe UI Black'">Không có sản phẩm trong giỏ.</p>
                </c:if>
                <div class="form-group">
                    <label>Tong Tien Hang </label><input class="readonly-input form-control" readonly name="tongtien"
                                                         value="${HoaDonTo.tongtien}">

                </div>
                <div class="form-group">
                    <label>Tien khuyen mai</label><input class="readonly-input form-control tienkhuyenmai"
                                                         readonly name="tongtienkm"
                                                         value="${HoaDonTo.tongtienkm}" id="tienkhuyenmai">

                </div>

                <div class="form-group">
                    <label> Tong Tien Thanh Toan</label><input type="number" class="form-control tongtientt"
                                                               readonly
                                                               name="tongtientt"
                                                               value="${HoaDonTo.tongtientt}" id="tongTienThanhToan">

                </div>
                <div class="form-group">
                    <label>Khach Thanh Toan</label>
                    <input type="number" class="form-control-range" name="tienkhachhangtra"
                           value="${HoaDonTo.tienkhachhangtra}">

                    <c:if test="${ empty tienkhachhangtra}">
                        <label>${loiTienKhach}</label>

                    </c:if>
                </div>

                <%--                <button type="submit"> add</button>--%>

            </form>
        </div>

        <%--     END  TẠO HÓA ĐƠN --%>
        <div id="viewkhachhang" class="tabcontent">
            <form method="post" id="khachHangForm">
                <div class="form-group">
                    <label>Tim KH</label><input class="form-control-range">&#160&#160&#160<a
                        class="btn btn-warning">Search</a>

                </div>
                <div class="form-group">


                    <label>Ma KH</label><input name="${HoaDonTo.khachhang.ma}" class="readonly-input form-control-range"
                                               readonly>&#160&#160&#160


                </div>

                <div class="form-group">
                    <label>Ten KH</label><input name="ten" class="form-control" value="${HoaDonTo.khachhang.ten}">

                </div>
                <div class="form-group">


                    <label>Ten dem</label><input name="tendem" class=" form-control"
                                                 value="${HoaDonTo.khachhang.tendem}">
                </div>
                <div class="form-group">

                    <label>SDT </label><input type="number" name="sdt" class="form-control"
                                              value="${HoaDonTo.khachhang.sdt}">

                </div>


                <%--                <div class="form-group">--%>
                <%--                    <fmt:formatDate value="${HoaDonTo.khachhang.ngaysinh}" pattern="dd/MM/yyyy"--%>
                <%--                                    var="formattedNgaySinh"/>--%>


                <%--                    <label>Ngay Sinh</label><input type="date" name="ngaysinh" class="form-control"--%>
                <%--                                                   value="${formattedNgaySinh}">--%>
                <%--                </div>--%>
                <div class="form-group">

                    <button type="submit" formmethod="post" formaction="/banhang-hoadon/themkhachhang"
                            class="btn btn-warning" id="btnThemKH">them
                    </button>


                </div>

            </form>
        </div>
        <div class="row" style="padding-top: 10px">
            <div class="col-custom" style="padding-top: 10px">

                &#160&#160&#160
                <div class="col-4">
                    <%--                    <button type="submit" id="HuyDonBtn" formmethod="post" class="btn btn-danger"--%>
                    <%--                            formaction="/banhang-hoadon/huydon"--%>
                    <%--                            onclick="return confirm('Bạn có muốn hủy hóa đơn này không')">Huy Don--%>
                    <%--                    </button>--%>
                    <%--                </div>--%>
                    &#160&#160&#160
                    <%--                <div class="col-4">--%>
                    <button type="submit" formmethod="post" formaction="/banhang-hoadon/thanhtoan"
                            id="btnThanhToanHoaDon"
                            class="btn btn-success">Thanh Toan
                    </button>

                </div>


            </div>

            <%--            <div class="col-custom">--%>
            <%--                <label>Nhap MaKH</label><input class="">--%>
            <%--                <a class="btn btn-primary" href="">Check</a>--%>
            <%--            </div>--%>
            <div class="col-custom">
                <label>Chọn MaKM</label>
                <select class="form-control" id="khuyenmai" name="">
                    <c:forEach items="${khuyenmai}" var="khuyenmai">
                        <c:if test="${khuyenmai.trangthai == 1}">
                            <option value="${khuyenmai.giatrigiam}">${khuyenmai.giatrigiam} %</option>
                        </c:if>
                    </c:forEach>
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

        //khuyenmai Mạnh
        if (cityName === 'viewhoadon') {
            // Xử lý sự kiện thay đổi Combobox Mã Khuyến Mãi
            document.getElementById('khuyenmai').addEventListener('change', function () {
                var selectedOption = this.options[this.selectedIndex];
                var discountPercentage = parseFloat(selectedOption.value); // Phần trăm giảm giá
                console.log("Giá trị phần trăm khuyến mãi: " + discountPercentage);

                var originalPrice = parseFloat("${HoaDonTo.tongtien}"); // Tổng giá trị ban đầu từ biến JSP

                var discountAmount = (discountPercentage / 100) * originalPrice;
                var finalPrice = originalPrice - discountAmount;


                // Sử dụng lớp CSS để xác định các phần tử cần cập nhật
                var tienKhuyenMaiInput = document.querySelector('.tienkhuyenmai');
                var tongTienThanhToanInput = document.querySelector('.tongtientt');

                tienKhuyenMaiInput.value = discountAmount;
                tongTienThanhToanInput.value = finalPrice;
            });

            document.getElementById('tienKhuyenMai').textContent = discountAmount;
            document.getElementById('tongTienThanhToan').textContent = finalPrice;

        }
    }

    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();
    // //lấy ngày và giờ hiện tại
    // // document.getElementById("ngaytao").value = new Date().toISOString().slice(0,10);
    // // Đặt múi giờ mặc định là "Asia/Ho_Chi_Minh" (múi giờ Việt Nam - GMT+7)
    // moment.tz.setDefault("Asia/Ho_Chi_Minh");
    //
    // // Lấy ngày và giờ hiện tại theo múi giờ đã đặt
    // let nowInVietnam = moment().format("YYYY-MM-DDTHH:mm");
    //
    // // Gán giá trị vào trường input "ngaytao"
    // document.getElementById("ngaytao").value = nowInVietnam;

    // nút button
    document.getElementById('btnThemHoaDon').addEventListener('click', function (event) {
        event.preventDefault();

        var formData = new FormData(document.getElementById('hoaDonForm'));
        axios.post("/banhang-hoadon/taohoadon", formData)
            .then(function (response) {
                alert(response.data); // Display the response message
                window.location.reload();

            }).catch(function (error) {
            alert("Không tạo được hóa đơn: " + error.response.data); // Display the error message
        });
    });

    // validate them KH
    document.getElementById('btnThemKH').addEventListener('click', function (event) {
        event.preventDefault();
        var ten = document.getElementsByName('ten')[0].value;
        var tendem = document.getElementsByName('tendem')[0].value;

        var sdtElement = document.getElementsByName('sdt')[0];
        // var sdt = sdtElement ? parseInt(sdtElement.value) : NaN
        var sdt = sdtElement.value;
        const regex = /^[0-9]{10}$/;
        if (ten === null || ten === "") {
            alert("hay nhap du ten");
            return;
        } else if (tendem === null || tendem === "") {
            alert("hay nhap du ten dem");
            return;
        } else if (sdt !== "" && (!regex.test(sdt) || parseInt(sdt) < 0)) {
            alert("so dien thoai khong hop le");
            return;
        }
        var KHform = new FormData(document.getElementById('khachHangForm'));
        axios.post("/banhang-hoadon/themkhachhang", KHform)
            .then(function (reponse) {
                alert("da them khach hang!");
                window.location.reload();

            }).catch(function (error) {
            alert(" that bai");
        });

    });
    //huy don
    // document.getElementById('HuyDonBtn').addEventListener('click', function (event) {
    //     event.preventDefault();
    //     var formData = new FormData(document.getElementById('hoaDonForm'));
    //     axios.post("/banhang-hoadon/huydon", formData)
    //         .then(function (respone) {
    //             alert("Hủy Hóa đơn Thành Công");
    //             window.location.reload();
    //         }).catch(function (error) {
    //         alert("that bai");
    //     });
    // });

    //validate thanh toan
    //thanh toan
    document.getElementById('btnThanhToanHoaDon').addEventListener('click', function (event) {
        event.preventDefault();
        var tienKhachTra = document.getElementsByName('tienkhachhangtra')[0].value;
        var khachtra = tienKhachTra ? parseFloat(tienKhachTra.value) : NaN;

        var tongtienElement = document.getElementById('tongTienThanhToan');
        var tongtien = tongtienElement ? parseFloat(tongtienElement.value) : NaN;

        var tenkhach = document.getElementsByName('khachhang.ten')[0].value;
        // var tenkhachinput = tenkhach.value;
        console.log("cons" + tongtien);
        console.log("khach tra " + tienKhachTra);
        if (tenkhach === "" || tenkhach === null) {
            alert("ten khach đang trống");
            return;
        } else if (tienKhachTra === null || tienKhachTra === "") {
            alert("vui long nhap so tien khach hang ");
            return;
        } else if (isNaN(tienKhachTra) || tienKhachTra < 0) {
            alert("số tiền khách trả phải hợp lệ");
            return;
        } else if (isNaN(tongtien) || tienKhachTra < tongtien) {
            alert("tien khach tra phai lon hon tong tien");
            return;
        }

        var formData = new FormData(document.getElementById('hoaDonForm'));
        axios.post("/banhang-hoadon/thanhtoan", formData)
            .then(function (reponse) {
                alert("thanh toan thành công!");
                window.location.reload();

            }).catch(function (error) {
            alert("thanh toan that bai");
        });

    });
    // RemoveALL
    // document.getElementById('RemoveAll').addEventListener('click', function (event) {
    //     event.preventDefault();
    //
    //     var formData = new FormData(document.getElementById('ChiTietHoaDonForm'));
    //     axios.post("/banhang-hoadon/removeall ", formData)
    //         .then(function (reponse) {
    //             alert(" Đã xóa sản phẩm!");
    //             window.location.reload();
    //
    //         }).catch(function (error) {
    //         alert("xóa sản phẩm thất bại");
    //     });
    //
    // });

    window.addEventListener('load', function () {
        var inputElements = document.querySelectorAll('input[data-soluongton]');

        inputElements.forEach(function (input) {
            var soluongton = parent(input.getAttribute('data-soluongton'));
            input.max = soluongton.toString();

        });

    });

    function reloadpage() {

        location.reload();
    }

    // function getsoluongupdate(idhdct) {
    //     let id = idhdct.toString();
    //
    //     let soluong = document.getElementById("idsoluong").value;
    //     let sl = soluong.toString();
    //     document.getElementById("idbutton").formaction = "/banhang-hoadon/updateSoLuong?id=" + id + "&soluong=" + sl;
    //     // document.getElementById("idform").action= "/banhang-hoadon/updateSoLuong/id=" + idhdct;
    //
    //
    // }


</script>


</body>
</html>