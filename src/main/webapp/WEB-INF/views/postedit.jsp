<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
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

    <!-- Favicon -->
    <link rel="shortcut icon" href="/resources/icon/favicon.ico">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet"
          href="/resources/css/bootstrap.min.css"/>

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

    <!-- my css -->
    <link type="text/css" rel="stylesheet" href="/resources/css/postedit.css"/>

    <!-- my js -->
    <script type="text/javascript">
        function postupdate() {
            console.log("업데이트 ajax 도착");
            // Number(bnum)
            // +bnum
            const bnum = +$('#bnum').val();
            const btitle = $('#btitle').val();
            const bcontent = $('#bcontent').val();

            if (btitle == "") {
                alert("제목을 입력하세요");
                document.getElementById("btitle").focus();
                return false;
            } else if (bcontent == "") {
                alert("내용을 입력하세요");
                document.getElementById("bcontent").focus();
                return false;
            } else {
                $.ajax({
                    type: 'POST',
                    url: "/board/postupdate",
                    data: {
                        bnum,
                        btitle,
                        bcontent
                    },
                    success: function (result) {
                        console.log(result);
                        if (result === 'success') {
                            alert("수정 성공");
                            location.href = "/board/list?page=" + ${page} + "&size=" + ${size};
                        } else {
                            alert("수정 실패");
                            // location.href = '/board/list';
                            location.href = "/board/list?page=" + ${page} + "&size=" + ${size};
                        }

                    },
                    error: function (error) {
                        console.log(error);
                    }
                })
            }

        }

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
        <div id="content" class="row">
            <!-- post -->
            <div class="col-md-12">
                <a class="post-img" href=""><img src="/getImage?filename=${filename}" alt=""></a>
                <div class="post-body">
                    <input class="input" type="hidden" style="width: 50%;" id="bnum" name="bnum" value="${bnum}">
                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <!-- post -->
            <div class="post post-row">


                <div class="col-md-12">
                    <input class="input" type="text" id="btitle" name="btitle" value="${btitle}">
                    <div id="btitle_cnt">(0 / 20)</div>
                </div>
                <div class="col-md-12">
                                        <textarea id="bcontent" name="bcontent" cols="30" rows="10" class="input"
                                                  style="height: 400px;resize: none;">${bcontent}</textarea>
                    <div id="bcontent_cnt">(0 / 200)</div>
                </div>
                <!-- /post -->
            </div>
        </div>
        <!-- row -->

        <div class="section-row" style="text-align: center;">
            <%--
            <a href="javascript:;" onclick="postupdate()" class="secondary-button">수정</a>
            <a href="/board/postdelete?bnum=${bnum}" class="secondary-button">삭제</a>
            --%>

            <a href="javascript:;" onclick="postupdate()" class="secondary-button">수정</a>
            <a href="/board/postdelete?page=${page}&size=${size}&bnum=${bnum}" class="secondary-button">삭제</a>
        </div>


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
