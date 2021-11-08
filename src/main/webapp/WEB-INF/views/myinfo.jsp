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
    <link
            href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CMuli:400,700"
            rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet"
          href="/resources/css/bootstrap.min.css"/>

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
    <script src="/resources/js/myinfo.js"></script>

    <!-- my css -->
    <link type="text/css" rel="stylesheet" href="/resources/css/myinfo.css"/>



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
        <div class="row">


            <div id="secmedia" class="col-md-8">
                <!-- row -->
                <div id="myinfo" class="row" style="margin: auto; width: 60%;">
                    <div class="col-md-12">
                        <div class="section-title">
                            <h2 class="title">MY INFO</h2>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-12">
                            <div>
                                <p>ID</p>
                            </div>
                            <div>
                                <input class="input" type="text" id="mid" name="mid" value="" readonly/>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <div>
                                <p>PASSWORD</p>
                            </div>
                            <div>
                                <input class="input" type="text" id="mpw" name="mpw" value=""/>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <div>
                                <p>PW CHECK</p>
                            </div>
                            <div>
                                <input class="input" type="text" id="rempw" name="rempw" value=""/>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <div>
                                <p>NICKNAME</p>
                            </div>
                            <div>
                                <input class="input" type="text" id="mnickname" name="mnickname" value=""/>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <div>
                                <p>PHONE</p>
                            </div>
                            <div>
                                <input class="input" type="text" id="mphone" name="mphone" value=""/>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <div>
                                <p>EMAIL</p>
                            </div>
                            <div>
                                <input class="input" type="text" id="memail" name="memail" value=""/>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <div>
                                <p>ADDRESS</p>
                            </div>
                            <div>
                                <input class="input" type="text" id="maddress" name="maddress" value="" readonly/>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="col-md-12">
                            <div>
                                <a href="javascript:;" class="secondary-button" onclick="editMyinfo()">수정하기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /row -->

            </div>


            <div class="col-md-4">


                <!-- category widget -->
                <div class="aside-widget">
                    <div class="section-title">
                        <h2 class="title">Categories</h2>
                    </div>
                    <div class="category-widget">
                        <ul>
                            <li><a href="/myconcern">관심게시글 보기</a></li>
                            <li><a href="/myinfo">내 정보 변경</a></li>
                            <li><a href="javascript:;" onclick="check()">회원탈퇴</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /category widget -->


            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<mytag:footer />


</body>

</html>
