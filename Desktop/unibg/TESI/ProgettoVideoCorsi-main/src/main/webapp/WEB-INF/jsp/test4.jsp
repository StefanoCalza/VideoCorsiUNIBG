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

<main class="clean-block clean-info dark" style="padding: 70px;">
    <div class="container-fluid">
        <div class="block-heading">
            <h2>${namec}</h2>
        </div>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                ${errorMessage}
            </div>
        </c:if>
        <div class="row">
            <c:forEach items="${chapter}" var="chara">
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title">${chara.name}</h3>
                            <p class="card-text"><strong>${chara.description}</strong></p>
                            <c:choose>
                                <c:when test="${chara.isFinal == 1}">
                                    <form method="get" action="GetQuiz">
                                        <input type="hidden" name="CourseId" value="${chara.idCourse}">
                                        <input type="hidden" name="ChapterId" value="${chara.idChapter}">
                                        <button type="submit" class="btn btn-outline-success">VAI AL TEST FINALE</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <form method="post" action="gotovideo" enctype="multipart/form-data">
                                        <input type="hidden" name="CourseId" value="${chara.idCourse}">
                                        <input type="hidden" name="ChapterId" value="${chara.idChapter}">
                                        <input type="hidden" name="coursename" value="${namec}">
                                        <input type="hidden" name="video" value="${chara.video}">
                                        <input type="hidden" name="charaname" value="${chara.name}">
                                        <button type="submit" value="Submit" class="btn btn-outline-primary">VAI AL VIDEO</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</main>

<footer class="page-footer dark">
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