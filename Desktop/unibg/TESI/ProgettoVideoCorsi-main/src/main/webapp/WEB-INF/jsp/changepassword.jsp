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
                    <c:choose>
                        <c:when test="${user.role == 1}">
                            <li class="nav-item">
                                <form action="${pageContext.request.contextPath}/HomeDocente" method="get">
                                    <input type="submit" style="border:0px; background:white;" value="HOME&nbsp&nbsp">
                                </form>
                            </li>
                            <li class="nav-item">
                                <form action="${pageContext.request.contextPath}/goProfile" method="post">
                                    <input type="submit" style="border:0px; background:white;" value="PROFILO&nbsp&nbsp">
                                </form>
                            </li>
                            <li class="nav-item">
                                <form action="${pageContext.request.contextPath}/goEsami" method="post">
                                    <input type="submit" style="border:0px; background:white;" value="CONVALIDA CORSI&nbsp&nbsp">
                                </form>
                            </li>
                        </c:when>
                        <c:when test="${user.role == 2}">
                            <li class="nav-item">
                                <form action="${pageContext.request.contextPath}/GetCourse" method="post">
                                    <input type="submit" style="border:0px; background:white;" value="HOME&nbsp&nbsp">
                                </form>
                            </li>
                            <li class="nav-item">
                                <form action="${pageContext.request.contextPath}/goProfile" method="post">
                                    <input type="submit" style="border:0px; background:white;" value="PROFILO&nbsp&nbsp">
                                </form>
                            </li>
                            <li class="nav-item">
                                <form action="${pageContext.request.contextPath}/goEsami" method="post">
                                    <input type="submit" style="border:0px; background:white;" value="ESAMI&nbsp&nbsp">
                                </form>
                            </li>
                            <li class="nav-item">
                                <form action="${pageContext.request.contextPath}/GetPassedExam" method="GET">
                                    <input type="submit" style="border:0px; background:white;" value="CORSI COMPLETATI&nbsp&nbsp">
                                </form>
                            </li>
                        </c:when>
                    </c:choose>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/index.jsp">
                            <input type="submit" style="border:0px; background:white;" value="LOGOUT&nbsp&nbsp">
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
        
<section class="clean-block clean-form dark" style="padding: 84px;">
        <div class="container">
            <div class="block-heading">
                <h2 class="text-info">Modifica Password</h2>
                <p></p>
            </div>
            <form action="ChangePassword" method="POST">
                <div class="mb-3">
                    <label class="form-label" for="current_pwd">Password attuale</label>
                    <input type="password" class="form-control" name="current_pwd" id="current_pwd" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_pwd">Nuova password</label>
                    <input type="password" class="form-control" name="new_pwd" id="new_pwd" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="repeat_pwd">Ripeti nuova password</label>
                    <input type="password" class="form-control" name="repeat_pwd" id="repeat_pwd" required>
                </div>
                <div class="mb-3">
                    <button type="submit" class="btn btn-outline-primary">Cambia password</button>
                </div>
                <c:if test="${not empty errorMsg}">
                    <div class="alert alert-danger">${errorMsg}</div>
                </c:if>
                <c:if test="${not empty successMsg}">
                    <div class="alert alert-success">${successMsg}</div>
                </c:if>
            </form>
        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br>
    </section>
    

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