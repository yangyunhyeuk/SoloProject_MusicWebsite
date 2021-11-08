<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags" %>
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


    <title>Callie HTML Template</title>
    <!-- jQuery Plugins -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.stellar.min.js"></script>
    <script src="/resources/js/main.js"></script>

    <!-- my js -->
    <script src="/resources/js/signin.js"></script>

    <!-- my css -->
    <link type="text/css" rel="stylesheet" href="/resources/css/signin.css"/>

    <script>
        /* eye js*/
        $(document).ready(function () {
            $('.form-group i').on('click', function () {
                $('input').toggleClass('active');
                if ($('input').hasClass('active')) {
                    $(this).attr('class', "fa fa-eye-slash fa-lg")
                        .prev('input').attr('type', "text");
                } else {
                    $(this).attr('class', "fa fa-eye fa-lg")
                        .prev('input').attr('type', 'password');
                }
            });
        });
    </script>
</head>

<body>


<!-- HEADER -->
<header id="header">
    <!-- Top Nav -->
    <div id="nav-top">
        <div class="container">
            <mytag:logo/>

        </div>
    </div>
    <!-- /Top Nav -->
</header>
<!-- /HEADER -->
<br>
<br>
<br>
<br>
<br>
<br>
<!-- SECTION -->
<div id="secmedia" class="section">
    <!-- container -->
    <div class="container">

        <!-- row -->
        <div class="row">
            <div class="section-title">
                <h2 class="title">Login</h2>
            </div>


            <div id="signin" class="row" style="margin: auto; width: 30%;">

                <div class="col-md-12">
                    <div class="form-group">
                        <input id="mid" class="input" type="text" name="mid"
                               onkeyup="e => { if (e.keyCode === 13) idCheck(); }"
                               placeholder="<spring:message code="message.login.id" />">
                    </div>
                </div>


                <div class="col-md-12">
                    <div class="form-group">
                        <input id="mpw" class="input" type="password" name="mpw"
                               onkeyup="e => { if (e.keyCode === 13) idCheck(); }"
                               placeholder="<spring:message code="message.login.password" />">
                        <i class="fa fa-eye fa-lg"></i>
                    </div>
                </div>


                <div class="section-row">
                    <a href="javascript:;" onclick="idCheck()" name="idCheck" id="idCheck"
                       class="secondary-button"><spring:message
                            code="message.login.login"/></a>
                </div>


                <div class="section-row">
                    <a href="/sendPW" class="find_text">Forgot password?</a>

                </div>


                <br> <br> <br>

                <div class="col-md-12">
                    <div class="category-widget">
                        <ul>
                            <li><a href="/signup"><spring:message code="message.login.gosignup"/></a></li>
                        </ul>
                    </div>
                </div>


                <br> <br> <br>

            </div>

        </div>
        <!-- /row -->


    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<mytag:footer/>

</body>

</html>
