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
</head>
<body>
<nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
    <div class="container"><a class="navbar-brand logo">VideoCorsiUNIBG</a></div>
</nav>
<section class="clean-block clean-info dark" style="padding: 70px;">
    <div class="container">
        <div class="block-heading">
            <h2>Gestione Capitoli - ${course.name}</h2>
            <p>${course.description}</p>
        </div>
        <c:if test="${param.success == '1'}">
            <div class="alert alert-success" role="alert">
                Modifica del capitolo avvenuta con successo!
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
                            <form method="get" action="${pageContext.request.contextPath}/ModificaCapitolo">
                                <input type="hidden" name="CourseId" value="${course.idCourse}">
                                <input type="hidden" name="ChapterId" value="${chapter.idChapter}">
                                <button type="submit" class="btn btn-outline-warning">Modifica</button>
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
        <p>2023 Copyright Text</p>
    </div>
</footer>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html> 