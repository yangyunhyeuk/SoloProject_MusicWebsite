<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link type="text/css" rel="stylesheet" href="/resources/css/post.css"/>

    <!-- my js -->
    <script type="text/javascript">
        window.onload = function () {
            console.log("입장");
            let mid = '<%=(String) session.getAttribute("mid")%>';
            let bnum = ${bnum};
            //$.get("/fav/isFav", {mid, bnum}).done(isFav => isFav ? $("#heartbeat").addClass("heartbeat") : null);

            $.ajax({
                type: 'GET',
                url: "/fav/isFav",
                data: {
                    mid,
                    bnum
                },
                success: function (result) {
                    console.log("window.onload is Fav result :");
                    console.log(result);
                    if (result == 'true') {
                        //("true");
                        $("#heartbeat").addClass("heartbeat");
                    } else if (result == 'false') {
                        //alert("false");
                        $("#heartbeat").removeClass("heartbeat");
                    } else {
                        alert("문제 발생");
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            })

        };
        function concern() {
            let mid = '<%=(String) session.getAttribute("mid")%>';
            let bnum = ${bnum};
            let btitle = '${btitle}';
            let filename = '${filename}';

            $.ajax({
                type: 'POST',
                url: "/fav/insert",
                data: {
                    mid,
                    bnum,
                    btitle,
                    filename
                },
                success: function (result) {
                    console.log(result);
                    if (result == 'success') {
                        alert("관심글 등록 완료");
                        document.querySelector("#heartbeat").className = "heartbeat";
                    } else if (result == 'fail') {
                        alert("관심글 등록 실패");
                    } else if (result == 'cancel') {
                        alert("관심글 등록 취소");
                        document.querySelector("#heartbeat").className = "";
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            })
        }
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
                <a class="post-img" href=""><img id="img" src="/getImage?filename=${filename}" alt=""></a>
            </div>


            <!-- post -->
            <div class="post post-row">
                <div class="col-md-12">
                    <h3 class="post-title">
                        <a href="javascript:;">${btitle}
                            <div id="heartbeat">
                                <div class="heart">
                                    <svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve"
                                         viewBox="0 0 206.637 206.637" y="0px" x="0px" version="1.1"
                                         style="enable-background:new 0 0 206.637 206.637;">
                                                                <path d="M153.074 170.291c-7.045 13.19-14.576 23.687-20.284 28.58c-6.012 5.153-12.752 7.767-20.032 7.8 c-14.676 0-31.813-10.481-52.389-32.042c-19.268-20.189-25.259-43.386-26.892-59.291c-1.868-18.185 1.243-36.145 7.925-45.754 c0.078-0.112 0.161-0.22 0.25-0.323c0.217-0.253 0.836-0.968 1.696-1.939c13.403 3.3 34.7 10.7 48.3 26.9 c12.1 14.4 17.5 28.2 21.9 39.185c3.657 9.2 6.8 17.2 12.7 23.075C134.047 164.3 145.3 168.3 153.1 170.291z M97.754 89.099c10.469 12.5 16.2 24.3 20.4 34.482c6.04-1.26 20.358-5.36 31.97-17.362 c9.172-9.479 14.138-25.945 16.646-37.592c-4.027-6.218-9.3-9.001-14.394-11.05c-1.104-0.443-2.057-0.827-2.695-1.199 c-1.93-1.126-3.262-10.092-0.746-23.999c1.158-6.4 2.194-8.687 2.272-8.854c0.573-1.092 0.611-2.391 0.098-3.517 c-0.526-1.155-1.569-1.991-2.81-2.255l-11-2.334c-2.126-0.453-4.217 0.874-4.721 2.984c-2.63 11.017-7.923 29.937-10.933 33.8 c-0.286 0.368-0.844 0.985-1.366 0.985c-1.133 0-3.331-2.222-3.481-5.387c-0.264-5.531 1.829-33.267 2.658-43.486 c0.09-1.113-0.289-2.214-1.046-3.035S116.804 0 115.7 0h-9.333c-2.103 0-3.847 1.629-3.991 3.7 c-0.021 0.303-2.092 30.35-3.978 40.097c-0.784 4.05-2.414 12.477-4.98 12.477c-0.345 0-0.957-0.093-1.915-0.534 c-4.64-2.139-8.218-18.239-9.565-24.301c-1.875-8.435-1.905-16.717-1.905-16.798c0-1.241-0.576-2.412-1.56-3.17 c-0.984-0.757-2.263-1.014-3.463-0.697l-11.333 3c-2.12 0.562-3.393 2.725-2.854 4.851c0.026 0.1 2.6 10.3 4.3 19.6 c1.056 5.65-1.338 11.347-6.101 14.512c-1.081 0.719-2.116 1.417-3.02 2.045c-1.806 1.254-4.161 3.459-6.444 5.8 C63.999 64.6 84 72.7 97.8 89.099z M155.895 111.781c-12.347 12.761-27.064 17.6-34.683 19.3 c3.345 8.4 6.1 15.1 10.6 19.713c7.15 7.1 18.2 10.6 25 12.109c9.455-19.578 17.164-43.386 16.882-63.671 c-0.1-7.208-0.775-13.091-1.871-17.949C168.617 92 163.6 103.8 155.9 111.781z"
                                                                      style="fill:#d63230;"/>
                                                            </svg>
                                </div>
                            </div>
                        </a>
                    </h3>
                </div>
                <div class="col-md-12">
                    <span style="color:black; white-space: pre-line; ">${bcontent}</span>
                </div>
                <!-- /post -->
            </div>
        </div>
        <!-- row -->
        <c:if test="${sessionScope.mid eq 'admin'}">
            <div class="section-row" style="text-align: center;">
                <%--
                <a href="/board/postedit? bnum=${bnum}" class="secondary-button">수정</a>
                --%>

                <a href="/board/postedit?page=${page}&size=${size}&bnum=${bnum}" class="secondary-button">수정</a>
            </div>
        </c:if>
        <c:if test="${(sessionScope.mid ne 'admin') && (not empty sessionScope.mid)}">
            <div class="section-row" style="text-align: center;">
                <a href="javascript:;" onclick="concern()"
                   class="secondary-button">관심글 등록</a>
            </div>
        </c:if>

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
