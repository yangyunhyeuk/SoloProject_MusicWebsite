<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- Google font -->
    <link
            href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CMuli:400,700"
            rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet"
          href="/resources/css/bootstrap.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/resources/icon/favicon.ico">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="/resources/css/style.css"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


    <title>Callie HTML Template</title>
    <!-- jQuery Plugins -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.stellar.min.js"></script>
    <script src="/resources/js/main.js"></script>


    <!-- my css -->
    <link type="text/css" rel="stylesheet" href="/resources/css/writepost.css"/>
    <!-- my js -->
    <script>
        $(document).ready(function () {
            $('#bcontent').on('keyup', function () {
                $('#bcontent_cnt').html("(" + $(this).val().length + " / 200)");

                if ($(this).val().length > 200) {
                    $(this).val($(this).val().substring(0, 200));
                    $('#bcontent_cnt').html("(200 / 200)");
                }
            });
        });
        $(document).ready(function () {
            $('#btitle').on('keyup', function () {
                $('#btitle_cnt').html("(" + $(this).val().length + " / 20)");

                if ($(this).val().length > 20) {
                    $(this).val($(this).val().substring(0, 20));
                    $('#btitle_cnt').html("(20 / 20)");
                }
            });
        });
    </script>

</head>

<body>


<!-- HEADER -->
<header id="header">
    <!-- NAV -->
    <div id="nav">
        <!-- Top Nav -->
        <div id="nav-top">
            <div class="container" style="padding: 10px;">
                <mytag:logo />
                <!-- signin&signup -->
                <c:choose>
                    <c:when test="${empty mid}">
                        <ul class="nav-social" style="float: right !important;">
                            <li><a href="/signin" class="secondary-button">Login</a></li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="nav-social" style="float: right !important;">
                            <li><a href="/logout" class="secondary-button">Logout</a></li>
                            <li><a href="/myconcern" class="secondary-button">myPage</a></li>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <!-- /Top Nav -->
        <!-- Main Nav -->
        <div id="nav-bottom">
            <div class="container">
                <!-- nav -->
                <ul class="nav-menu">
                    <li><a href="/napster">Artist 20</a></li>
                    <li><a href="/lastfm">Artist 50</a></li>
                    <li><a href="/audius">Track 100</a></li>
                    <li><a href="/board/list">POST</a></li>
                    <li><a href="/contact">Contact</a></li>
                </ul>
                <!-- /nav -->
            </div>
        </div>
        <!-- /Main Nav -->
    </div>
    <!-- /NAV -->
</header>
<!-- /HEADER -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div id="writepost" class="row">


            <div class="section-title">
                <h2 class="title">게시글 작성하기</h2>
            </div>
             <form action="/board/write" method="post" name="form1" enctype="multipart/form-data" accept-charset="UTF-8">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <input class="input" type="text" id="btitle" name="btitle" placeholder="게시글 제목" required>
                            <div id="btitle_cnt">(0 / 20)</div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <input type="file" value="파일 선택" id="filename" name="filename"/>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <input id="bwriter" class="input" type="hidden" name="bwriter" value="admin"
                                   placeholder="작성자">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <textarea id="bcontent" name="bcontent" cols="30" rows="10" class="input"
                                      placeholder="게시글 내용" style=" height: 400px;resize: none;" required></textarea>
                            <div id="bcontent_cnt">(0 / 200)</div>
                        </div>
                                                <input type="submit" class="primary-button" value="작성하기" />
                    </div>
                </div>
                            </form>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<mytag:footer />

</body>

</html>
