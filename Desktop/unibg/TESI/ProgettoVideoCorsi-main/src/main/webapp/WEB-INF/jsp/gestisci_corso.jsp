<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Gestisci Corso</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar-custom.css">
    <style>
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: #f6f6f6;
        }
        main, .main-content, .clean-block {
            flex: 1 0 auto;
        }
        .page-footer {
            flex-shrink: 0;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
    <div class="container">
        <a class="navbar-brand logo" href="${pageContext.request.contextPath}/HomeDocente">VideoCorsiUNIBG</a>
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
            <span class="visually-hidden">Toggle navigation</span>
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/HomeDocente" method="get">
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
                        <input type="submit" class="btn btn-link nav-link" value="CONVALIDA CORSI">
                    </form>
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/Logout" method="post">
                        <input type="submit" class="btn btn-link nav-link" value="LOGOUT">
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
<main class="clean-block clean-info dark" style="padding: 70px;">
    <div class="container">
        <div class="block-heading">
            <h2>${course.name}</h2>
            <p>${course.description}</p>
        </div>
        <c:if test="${param.success == '1'}">
            <div class="alert alert-success" role="alert">
                Modifica del capitolo avvenuta con successo!
            </div>
        </c:if>
        <c:if test="${param.success == '2'}">
            <div class="alert alert-success" role="alert">
                Capitolo eliminato con successo!
            </div>
        </c:if>
        <div class="row">
            <c:if test="${empty chapters}">
                <div class="alert alert-info" role="alert">
                    Nessun capitolo disponibile per questo corso.
                </div>
            </c:if>
            <c:forEach items="${chapters}" var="chapter">
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">${chapter.name}</h4>
                            <p class="card-text">${chapter.description}</p>
                            <form method="get" action="${pageContext.request.contextPath}/ModificaCapitolo" style="display:inline-block;">
                                <input type="hidden" name="CourseId" value="${course.idCourse}">
                                <input type="hidden" name="ChapterId" value="${chapter.idChapter}">
                                <button type="submit" class="btn btn-outline-warning">Modifica</button>
                            </form>
                            <form method="post" action="${pageContext.request.contextPath}/EliminaCapitolo" style="display:inline-block; margin-left: 8px;">
                                <input type="hidden" name="CourseId" value="${course.idCourse}">
                                <input type="hidden" name="ChapterId" value="${chapter.idChapter}">
                                <button type="submit" class="btn btn-outline-danger" onclick="return confirm('Sei sicuro di voler eliminare questo capitolo e il relativo quiz? L\'operazione è irreversibile.');">Elimina</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/CreateChapter?CourseId=${course.idCourse}&name_course=${course.name}&description_corse=${course.description}" class="btn btn-primary btn-lg">
                <i class="fa fa-plus"></i> Aggiungi capitolo
            </a>
        </div>
    </div>
</main>
<footer class="page-footer dark">
    <div class="footer-copyright">
        <p>© VideoCorsiUNIBG Copyright 2025. All rights reserved.</p>
    </div>
</footer>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html> 