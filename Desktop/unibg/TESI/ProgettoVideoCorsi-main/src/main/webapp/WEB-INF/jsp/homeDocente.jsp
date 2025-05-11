<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	
<section class="clean-block clean-info dark" style="padding: 70px;">
        <div class="container">
            <div class="block-heading">
                <h2>TUTTI I CORSI</h2>
            </div>
            <c:if test="${param.success == '3'}">
                <div class="alert alert-success" role="alert">
                    Corso eliminato con successo!
                </div>
            </c:if>
            <div class="row">
                <c:if test="${empty allCourses}">
                    <div class="alert alert-info" role="alert">
                        Nessun corso disponibile al momento.
                    </div>
                </c:if>
                <c:forEach items="${allCourses}" var="corso">
                    <div class="col-md-6 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">${corso.name}</h3>
                                <p class="card-text"><strong>${corso.description}</strong></p>
                                <form method="get" action="${pageContext.request.contextPath}/GestisciCorso" style="display:inline-block;">
                                    <input type="hidden" name="CourseId" value="${corso.idCourse}">
                                    <button type="submit" class="btn btn-outline-success">Gestisci corso</button>
                                </form>
                                <form method="post" action="${pageContext.request.contextPath}/EliminaCorso" style="display:inline-block; margin-left: 8px;">
                                    <input type="hidden" name="CourseId" value="${corso.idCourse}">
                                    <button type="submit" class="btn btn-outline-danger" onclick="return confirm('Sei sicuro di voler eliminare questo corso, tutti i capitoli e i quiz associati? L\'operazione è irreversibile.');">Elimina corso</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

<section class="clean-block clean-form dark">
    <div class="container">
        <div class="block-heading text-center mb-4">
            <h2 class="fw-bold">CREA CORSO</h2>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-lg border-0">
                    <div class="card-body p-4">
                        <form method="get" action="${pageContext.request.contextPath}/Createcourse" enctype="multipart/form-data">
                            <div class="mb-4">
                                <label class="form-label" for="name_course">Nome corso</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-white"><i class="fa fa-book"></i></span>
                                    <input type="text" class="form-control" id="name_course" name="name_course" required autocomplete="off">
                                </div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="description_corse">Descrizione corso</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-white"><i class="fa fa-align-left"></i></span>
                                    <input type="text" class="form-control" id="description_corse" name="description_corse" required autocomplete="off">
                                </div>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" value="Submit" class="btn btn-primary btn-lg">CREA CORSO</button>
                            </div>
                        </form>
                    </div>
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