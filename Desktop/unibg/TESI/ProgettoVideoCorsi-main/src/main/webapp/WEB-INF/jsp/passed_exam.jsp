<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Corsi Completati - VideoCorsi UNIBG</title>
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
        .alert {
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
    </style>
</head>
<body>

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
                        <button type="submit" class="btn btn-link nav-link">ESAMI</button>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/GetPassedExam" method="GET">
                        <button type="submit" class="btn btn-link nav-link active">CORSI COMPLETATI</button>
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
        <div class="block-heading">
            <h2>CORSI COMPLETATI</h2>
        </div>
        <div class="row justify-content-center">
            <c:choose>
                <c:when test="${empty passed}">
                    <div class="col-md-8">
                        <div class="alert alert-info text-center" role="alert">
                            <h4 class="alert-heading mb-3">Nessun corso completato</h4>
                            <p class="mb-0">Non hai ancora superato nessun corso. Continua a studiare e completare i quiz finali per vedere qui i tuoi successi!</p>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${passed}" var="course">
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="card h-100">
                                <div class="card-body text-center">
                                    <h3 class="card-title">${course.name}</h3>
                                    <div class="mb-3">
                                        <i class="fa fa-check-circle text-success fa-3x"></i>
                                    </div>
                                    <p class="card-text">Hai superato con successo questo corso!</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>

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