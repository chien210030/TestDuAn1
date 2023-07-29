<div class="col-md-3">

    <div id="sidebar">
        <div class="container-fluid tmargin">
            <%--                <form action="#" class="search-wrap"></form>--%>
            <div class="input-group">
                <input type="search" class="form-control" placeholder="Search..."/>
                <span class="input-group-btn">
              <button class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
          </span>
            </div>
        </div>

        <ul class="nav navbar-nav side-bar">
            <li class="side-bar tmargin"><a href="/banhang-hoadon"><span class="glyphicon glyphicon-shopping-cart">&nbsp;</span>Ban Hang</a></li>
            <li class="side-bar"><a class = "tesst1" href="${pageContext.request.contextPath}/loadsp">
                <span class="glyphicon glyphicon-list">&nbsp;</span>Products
            </a>
                <div class = "test">
                    <div>
                        <a href="${pageContext.request.contextPath}/san-pham" class="title">San Pham</a>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/loadDongSP" class="title">Dong San Pham</a>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/loadchatlieu" class="title">Chat Lieu </a>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/loadkichco" class="title">Kich Co</a>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/loadMauSac" class="title">Mau Sac</a>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/loadThuongHieu" class="title">Thuong Hieu </a>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/loadNSX" class="title">Nha San Xuat</a>
                    </div>


                </div>



            </li>
            <li class="side-bar"><a href="/nhan-vien-chuc-vu/hien-thi"><span class="glyphicon glyphicon-flag">&nbsp;</span>NhanVien</a></li>
            <li class="side-bar"><a href="/khach-hang/hien-thi"><span class="glyphicon glyphicon-star">&nbsp;</span>KhachHang</a></li>
            <li class="side-bar">
                <a href="/ca/hien-thi"><span class="glyphicon glyphicon-certificate">&nbsp;</span>GiaoCa</a></li>

            <li class="side-bar"><a href="#"><span class="glyphicon glyphicon-signal">&nbsp;</span>Statistics</a>
            </li>
            <li class="side-bar"><a href="#"><span class="glyphicon glyphicon-cog">&nbsp;</span>Settings</a></li>

        </ul>
    </div>
</div>