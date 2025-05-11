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


<section class="clean-block clean-info dark" style="padding: 70px; min-height: 80vh;">
    <div class="container">
        <div class="block-heading text-center mb-4">
            <h2 class="fw-bold">AGGIUNGI CAPITOLO</h2>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-sm p-4">
                    <form method="get" action="${pageContext.request.contextPath}/CreateChapter" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label class="form-label" for="name"><i class="fa fa-book"></i> Nome Capitolo</label>
                            <input type="text" class="form-control" name="Chaptername" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="description"><i class="fa fa-align-left"></i> Descrizione Capitolo</label>
                            <input type="text" class="form-control" name="Chapterdescription" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="video"><i class="fa fa-video-camera"></i> Link Video</label>
                            <input type="text" class="form-control" name="Video">
                        </div>
                        <input type="hidden" name="CourseId" value="${id_course}">
                        <input type="hidden" name="description_corse" value="${description_corse}">
                        <input type="hidden" name="name_course" value="${name_course}">
                        <hr class="my-4">
                        <div class="block-heading text-center mb-3">
                            <h3 class="fw-bold">CREA QUIZ/ESAME</h3>
                        </div>
                        <div class="mb-4 text-center">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="isfinal" id="finale" value="1">
                                <label class="form-check-label" for="finale">Esame Finale</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="isfinal" id="quiz" value="0">
                                <label class="form-check-label" for="quiz">Quiz</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <h5 class="fw-semibold mt-3">Domande e Risposte</h5>
                            </div>
                            <!-- Domande quiz -->
                            <c:forEach var="i" begin="1" end="4">
                                <div class="col-12 mb-4 p-3 border rounded bg-light">
                                    <label class="form-label fw-semibold">Domanda ${i}:</label>
                                    <input type="text" class="form-control mb-2" name="d${i}" required>
                                    <div class="row g-2 align-items-center">
                                        <div class="col-12 col-md-6 col-lg-3">
                                            <label class="form-label">Risposta 1</label>
                                            <input type="text" class="form-control" name="r${i}1" required>
                                        </div>
                                        <div class="col-12 col-md-6 col-lg-3">
                                            <label class="form-label">Risposta 2</label>
                                            <input type="text" class="form-control" name="r${i}2" required>
                                        </div>
                                        <div class="col-12 col-md-6 col-lg-3">
                                            <label class="form-label">Risposta 3</label>
                                            <input type="text" class="form-control" name="r${i}3" required>
                                        </div>
                                        <div class="col-12 col-md-6 col-lg-3">
                                            <label class="form-label">Risposta 4</label>
                                            <input type="text" class="form-control" name="r${i}4" required>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <label class="form-label">Risposta corretta</label>
                                        <select class="form-select w-auto d-inline" name="g${i}" required>
                                            <option value="1">Risposta 1</option>
                                            <option value="2">Risposta 2</option>
                                            <option value="3">Risposta 3</option>
                                            <option value="4">Risposta 4</option>
                                        </select>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="text-center mt-4">
                            <button type="submit" class="btn btn-outline-primary btn-lg px-5 text-uppercase">CREA CAPITOLO</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>


<footer class="page-footer dark">
    <div class="footer-copyright">
        <p>© VideoCorsiUNIBG Copyright 2025. All rights reserved.</p>
    </div>
</footer>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/vanilla-zoom.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
	
	
</body>
</html>