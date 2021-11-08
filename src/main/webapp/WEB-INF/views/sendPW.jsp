<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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

    <!-- jQuery Plugins -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.stellar.min.js"></script>
    <script src="/resources/js/main.js"></script>

    <!-- my css -->
    <link type="text/css" rel="stylesheet" href="/resources/css/sendPW.css"/>

    <!-- my js -->
    <script>
        function infoCheck() {
            let mid = document.getElementById("mid");
            let memail = document.getElementById("memail");

            let idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
            let emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 유효성 검사

            if (mid.value == "") {
                alert("아이디를 입력하세요.");
                mid.focus();
                return false;
            } else if (!idRegExp.test(mid.value)) {
                alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
                mid.focus();
                return false;
            } else if (memail.value == "") {
                alert("이메일을 입력하세요.");
                memail.focus();
                return false;
            } else if (!emailRegExp.test(memail.value)) {
                alert("이메일 주소 확인 후 다시 작성하시기 바랍니다.");
                memail.focus();
                return false;
            } else {
                console.log(mid.value);

                fetch("/sendMail", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({
                        mid: mid.value,
                        memail: memail.value,
                    })
                }).then(response => response.text())
                    .then(result => {
                        console.log(result);
                        if (result === "success") {
                            alert("메일 발송 완료");
                            location.href = '/signin';
                        } else if (result === "fail") {
                            alert("회원 아이디를 확인하신 뒤 다시 입력바랍니다.");
                            $("#mid").val("");
                            $("#memail").val("");
                            $("#mid").focus();
                        } else {
                            alert("문제 발생");
                            location.href = '/main';
                        }
                    }).catch(e => console.log(e));
            }
        }
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
                <h2 class="title">Send Mail</h2>
            </div>


            <div id="sendpw" class="row" style="margin: auto; width: 30%;">
                <div class="col-md-12">
                    <div class="form-group">
                        <input id="mid" class="input" type="text" name="mid"
                               placeholder="아이디">
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <input id="memail" class="input" type="text" name="memail" placeholder="이메일">
                    </div>
                </div>
                <div class="section-row">
                    <a href="javascript:;" onclick="infoCheck()" class="secondary-button">임시비밀번호 발급</a>
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
