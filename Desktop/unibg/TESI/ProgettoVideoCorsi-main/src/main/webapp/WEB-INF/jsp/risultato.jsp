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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar-custom.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vanilla-zoom.min.css">
    <style>
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: #f6f6f6;
        }
        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .progress {
            height: 1.5rem;
            margin-top: 1rem;
        }
        .progress-bar {
            background-color: #4CAF50;
        }
        .btn {
            margin: 0.5rem 0;
            padding: 0.75rem 1.5rem;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
    <div class="container">
        <span class="navbar-brand logo">VideoCorsiUNIBG</span>
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
            <span class="visually-hidden">Toggle navigation</span>
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/GetCourse" method="post">
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
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/Logout" method="post">
                        <input type="submit" class="btn btn-link nav-link" value="LOGOUT">
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
    
    <div class="main-content">
        <section class="clean-block clean-info dark" style="padding: 70px;">
            <div class="container">
                <div class="block-heading text-center mb-5">
                    <h2>RISULTATO</h2>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6">
                        <div class="card">
                            <div class="card-body text-center">
                                <h5 class="card-title">Punteggio</h5>
                                <p class="card-text">
                                    Hai risposto correttamente a ${right} 
                                    <c:choose>
                                        <c:when test="${right == 1}">domanda</c:when>
                                        <c:otherwise>domande</c:otherwise>
                                    </c:choose>
                                    su ${total}
                                    <c:choose>
                                        <c:when test="${total == 1}">domanda</c:when>
                                        <c:otherwise>domande</c:otherwise>
                                    </c:choose>
                                </p>
                                <div class="progress">
                                    <div class="progress-bar
                                        <c:choose>
                                            <c:when test="${(right/total) ge 0.75}">bg-success</c:when>
                                            <c:otherwise>bg-danger</c:otherwise>
                                        </c:choose>"
                                        role="progressbar"
                                        style="width: ${(right/total)*100}%"
                                        aria-valuenow="${(right/total)*100}"
                                        aria-valuemin="0" aria-valuemax="100">
                                        ${(right/total)*100}%
                                    </div>
                                </div>
                                <c:if test="${(right/total) lt 0.75}">
                                    <div class="alert alert-danger mt-4" role="alert">
                                        Non hai raggiunto il punteggio minimo del 75%. Devi ripetere il test.
                                    </div>
                                </c:if>
                                <c:if test="${is_final eq 1 and (right/total) ge 0.75 and not isCoursePassed}">
                                    <div class="alert alert-success mt-4" role="alert">
                                        Corso terminato! Ora attendi la convalida da parte del docente per poter sostenere l'esame.
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mt-4">
                    <div class="col-md-10">
                        <c:if test="${not empty wrongAnswers}">
                            <div class="alert alert-info text-start">
                                <h5>Risposte sbagliate:</h5>
                                <ul class="list-group">
                                    <c:forEach var="wa" items="${wrongAnswers}">
                                        <li class="list-group-item">
                                            <strong>Domanda:</strong> ${wa.question}<br/>
                                            <strong>Risposta data:</strong>
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
                        </c:if>
                    </div>
                </div>
                <div class="row justify-content-center mt-5">
                    <div class="col-md-6 col-lg-4">
                        <form method="get" action="${pageContext.request.contextPath}/GetQuiz">
                            <input type="hidden" name="CourseId" value="${param.CourseId}">
                            <input type="hidden" name="ChapterId" value="${param.ChapterId}">
                            <div class="d-grid">
                                <button type="submit" class="btn btn-outline-primary btn-lg">RIPETI</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <form method="get" action="${pageContext.request.contextPath}/ChapterController">
                            <input type="hidden" name="CourseId" value="${param.CourseId}">
                            <div class="d-grid">
                                <c:choose>
                                    <c:when test="${is_final eq 1}">
                                        <button type="submit" class="btn btn-outline-primary btn-lg">TORNA AL CORSO</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="submit" class="btn btn-outline-primary btn-lg">PROSSIMO CAPITOLO</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>

<footer class="page-footer dark mt-auto">
    <div class="footer-copyright">
        <p>© VideoCorsiUNIBG Copyright 2025. All rights reserved.</p>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vanilla-zoom.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
<script>
(function(){if(!window.chatbase||window.chatbase("getState")!=="initialized"){window.chatbase=(...arguments)=>{if(!window.chatbase.q){window.chatbase.q=[]}window.chatbase.q.push(arguments)};window.chatbase=new Proxy(window.chatbase,{get(target,prop){if(prop==="q"){return target.q}return(...args)=>target(prop,...args)}})}const onLoad=function(){const script=document.createElement("script");script.src="https://www.chatbase.co/embed.min.js";script.id="QMOmt8V4IC-Q9QzLK9-Zl";script.domain="www.chatbase.co";document.body.appendChild(script)};if(document.readyState==="complete"){onLoad()}else{window.addEventListener("load",onLoad)}})();
</script>

</body>
</html>