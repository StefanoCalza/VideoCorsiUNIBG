<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PROGETTO VIDEOCORSI</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vanilla-zoom.min.css">
    <style>
        .clean-block {
            padding: 70px 0;
            background-color: #f6f6f6;
        }
        .block-heading {
            padding-top: 50px;
            margin-bottom: 40px;
            text-align: center;
        }
        .block-heading h2 {
            color: #3b99e0;
            font-weight: bold;
        }
        .card {
            margin-bottom: 30px;
            border: none;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            color: #3b99e0;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .card-text {
            color: #666;
            margin-bottom: 20px;
        }
        .btn-primary {
            background-color: #3b99e0;
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #2a7bc0;
            transform: translateY(-2px);
        }
        .navbar {
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .navbar-brand {
            font-weight: bold;
            color: #3b99e0 !important;
        }
        .nav-item {
            margin-right: 10px;
        }
        .nav-item a, .nav-item form {
            color: #333;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .nav-item a:hover, .nav-item form:hover {
            color: #3b99e0;
        }
        .nav-item input[type="submit"] {
            background: none;
            border: none;
            color: #333;
            font-weight: 500;
            padding: 0;
            cursor: pointer;
        }
        .nav-item input[type="submit"]:hover {
            color: #3b99e0;
        }
    </style>
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
                        <input type="submit" value="HOME">
                    </form>
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/goProfile" method="post">
                        <input type="submit" value="PROFILO">
                    </form>
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/goEsami" method="post">
                        <input type="submit" value="ESAMI">
                    </form>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/index.html">
                        <input type="submit" value="LOGOUT">
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="clean-block clean-info dark">
    <div class="container">
        <div class="block-heading">
            <h2>CORSI DISPONIBILI</h2>
        </div>
        <div class="row">
            <c:forEach items="${courses}" var="course">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">${course.name}</h5>
                            <p class="card-text">${course.description}</p>
                            <form action="${pageContext.request.contextPath}/ChapterController" method="post">
                                <input type="hidden" name="CourseId" value="${course.id}">
                                <button type="submit" class="btn btn-primary">Vai al corso</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<jsp:include page="template.jsp">
    <jsp:param name="title" value="Corsi" />
    <jsp:param name="activePage" value="home" />
    <jsp:param name="content" value="course_content.jsp" />
</jsp:include> 