<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Esami - VideoCorsi UNIBG</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar-custom.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vanilla-zoom.min.css">
    <style>
        body {
            background-color: #f6f6f6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .clean-block {
            padding: 50px 0;
            flex: 1;
        }
        .card {
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .block-heading {
            padding-bottom: 40px;
            text-align: center;
        }
        .block-heading h2 {
            color: #333;
            margin-bottom: 1rem;
            font-weight: bold;
        }
        .footer-copyright {
            padding: 20px 0;
            background-color: #2d2c38;
            color: white;
            text-align: center;
        }
        .clean-navbar {
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .navbar-nav .nav-item {
            margin: 0 10px;
        }
        .btn-primary {
            background-color: #2d2c38;
            border-color: #2d2c38;
        }
        .btn-primary:hover {
            background-color: #1a1922;
            border-color: #1a1922;
        }
        .getting-started-info {
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .getting-started-info p {
            margin-bottom: 0;
        }
    </style>
</head>

<body>

<c:choose>
    <c:when test="${user.role == 1}">
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
        <main class="clean-block" style="margin-top: 80px;">
            <div class="container">
                <c:if test="${param.success == '1'}">
                    <div class="alert alert-success mt-4" role="alert">
                        Corso convalidato con successo!
                    </div>
                </c:if>
                <div class="block-heading">
                    <h2>CONVALIDA CORSI</h2>
                </div>
                <div class="row">
                    <c:choose>
                        <c:when test="${not empty userchapter}">
                            <c:forEach items="${userchapter}" var="c">
                                <div class="col-md-6 col-lg-4 mb-4">
                                    <div class="card shadow-sm h-100">
                                        <div class="card-body">
                                            <h5 class="card-title mb-2">${c.nomecorso}</h5>
                                            <p class="card-text text-muted mb-3">
                                                <i class="fa fa-user"></i> ${c.nomeutente}
                                            </p>
                                            <form method="get" action="${pageContext.request.contextPath}/VerifyQuiz">
                                                <input type="hidden" name="ChapterId" value="${c.idchapter}">
                                                <input type="hidden" name="CourseId" value="${c.idcourse}">
                                                <input type="hidden" name="UserId" value="${c.iduser}">
                                                <button type="submit" class="btn btn-outline-primary w-100">Convalida corso</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="col-12">
                                <div class="alert alert-warning" role="alert">
                                    Nessun esame da convalidare trovato
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </main>
    </c:when>
    <c:otherwise>
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
                            <c:choose>
                                <c:when test="${user.role == 2}">
                                    <form action="${pageContext.request.contextPath}/GetCourse" method="post">
                                        <button type="submit" class="btn btn-link nav-link">HOME</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <form action="${pageContext.request.contextPath}/HomeDocente" method="get">
                                        <button type="submit" class="btn btn-link nav-link">HOME</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/goProfile" method="post">
                                <button type="submit" class="btn btn-link nav-link">PROFILO</button>
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/goEsami" method="post">
                                <button type="submit" class="btn btn-link nav-link" value="CONVALIDA CORSI">ESAMI</button>
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/GetPassedExam" method="GET">
                                <button type="submit" class="btn btn-link nav-link">CORSI COMPLETATI</button>
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

        <main class="clean-block" style="margin-top: 80px;">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <img src="${pageContext.request.contextPath}/assets/img/TestCenter-icdl.png" class="img-fluid rounded shadow" alt="Test Center">
                    </div>
                    <div class="col-md-6">
                        <div class="getting-started-info">
                            <h3>ATLAS ONLINE POSTAZIONE STUDENTE</h3>
                            <p style="color: var(--bs-dark);font-size: 18px;font-family: Montserrat, sans-serif;">
                                ATLAS Online consente di sostenere gli esami direttamente via Internet, utilizzando un browser web, senza la necessità di installare alcun software dedicato o di sincronizzare i risultati finali.<br>
                                Sono disponibili tutti i 7 esami della ICDL Full Standard con i relativi esami di rinnovo.<br>
                                In ATLAS Online la Postazione Studente è disponibile tramite il pulsante "ACCEDI" sottostante. Il candidato potrà accedere alla piattaforma tramite userid (indirizzo email univoco e attivo) e password, che potrà modificare contestualmente al primo accesso e che lo accompagneranno per tutta la durata del percorso di certificazione.
                            </p>
                            <div class="text-center mt-4">
                                <a href="https://atlas-online.icdl.it/" class="btn btn-outline-primary btn-lg" target="_blank">ACCEDI</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </c:otherwise>
</c:choose>

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