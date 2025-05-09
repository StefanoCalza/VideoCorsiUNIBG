<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>${param.title} - VideoCorsi UNIBG</title>
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
        .nav-link {
            color: #333;
            font-weight: 500;
            padding: 0.5rem 1rem;
        }
        .nav-link:hover {
            color: #2d2c38;
        }
        .nav-link.active {
            color: #2d2c38;
            font-weight: 600;
        }
        .navbar-brand {
            font-weight: 700;
            color: #2d2c38;
        }
        .btn-link {
            color: #333;
            text-decoration: none;
            padding: 0.5rem 1rem;
        }
        .btn-link:hover {
            color: #2d2c38;
            text-decoration: none;
        }
        .btn-link.active {
            color: #2d2c38;
            font-weight: 600;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
    <div class="container">
        <a class="navbar-brand logo" href="${pageContext.request.contextPath}/GetCourse">VideoCorsiUNIBG</a>
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
            <span class="visually-hidden">Toggle navigation</span>
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/GetCourse" method="post">
                        <button type="submit" class="btn btn-link nav-link ${param.activePage == 'home' ? 'active' : ''}">HOME</button>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/goProfile" method="post">
                        <button type="submit" class="btn btn-link nav-link ${param.activePage == 'profile' ? 'active' : ''}">PROFILO</button>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/goEsami" method="post">
                        <button type="submit" class="btn btn-link nav-link ${param.activePage == 'exams' ? 'active' : ''}">ESAMI</button>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/GetPassedExam" method="GET">
                        <button type="submit" class="btn btn-link nav-link ${param.activePage == 'passed' ? 'active' : ''}">CORSI COMPLETATI</button>
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
        <jsp:include page="${param.content}" />
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