<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>${namec} - PROGETTO VIDEOCORSI</title>
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
                                <input type="submit" class="btn btn-link nav-link" value="CORSI COMPLETATI">
                            </form>
                        </li>
                    </c:when>
                    <c:otherwise>
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
                    </c:otherwise>
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
            <h2>${namec}</h2>
        </div>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                ${errorMessage}
            </div>
        </c:if>
        <div class="row align-items-center">
            <c:forEach items="${chapter}" var="ch">
                <div class="col-md-6">
                    <div class="getting-started-info">
                        <h3>Capitolo ${ch.idChapter}</h3>
                        <p style="color: var(--bs-dark);font-size: 18px;font-family: Montserrat, sans-serif;text-align: left;">
                            <strong>${ch.description}</strong>
                        </p>
                        <form method="get" action="${pageContext.request.contextPath}/GoToVideo" enctype="multipart/form-data">
                            <input type="hidden" name="ChapterId" value="${ch.idChapter}">
                            <button type="submit" value="Submit" class="btn btn-outline-primary btn-lg">
                                VAI AL VIDEO
                            </button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<br><br><br><br>

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