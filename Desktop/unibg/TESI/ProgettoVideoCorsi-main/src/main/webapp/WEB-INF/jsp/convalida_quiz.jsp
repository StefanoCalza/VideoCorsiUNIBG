<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Convalida Quiz - Docente</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
</head>
<body>
<nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
    <div class="container">
        <span class="navbar-brand logo">VideoCorsiUNIBG</span>
    </div>
</nav>
<div class="container" style="margin-top: 100px;">
    <div class="block-heading text-center mb-5">
        <h2>Dettaglio risposte quiz studente</h2>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="alert alert-info text-start">
                <ul class="list-group">
                    <c:forEach var="wa" items="${answerDetails}">
                        <li class="list-group-item">
                            <strong>Domanda:</strong> ${wa.question}<br/>
                            <strong>Risposte dello studente:</strong>
                            <ul>
                                <li <c:if test="${wa.given == 1}">style='color:red;font-weight:bold;'</c:if>>${wa.first}</li>
                                <li <c:if test="${wa.given == 2}">style='color:red;font-weight:bold;'</c:if>>${wa.second}</li>
                                <li <c:if test="${wa.given == 3}">style='color:red;font-weight:bold;'</c:if>>${wa.third}</li>
                                <li <c:if test="${wa.given == 4}">style='color:red;font-weight:bold;'</c:if>>${wa.fourth}</li>
                            </ul>
                            <strong>Risposta corretta:</strong>
                            <span style="color:green;font-weight:bold;">
                                <c:choose>
                                    <c:when test="${wa.correct == 1}">${wa.first}</c:when>
                                    <c:when test="${wa.correct == 2}">${wa.second}</c:when>
                                    <c:when test="${wa.correct == 3}">${wa.third}</c:when>
                                    <c:when test="${wa.correct == 4}">${wa.fourth}</c:when>
                                </c:choose>
                            </span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/VerifyQuiz">
                <input type="hidden" name="UserId" value="${userId}">
                <input type="hidden" name="CourseId" value="${courseId}">
                <input type="hidden" name="ChapterId" value="${chapterId}">
                <div class="d-grid mt-4">
                    <button type="submit" class="btn btn-success btn-lg">Convalida Test</button>
                </div>
            </form>
        </div>
    </div>
</div>
<footer class="page-footer dark mt-auto">
    <div class="footer-copyright">
        <p>© VideoCorsiUNIBG Copyright 2025. All rights reserved.</p>
    </div>
</footer>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html> 