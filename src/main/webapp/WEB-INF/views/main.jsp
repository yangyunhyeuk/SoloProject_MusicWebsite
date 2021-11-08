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
            href="https://fonts.googleapis.com/css?family=Montserrat:400,400%7CMuli:400,400"
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

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- my js -->
    <script src="/resources/js/mymain.js"></script>

    <!-- my css -->
    <link type="text/css" rel="stylesheet" href="/resources/css/mymain.css"/>


    <script>
        fetch(`https://popnable.com/stories/314-top-10-famous-ethiopian-songs-in-2020`).then((response) => {
            if (response.status === 200) {
                // text로 읽어온다
                response.text().then((text) => {
                    const parser = new DOMParser()
                    // DOMParser로 변환
                    const melonChart = parser.parseFromString(text, 'text/html')
                    // searchbox 읽어오기
                    //const searchResults = melonChart.querySelector('span.blast.mmt-sentence')

                    // searchResults가 있다면 검색 결과가 있다는 뜻
                    if (melonChart) {
                        console.log(melonChart);

                    }
                })
            }
        })

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


<br>
<br>
<br>
<div class="row">
    <div class="section-row">
        <div class="section-title">
            <h2 class="title" style="font-size: 30px;">New Album OUT NOW</h2>
        </div>
        <br>
        <!-- Swiper -->
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <a href="https://www.youtube.com/results?search_query=kanye+west+donda"><img
                            src="/resources/img/sdonda.png"/></a>
                </div>
                <div class="swiper-slide">
                    <a href="https://www.youtube.com/results?search_query=ed+sheeran"><img
                            src="/resources/img/sed.png"/></a>
                </div>
                <div class="swiper-slide">
                    <a href="https://www.youtube.com/results?search_query=billie+eilish"><img
                            src="/resources/img/sbilly.jpg"/></a>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<%--


<div class="row">
    <div class="section-row">
        <div class="section-title">
            <h1 class="title" style="font-size: 30px;">LATEST</h1>
        </div>
        <br>

        <!-- row -->
        <div class="row">
            <div class="col-md-4">
                <!-- post -->
                <div class="post">
                    <iframe width="400" height="225" src="https://www.youtube.com/embed/Il0S8BoucSA"
                            title="YouTube video player"
                            frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                    <br>
                    <br>
                    <br>
                    <div class="post-body">
                        <h3 class="post-title"><a href="blog-post.html">Shivers</a></h3>
                        <ul class="post-meta">
                            <li><a href="author.html">Ed Sheeran</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /post -->
            </div>
            <div class="col-md-4">
                <!-- post -->
                <div class="post">
                    <iframe width="400" height="225" src="https://www.youtube.com/embed/U3ASj1L6_sY"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                    <br>
                    <br>
                    <br>
                    <div class="post-body">
                        <h3 class="post-title"><a href="blog-post.html">Easy On Me</a></h3>
                        <ul class="post-meta">
                            <li><a href="author.html">Adele</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /post -->
            </div>
            <div class="col-md-4">
                <!-- post -->
                <div class="post">
                    <iframe width="400" height="225" src="https://www.youtube.com/embed/rESaZb2w8o0"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                    <br>
                    <br>
                    <br>
                    <div class="post-body">
                        <h3 class="post-title"><a href="blog-post.html">Round and Round</a></h3>
                        <ul class="post-meta">
                            <li><a href="author.html">KIMMUSEUM</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /post -->
            </div>
        </div>
        <!-- /row -->
    </div>
</div>

<br>
<br>
<div class="row">
    <div class="section-row">
        <div class="section-title">
            <h1 class="title" style="font-size: 30px;">POPULAR</h1>
        </div>
        <br>

        <!-- row -->
        <div class="row">
            <div class="col-md-4">
                <!-- post -->
                <div class="post">
                    <iframe width="400" height="225" src="https://www.youtube.com/embed/5f8QcbACOp8"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                    <br>
                    <br>
                    <br>
                    <div class="post-body">
                        <h3 class="post-title"><a href="blog-post.html">Tears In Your Eyes</a></h3>
                        <ul class="post-meta">
                            <li><a href="author.html">Nora En Pure</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /post -->
            </div>
            <div class="col-md-4">
                <!-- post -->
                <div class="post">
                    <iframe width="400" height="225" src="https://www.youtube.com/embed/ryJgDL9jzKk"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                    <br>
                    <br>
                    <br>
                    <div class="post-body">
                        <h3 class="post-title"><a href="blog-post.html">Put It All On Me</a></h3>
                        <ul class="post-meta">
                            <li><a href="author.html">Ed Sheeran</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /post -->
            </div>
            <div class="col-md-4">
                <!-- post -->
                <div class="post">
                    <iframe width="400" height="225" src="https://www.youtube.com/embed/0opZqh_TprM"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen></iframe>
                    <br>
                    <br>
                    <br>
                    <div class="post-body">
                        <h3 class="post-title"><a href="blog-post.html">Lemonade</a></h3>
                        <ul class="post-meta">
                            <li><a href="author.html">Internet Money</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /post -->
            </div>
        </div>
        <!-- /row -->
    </div>
</div>--%>

<mytag:footer/>
</body>

</html>
