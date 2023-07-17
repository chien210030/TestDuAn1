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

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
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
            color: #eee;
            width: 220px;
        }

        .side-bar li a:hover,
        .side-bar li a:focus {
            background-color: #333;
        }

        .tmargin {
            margin-top: 15px;
        }


    </style>
</head>
<body>
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

<form action="${pageContext.request.contextPath}/add" method="post">
 <div class="mb-3 mt-3">
   <label> san pham </label>  <select name="sanpham">
         <c:forEach items="${sanPhams}" var="cb">
             <option value="${cb.id}">${cb.ten}</option>
         </c:forEach>
     </select>

 </div>
  <div class="mb-3 mt-3">
   <label> dong sp</label>   <select name="dongsp">
          <c:forEach items="${dongsanPhams}" var="cb">
              <option value="${cb.id}">${cb.ten}</option>
          </c:forEach>
      </select>

  </div>
    <div class="mb-3 mt-3">
     <label>chat lieu</label>   <select name="chatlieu">
            <c:forEach items="${chatlieus}" var="cb">
                <option value="${cb.id}">${cb.ten}</option>
            </c:forEach>
        </select>

    </div>
    <div class="mb-3 mt-3">
     <label>thuong hieu</label>   <select name="thuonghieu">
            <c:forEach items="${thuonghieus}" var="cb">
                <option value="${cb.id}">${cb.ten}</option>
            </c:forEach>
        </select>

    </div>
    <div class="mb-3 mt-3">
       <label>kich co</label> <select name="kichco">
            <c:forEach items="${kichcos}" var="cb">
                <option value="${cb.id}">${cb.ten}</option>
            </c:forEach>
        </select>
    </div>
    <div class="mb-3 mt-3">
       <label>mau sac</label> <select name="mausac">
            <c:forEach items="${mausacs}" var="cb">
                <option value="${cb.id}">${cb.ten}</option>
            </c:forEach>
        </select>

    </div>
    <div class="mb-3 mt-3">
      <label>nha san xuat</label>  <select name="nsx">
            <c:forEach items="${nsxs}" var="cb">
                <option value="${cb.id}">${cb.ten}</option>
            </c:forEach>
        </select>

    </div>
<%--    <div class="mb-3 mt-3">--%>
<%--        <label>id:</label>--%>
<%--        <input type="number"  class="form-control" placeholder="Enter id" name="id">--%>
<%--    </div>--%>

    <div class="mb-3 mt-3">
        <label >Mo Ta:</label>
        <input type="text" class="form-control"  placeholder="Enter mota" name="mota">
    </div>
    <div class="mb-3">
        <label>Gia Nhap:</label>
        <input type="number" class="form-control"   placeholder="Enter gianhap" name="gianhap">
    </div>
    <div class="mb-3">
        <label>Gia ban:</label>
        <input type="number" class="form-control"   placeholder="Enter giaban" name="giaban">
    </div>
    <div class="mb-3">
        <label>So Luong Ton:</label>
        <input type="number" class="form-control"   placeholder="Enter soluongton" name="soluongton">
    </div>
  <button type="submit">add</button>


</form>

</body>
</html>