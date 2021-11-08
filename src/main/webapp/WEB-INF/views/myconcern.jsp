<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>JAMON</title>
    <!-- jQuery Plugins -->
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.stellar.min.js"></script>
    <script src="/resources/js/main.js"></script>

    <!-- my css -->
    <link type="text/css" rel="stylesheet" href="/resources/css/myconcern.css"/>

    <!-- my js -->
    <script type="text/javascript">
        function check() {
            var result = confirm("정말 탈퇴하시겠습니까?");
            if (result == true) {
                location.href = '/quit?mid=${mid}';
            } else {
                return false;
            }
        }

        window.onload = () => {
            const pageCount = 10; // 하단에 명시될 최대 페이지 수
            const totalCount = ${totalCount}; // 테이블 내 총 게시글 수
            const page = ${page}; // 현재 머무는 페이지
            const size = ${size}; // 한 페이지에 명시할 게시글 갯수
            const totalPageCount = Math.floor(totalCount / size) + (totalCount % size > 0); // 하단에 명시될 총 페이지의 갯수
            const part = Math.floor(page / pageCount) + 1; // 현재 속한 페이지의 파트 (1~10: 1파트, 11~20: 2파트, ...)
            const totalPartCount = Math.floor(totalPageCount / pageCount) + (totalPageCount % pageCount > 0); // 모든 파트의 개수

            const prevElement = document.querySelector("a.prev");
            const nextElement = document.querySelector("a.next");
            if (part === 1) {
                prevElement.style.display = "none";
            } else {
                prevElement.href = "/fav/list?page=" + ((part - 1) * pageCount) + "&size=" + size;
            }

            if (part === totalPartCount) {
                nextElement.style.display = "none";
            } else {
                prevElement.href = "/fav/list?page=" + (part * pageCount + 1) + "&size=" + size;
            }

            const pagesElement = document.querySelector("div.pages");

            // 현재 파트의 시작 페이지;  0~9(1~10) && 유효성 검사; ++
            for (let i = (part - 1) * pageCount; i < part * pageCount && i < totalPageCount; ++i) {
                pagesElement.innerHTML += (page === i ? '<a class="activePage"' : "<a") + ' href="/fav/list?page=' + i + '&size=' + size + '">' + (i + 1) + "</a>";
            }
        };
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
                <mytag:logo/>
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
            <div class="col-md-8">
                <!-- row -->
                <div class="row">

                    <div class="galery-widget">
                        <div class="col-md-12">
                            <div class="section-title">
                                <h2 class="title">Fav Post</h2>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${not empty list}">
                                <ul style="text-align: left;">
                                    <c:forEach items="${list}" var="vo">
                                        <li>
                                            <a class="post-img" href="/board/post?bnum=${vo.bnum}">
                                                <img src="/getImage?filename=${vo.filename}" alt="">
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>


                                <div class="section-row loadmore text-center">
                                    <div class="pagination">
                                        <a class="prev">&laquo;</a>
                                        <div class="pages"></div>
                                        <a class="next">&raquo;</a>
                                    </div>
                                </div>
                            </c:when>
                            <c:when test="${mid eq 'admin'}">
                                <br>
                                <br>
                                <br>
                                <h3>관리자 모드</h3>
                            </c:when>
                            <c:otherwise>
                                <br>
                                <br>
                                <br>
                                <h3>현재 관심 게시글이 존재하지 않습니다.</h3>
                            </c:otherwise>
                        </c:choose>


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

<mytag:footer/>

</body>

</html>
