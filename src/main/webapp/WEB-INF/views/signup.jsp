<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

    <title>Callie HTML Template</title>
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.stellar.min.js"></script>
    <script src="/resources/js/main.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


    <!-- my js -->
    <script src="/resources/js/signup.js"></script>

    <!-- my css -->
    <link type="text/css" rel="stylesheet" href="/resources/css/signup.css"/>

    <script type="text/javascript">
        function checkID() {
            let mid = $('#mid').val();
            $.ajax({
                type: 'GET',
                url: "/checkId",
                data: {
                    'mid': mid
                },
                success: function (result) {
                    console.log(result);

                    let idRegExp = /^[a-zA-z0-9]{4,12}$/; //????????? ????????? ??????

                    //????????? ???????????????
                    if (!idRegExp.test($("#mid").val())) {
                        alert("???????????? ?????? ??????????????? ?????? 4~12????????? ??????????????????");
                        $("#mid").val("");
                        $("#mid").focus();
                    } else if ($("#mid").val() == 'admin') {
                        alert("????????? ??? ?????? ??????????????????");
                        $('#mid').val('');
                        $("#mid").focus();
                    } else if (result == 'fail') {
                        alert("?????? ???????????? ??????????????????");
                        $('#mid').val('');
                        $("#mid").focus();
                    } else {
                        if ($('#mid').val() == "") {
                            alert("???????????? ???????????????");
                            $("#mid").focus();
                        } else {
                            $('#checkID').attr('name', 'true');
                            alert("??????????????? ??????????????????");
                        }
                    }

                }
            })
        }

        /*  eye js */
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
           <mytag:logo />
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
                <h2 class="title">Join</h2>
            </div>


            <div id="signup" class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <input class="input" type="text" id="mid" name="mid"
                               placeholder="<spring:message code="message.login.id" />">
                    </div>
                </div>
                <div class="section-row">
                    <a href="javascript:;" id="checkID" onclick="checkID()" name="false"
                       class="secondary-button"><spring:message
                            code="message.login.idcheck"/></a>
                </div>


                <div class="col-md-12">
                    <div class="form-group">
                        <input id="mpw" class="input" type="password" name="mpw"
                               placeholder="<spring:message code="message.login.password" />">
                        <i class="fa fa-eye fa-lg"></i>
                    </div>
                </div>


                <div class="col-md-12">
                    <div class="form-group">
                        <input class="input" type="password" id="rempw" name="rempw"
                               placeholder="<spring:message code="message.login.password" />">
                        <i class="fa fa-eye fa-lg"></i>
                    </div>
                </div>


                <div class="col-md-12">
                    <div class="form-group">
                        <input class="input" type="text" id="mnickname" name="mnickname"
                               placeholder="<spring:message code="message.login.nickname" />">
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <input class="input" type="tel" id="mphone" name="mphone"
                               placeholder="<spring:message code="message.login.phone" />">
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <input class="input" type="email" id="memail" name="memail"
                               placeholder="<spring:message code="message.login.email" />">
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <input class="input" type="text" id="maddress" name="maddress" readonly placeholder="??????"/>
                        <br>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <input class="input" type="text" id="maddressDetail" name="maddressDetail"
                               name="maddressDetail" placeholder="?????? ??????"/> <br>
                    </div>
                </div>
                <div class="col-md-12">
                        <textarea class="box" id="txtArea" readonly="readonly"
                                  style="margin-top:30px;width:100%;height:240px;border: none;resize: none; overflow: visible;">&#10;???????????????????????? ?????? ?????? ???????????? ???????????? ?????? ??????????????? ??? ??????, ?????? ???????????? ????????? ????????? ?????? ????????? ???????????? ??????????????? ???????????????.&#10;&#10;???????????? ??????????????? ?????? ????????? ?????? ??????????????? ???????????? ???????????? ?????? ???????????? ????????? ???????????? ????????? ??? ????????? ???????????? ?????? ?????? ?????? ??? ??? ?????? ???????????? ???????????? ????????? ????????????.</textarea>
                    <div class="form-group">
                        <input type="checkbox" id="demo-human" name="agree">
                        <label for="demo-human">?????? ?????? (??????)</label>
                    </div>
                </div>
                <div class="section-row">
                    <a href="javascript:;" class="secondary-button" onclick="SignUp()"><spring:message
                            code="message.login.signup"/></a>
                </div>

                <br> <br> <br>

            </div>
        </div>
        <!-- /row -->


    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<br>
<br>
<br>
<br>
<br>
<br>

<mytag:footer />
</body>

</html>
