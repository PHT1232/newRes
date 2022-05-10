<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>Dashboard | Front - Admin &amp; Dashboard Template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="<c:url value="/resource/img/favicon.ico"></c:url>">
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="<c:url value="/resource/css/vendor.min.css"></c:url>">
    <link rel="stylesheet" href="<c:url value="/resource/css/style.css"></c:url>">
    <link rel="stylesheet" href="<c:url value="/resource/css/myStyle.css"></c:url>">
    <link rel="stylesheet" href="<c:url value="/resource/css/phong.css"></c:url>">


    <!-- CSS Front Template -->
    <link rel="stylesheet" href="<c:url value="/resource/css/theme.min.css?v=1.0"></c:url>">

    <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

    <script>
        tinymce.init({
            selector: '#mytextarea'
        });
    </script>
</head>

<body class="   footer-offset">
<script src="<c:url value="/resource/js/hs-navbar-vertical-aside-mini-cache.js"></c:url>"></script>
<jsp:include page="headerFrontend.jsp"></jsp:include>
<%--<div class="container">--%>
<%--    <nav class="js-mega-menu flex-grow-1 hs-menu-initialized hs-menu-horizontal">--%>
<%--        <!-- Navbar -->--%>
<%--        <div class="navbar-nav-wrap-navbar collapse navbar-collapse col-12" id="navbarNavMenu">--%>
<%--            <div class="navbar-body col-lg-12">--%>
<%--                <ul class="navbar-nav flex-grow-1 col-lg-12">--%>

<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link active" href="#">Lớp</a>--%>
<%--                    </li>--%>

<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <!-- End Navbar -->--%>
<%--    </nav>--%>
<%--</div>--%>
<%--</header>--%>
<script src="<c:url value="/resource/js/demo.js"></c:url>"></script>

<!-- END ONLY DEV -->

<!-- ========== MAIN CONTENT ========== -->
<!-- Navbar Vertical -->


<!-- End Navbar Vertical -->


<main id="content" role="main" class="main pointer-event">
    <c:if test="${success != null}">
        <h3 style="color: red">Thêm bài tập thành công</h3>
    </c:if>
    <form action="/projectAPI_war/uploadBaiTap" method="post" enctype="multipart/form-data">
        <div class="content container-fluid">
            <div class="card col-12" style="padding: 20px 15px!important;">
                <div class="row">
                    <div class="col-md-6">
                        <%--                        <div class="label">--%>
                        <%--                            Lớp: ${className}--%>
                        <%--                        </div>--%>
                        <%--                        <input type="text" value="${class}" name="classId" style="display: none;"/>--%>
                        <%--                            <input type="text" value="${username}" name="username" style="display: none;"/>--%>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="label">
                            Lớp:
                        </div>
                        <select name="classID" class="form-select">
                            <c:forEach var="classDT" items="${classesDT}">
                                <option value="${classDT.id}">${classDT.name}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <div class="col-md-6">
                        <div class="label">
                            Tên môn học:
                        </div>
                        <select name="monhocID" class="form-select">
                            <c:forEach var="subjectDT" items="${subjectsDT}">
                                <option value="${subjectDT.id}">${subjectDT.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="label">
                            Hạn nộp:
                        </div>
                        <input type="date" class="form-select" id="hanNop" name="deadline"/>
                    </div>
                    <div class="col-md-6">
                        <div class="label">
                            File:
                        </div>
                        <input type="file" name="files" class="btn btn-sm btn-white">
                        <div id="container">

                        </div>
                        <input id="btnNop" type="button"
                               style="width: 278px; margin-top: 15px; text-align: center; padding: 0px; height: 35px"
                               value="Thêm hoặc tạo +" class="btn btn-sm btn-white">
                    </div>
                </div>

                <div class="label">
                    Tên bài tập:
                </div>
                <input type="text" name="tenBaiTap" class="form-control">

                <div class="label">
                    Nội dung bài tập:
                </div>
                <textarea id="mytextarea" name="noiDungBaiTap">Hello, World!</textarea>

                <button type="submit" class="btn btn-primary save-btn">Tạo</button>
            </div>
        </div>
    </form>

    <!-- Footer -->

    <jsp:include page="footer.jsp"></jsp:include>
    <!-- End Footer -->
</main>

<!-- JS Implementing Plugins -->
<script src="<c:url value="/resource/js/vendor.min.js"></c:url>"></script>
<script src="<c:url value="/resource/js/theme.min.js"></c:url>"></script>
<script src="<c:url value="/resource/js/index.js"></c:url>"></script>
<script>
    $(document).ready(function () {
        var x = 1;
        var max_fields = 10;
        $('#btnNop').click(function (e) {
            var input = document.createElement("input");
            e.preventDefault();
            if (x < max_fields) {
                x++;
                input.type = "file";
                input.name = "files";
                input.className = "btn btn-sm btn-white";
                container.append(input);
            }
        });
    });
</script>
</body>

</html>