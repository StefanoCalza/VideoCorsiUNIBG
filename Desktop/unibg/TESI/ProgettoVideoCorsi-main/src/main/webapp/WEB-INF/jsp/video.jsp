<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PROGETTO VIDEOCORSI</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vanilla-zoom.min.css">
</head>
<body>

<nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
    <div class="container">
        <a class="navbar-brand logo">VideoCorsiUNIBG</a>
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
            <span class="visually-hidden">Toggle navigation</span>
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/GetCourse" method="post">
                        <input type="submit" style="border:0px; background:white;" value="HOME&nbsp&nbsp">
                    </form>
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/goProfile" method="post">
                        <input type="submit" style="border:0px; background:white;" value="PROFILO&nbsp&nbsp">
                    </form>
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/goEsami" method="post">
                        <input type="submit" style="border:0px; background:white;" value="ESAMI&nbsp&nbsp">
                    </form>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/index.html">
                        <input type="submit" style="border:0px; background:white;" value="LOGOUT&nbsp&nbsp">
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="clean-block clean-info dark" style="padding: 70px;">
    <div class="container">
        <div class="block-heading">
            <h2>${namec}</h2>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h3>${charaname}</h3>
                <div class="ratio ratio-16x9 mb-4">
                    <iframe src="https://www.youtube.com/embed/${video}" allowfullscreen=""></iframe>
                </div>
                <form method="get" action="${pageContext.request.contextPath}/GetQuiz">
                    <input type="hidden" name="CourseId" value="${CourseId}">
                    <input type="hidden" name="ChapterId" value="${ChapterId}">
                    <div class="text-center">
                        <button type="submit" class="btn btn-outline-primary btn-lg">Vai al QUIZ</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<footer class="page-footer dark">
    <div class="footer-copyright">
        <p>© 2023 Copyright Text</p>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vanilla-zoom.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>

</body>
</html>