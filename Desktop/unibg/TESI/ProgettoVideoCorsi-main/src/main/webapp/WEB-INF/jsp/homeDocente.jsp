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
                                <form method="get" action="${pageContext.request.contextPath}/GestisciCorso">
                                    <input type="hidden" name="CourseId" value="${corso.idCourse}">
                                    <button type="submit" class="btn btn-outline-success">Gestisci corso</button>
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
                            <div class="block-heading"></div>
                            <h2>CREA CORSO</h2>
                            <form method="get" action="${pageContext.request.contextPath}/Createcourse" enctype="multipart/form-data">
                                <div class="mb-3"><label class="form-label" for="name">NOME CORSO:&nbsp&nbsp</label><input type="text" name="name_course" required></div>
                                <div class="mb-3"><label class="form-label" for="subject">DESCRIZIONE CORSO:&nbsp&nbsp</label><input type="text" name="description_corse" required></div>
                                <div class="mb-3"></div>
                                </section>  

 <button type="submit" value="Submit" class="btn btn-outline-primary btn-lg">CREA CORSO </button>
</form>	
</div>
</div>        
</section>  



<footer class="page-footer dark">
        <div class="footer-copyright">
            <p> 2023 Copyright Text</p>
        </div>
    </footer>
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/vanilla-zoom.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
	
	
</body>
</html>