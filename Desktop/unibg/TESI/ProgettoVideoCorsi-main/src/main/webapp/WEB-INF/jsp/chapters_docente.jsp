<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PROGETTO VIDEOCORSI - Capitoli</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar-custom.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
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

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">Capitoli del Corso: ${course.name}</h4>
                        <a href="${pageContext.request.contextPath}/Create_chapter?CourseId=${course.idCourse}" class="btn btn-light">
                            <i class="fas fa-plus"></i> Nuovo Capitolo
                        </a>
                    </div>
                    <div class="card-body">
                        <p class="text-muted">${course.description}</p>
                        
                        <c:if test="${empty chapters}">
                            <div class="alert alert-info">
                                <i class="fas fa-info-circle"></i> Non ci sono ancora capitoli in questo corso.
                            </div>
                        </c:if>
                        
                        <c:forEach items="${chapters}" var="chapter">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <h5 class="card-title">${chapter.name}</h5>
                                            <p class="card-text text-muted">${chapter.description}</p>
                                            <c:if test="${chapter.isFinal}">
                                                <span class="badge bg-warning text-dark">
                                                    <i class="fas fa-star"></i> Quiz Finale
                                                </span>
                                            </c:if>
                                        </div>
                                        <a href="${pageContext.request.contextPath}/DettaglioCapitolo?ChapterId=${chapter.idChapter}&CourseId=${course.idCourse}" 
                                           class="btn btn-primary">
                                            <i class="fas fa-edit"></i> Modifica
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer mt-5 py-3 bg-light">
        <div class="container text-center">
            <span class="text-muted">© 2024 Progetto Videocorsi. Tutti i diritti riservati.</span>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    (function(){if(!window.chatbase||window.chatbase("getState")!=="initialized"){window.chatbase=(...arguments)=>{if(!window.chatbase.q){window.chatbase.q=[]}window.chatbase.q.push(arguments)};window.chatbase=new Proxy(window.chatbase,{get(target,prop){if(prop==="q"){return target.q}return(...args)=>target(prop,...args)}})}const onLoad=function(){const script=document.createElement("script");script.src="https://www.chatbase.co/embed.min.js";script.id="QMOmt8V4IC-Q9QzLK9-Zl";script.domain="www.chatbase.co";document.body.appendChild(script)};if(document.readyState==="complete"){onLoad()}else{window.addEventListener("load",onLoad)}})();
    </script>
</body>
</html> 