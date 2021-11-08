<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CMuli:400,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="/resources/css/bootstrap.min.css"/>

    <!-- Favicon -->
    <link rel="shortcut icon" href="/resources/icon/favicon.ico">

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="/resources/css/style.css"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <title>JAMON</title>
    <!-- jQuery Plugins -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.stellar.min.js"></script>
    <script src="/resources/js/main.js"></script>


    <!-- my js -->
    <script src="/resources/js/lastfm.js"></script>

    <!-- my css -->
    <link type="text/css" rel="stylesheet" href="/resources/css/lastfm.css"/>


</head>

<body>


<!-- HEADER -->
<header id="header">
    <!-- NAV -->
    <div id="nav">
        <!-- Top Nav -->
        <div id="nav-top">
            <div class="container" style="padding: 10px;">
                <!-- logo -->
                <div class="nav-logo">
                    <a href="/main" class="logo"><img src="/resources/img/logo.png" alt=""></a>
                </div>
                <!-- /logo -->
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

<br>
<br>
<br>
<br>
<h1 style="text-align: center; font-variant: small-caps; font-size: 60px;">Artists 50 LastFM</h1>
<br>
<br>
<br>
<br>
<section>
    <script>
        const section = document.querySelector('section');
    </script>
</section>
<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">

    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<mytag:footer />


</body>

</html>
