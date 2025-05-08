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
                <c:choose>
                    <c:when test="${user.role == 1}">
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/ChapterController" method="get">
                                <input type="submit" class="btn btn-link nav-link" value="HOME">
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/goProfile" method="post">
                                <input type="submit" class="btn btn-link nav-link" value="PROFILO">
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/goEsami" method="post">
                                <input type="submit" class="btn btn-link nav-link" value="ESAMI">
                            </form>
                        </li>
                    </c:when>
                    <c:when test="${user.role == 2}">
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/ChapterController" method="get">
                                <input type="submit" class="btn btn-link nav-link" value="HOME">
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/goProfile" method="post">
                                <input type="submit" class="btn btn-link nav-link" value="PROFILO">
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/goEsami" method="post">
                                <input type="submit" class="btn btn-link nav-link" value="ESAMI">
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/GetPassedExam" method="GET">
                                <input type="submit" class="btn btn-link nav-link" value="ESAMI PASSATI">
                            </form>
                        </li>
                    </c:when>
                </c:choose>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/index.jsp" method="get">
                        <input type="submit" class="btn btn-link nav-link" value="LOGOUT">
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>

<br><br><br><br><br>

<section class="clean-block clean-info dark" style="padding: 70px;">
    <div class="container">
        <div class="block-heading">
            <h2>CORSI IN CUI SEI ISCRITTO</h2>
        </div>
        <div class="row">
            <c:choose>
                <c:when test="${empty chapter && empty coursesnotin}">
                    <div class="alert alert-warning" role="alert">
                        Non sei iscritto a nessun corso e non ci sono altri corsi disponibili al momento.
                    </div>
                </c:when>
                <c:otherwise>
                    <c:if test="${empty chapter}">
                        <div class="alert alert-info" role="alert">
                            Non sei iscritto a nessun corso al momento.
                        </div>
                    </c:if>
                </c:otherwise>
            </c:choose>
            <c:forEach items="${chapter}" var="chara">
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title">${chara.name}</h3>
                            <p class="card-text"><strong>${chara.description}</strong></p>
                            <form method="get" action="${pageContext.request.contextPath}/ChapterController">
                                <input type="hidden" name="CourseId" value="${chara.idCourse}">
                                <button type="submit" class="btn btn-outline-primary">VAI AL CORSO</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<section class="clean-block clean-info dark" style="padding: 70px;">
    <div class="container">
        <div class="block-heading">
            <h2>CORSI DISPONIBILI</h2>
        </div>
        <div class="row">
            <c:if test="${empty coursesnotin}">
                <div class="alert alert-info" role="alert">
                    Non ci sono altri corsi disponibili a cui iscriverti al momento.
                </div>
            </c:if>
            <c:forEach items="${coursesnotin}" var="c">
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title">${c.name}</h3>
                            <p class="card-text"><strong>${c.description}</strong></p>
                            <form method="get" action="${pageContext.request.contextPath}/SubscribeCourse">
                                <input type="hidden" name="CourseId" value="${c.idCourse}">
                                <button type="submit" class="btn btn-outline-primary">ISCRIVITI</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
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