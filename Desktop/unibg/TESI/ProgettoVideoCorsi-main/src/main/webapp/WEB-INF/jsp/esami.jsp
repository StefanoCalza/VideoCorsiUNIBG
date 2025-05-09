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
            transition: transform .2s;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .card:hover {
            transform: translateY(-5px);
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
                <a class="navbar-brand logo" href="#">VideoCorsiUNIBG</a>
                <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
                    <span class="visually-hidden">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/GetCourse" method="post">
                                <button type="submit" class="btn btn-link nav-link">HOME</button>
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/goProfile" method="post">
                                <button type="submit" class="btn btn-link nav-link">PROFILO</button>
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/goEsami" method="post">
                                <button type="submit" class="btn btn-link nav-link active">CONVALIDA CORSI</button>
                            </form>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">LOGOUT</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <main class="clean-block" style="margin-top: 80px;">
            <div class="container">
                <section class="clean-block clean-info dark" style="padding: 70px;">
                    <div class="container">
                        <div class="block-heading">
                            <h2>CONVALIDA CORSI</h2>
                        </div>
                        <c:choose>
                            <c:when test="${not empty userchapter}">
                                <ul>
                                    <c:forEach items="${userchapter}" var="c">
                                        <div class="row align-items-center">
                                            <div class="getting-started-info">
                                                <p style="color: var(--bs-dark);font-size: 18px;font-family: Montserrat, sans-serif;text-align: left;"><strong>CORSO:&nbsp;&nbsp;${c.idcourse}</strong></p>
                                                <p style="color: var(--bs-dark);font-size: 18px;font-family: Montserrat, sans-serif;text-align: left;"><strong>UTENTE:&nbsp;&nbsp;${c.iduser}</strong></p>
                                                <form method="get" action="${pageContext.request.contextPath}/VerifyQuiz" enctype="multipart/form-data">
                                                    <input type="hidden" name="ChapterId" value="${c.idchapter}">
                                                    <input type="hidden" name="CourseId" value="${c.idcourse}">
                                                    <input type="hidden" name="UserId" value="${c.iduser}">
                                                    <button type="submit" value="Submit" class="btn btn-outline-primary btn-lg">CONVALIDA CORSO </button>
                                                </form>
                                                <br><br><br><br>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <div class="alert alert-warning" role="alert">
                                    Nessun esame da convalidare trovato o errore di caricamento dati.
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </section>
            </div>
        </main>
    </c:when>
    <c:otherwise>
        <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
            <div class="container">
                <a class="navbar-brand logo" href="#">VideoCorsiUNIBG</a>
                <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
                    <span class="visually-hidden">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/GetCourse" method="post">
                                <button type="submit" class="btn btn-link nav-link">HOME</button>
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/goProfile" method="post">
                                <button type="submit" class="btn btn-link nav-link">PROFILO</button>
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/goEsami" method="post">
                                <button type="submit" class="btn btn-link nav-link active">ESAMI</button>
                            </form>
                        </li>
                        <li class="nav-item">
                            <form action="${pageContext.request.contextPath}/GetPassedExam" method="GET">
                                <button type="submit" class="btn btn-link nav-link">CORSI COMPLETATI</button>
                            </form>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">LOGOUT</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <main class="clean-block" style="margin-top: 80px;">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <img src="${pageContext.request.contextPath}/assets/img/test_ceneter.jpg" class="img-fluid rounded shadow" alt="Test Center">
                    </div>
                    <div class="col-md-6">
                        <div class="getting-started-info">
                            <h3>ATLAS POSTAZIONE STUDENTE</h3>
                            <p style="color: var(--bs-dark);font-size: 18px;font-family: Montserrat, sans-serif;">
                                <strong>Per eseguire l'esame bisogna utilizzare la piattaforma "ATLAS POSTAZIONE STUDENTI" da installare su ogni PC nelle sedi di esame autorizzate e con la certificazione "Test Center ECDL". In questo modo si apre una piattaforma sicura che permette di poter rilasciare la certificazione in caso di superamento dell'esame.</strong>
                            </p>
                            <div class="text-center mt-4">
                                <a href="https://download-atlas.aicanet.it/00home/home.html" class="btn btn-primary btn-lg">SCARICA QUI</a>
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
        <p>© 2023 VideoCorsi UNIBG</p>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vanilla-zoom.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>

</body>

</html>