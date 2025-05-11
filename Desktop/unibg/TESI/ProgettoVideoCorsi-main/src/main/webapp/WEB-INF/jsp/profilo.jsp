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

<br><br><br><br><br>

<section class="clean-block clean-info dark" style="padding: 70px;">
    <div class="container">
        <div class="block-heading">
            <h2>PROFILO UTENTE</h2>
        </div>
        <div class="row align-items-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <img src="${pageContext.request.contextPath}/assets/img/profilo.jpg" class="img-fluid rounded-circle mb-3" style="max-width: 200px;" alt="Profilo">
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <div class="mb-4">
                            <h4 class="card-title">Informazioni Personali</h4>
                            <hr>
                            <div class="row">
                                <div class="col-md-6">
                                    <p class="mb-3"><strong>Nome:</strong> ${user.name}</p>
                                    <p class="mb-3"><strong>Cognome:</strong> ${me.cognome}</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-3"><strong>Email:</strong> ${user.email}</p>
                                    <p class="mb-3"><strong>Skills Card:</strong> ${user.skillscard}</p>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <form action="${pageContext.request.contextPath}/ChangePassword" method="get">
                                <button type="submit" class="btn btn-outline-primary btn-lg">Cambia Password</button>
                            </form>
                        </div>
                        <c:if test="${param.success == '1'}">
                            <div class="alert alert-success text-center" role="alert">
                                Password modificata con successo!
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
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