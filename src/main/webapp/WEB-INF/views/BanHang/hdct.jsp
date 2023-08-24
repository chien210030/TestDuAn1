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
</head>
<body>
<table class="table table-bordered">
    <thead>
    <tr>
        <%--                    <th>Id Hoa Don CT</th>--%>
        <th>Ma Hoa Don</th>
        <th>san pham</th>
        <th>So luong</th>
        <th>Don Gia</th>

    </tr>
    </thead>
    <c:forEach items="${CTHoaDon}" var="chitiet">

        <tbody>
        <tr>
            <form method="post">

                <td>${chitiet.hoadon.ma}</td>
                <td> ${chitiet.chiTietSP.sanpham.ten}</td>
                    <%--                            <td> ${chitiet.soluong}</td>--%>
                <td><input type="number" id="idsoluong" min="1" max="100" name="soluong"
                           class="form-control-range" value="${chitiet.soluong}"></td>
                <td>${chitiet.dongia}</td>

                    <%--                            <td><button type="submit" id="idbutton" onclick="getsoluongupdate(${chitiet.id})" class="btn btn-primary glyphicon glyphicon-ok-circle"--%>
                    <%--                                        action="/banhang-hoadon/updateSoLuong?idhdct=" +${chitiet.id} + &soluong=99"--%>
                    <%--                                ></button>--%>
                    <%--                            </td>--%>
                <td>
                    <button type="submit" id="idbutton"
                            class="btn btn-primary glyphicon glyphicon-ok-circle"
                            formaction="/banhang-hoadon/updateSoLuong/${chitiet.id }"
                    ></button>
                </td>
            </form>
        </tr>
        </tbody>

    </c:forEach>
</table>
</body>
</html>