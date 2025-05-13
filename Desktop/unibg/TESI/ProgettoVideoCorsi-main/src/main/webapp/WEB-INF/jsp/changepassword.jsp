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

    <style>
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: #f6f6f6;
        }
        main, .main-content, .clean-block {
            flex: 1 0 auto;
        }
        .page-footer {
            flex-shrink: 0;
            background: #222;
            color: #fff;
        }
    </style>

    <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
        <div class="container">
            <span class="navbar-brand logo">VideoCorsiUNIBG</span>
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
                        </c:when>
                        <c:when test="${user.role == 2}">
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
                                <form action="${pageContext.request.contextPath}/GetPassedExam" method="get">
                                    <input type="submit" class="btn btn-link nav-link" value="CORSI COMPLETATI">
                                </form>
                            </li>
                            <li class="nav-item">
                                <form action="${pageContext.request.contextPath}/Logout" method="post">
                                    <input type="submit" class="btn btn-link nav-link" value="LOGOUT">
                                </form>
                            </li>
                        </c:when>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
        
<main class="clean-block clean-info dark" style="padding: 70px; min-height: 80vh; background: #f6f6f6;">
    <div class="container">
        <div class="block-heading text-center mb-4">
            <h2 class="fw-bold">MODIFICA PASSWORD</h2>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8">
                <div class="card shadow-sm p-4">
                    <form action="${pageContext.request.contextPath}/ChangePassword" method="post">
                        <div class="mb-4">
                            <label class="form-label" for="current_pwd"><i class="fa fa-lock"></i> Password attuale</label>
                            <input type="password" class="form-control" name="current_pwd" id="current_pwd" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="new_pwd"><i class="fa fa-key"></i> Nuova password</label>
                            <input type="password" class="form-control" name="new_pwd" id="new_pwd" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="repeat_pwd"><i class="fa fa-key"></i> Ripeti nuova password</label>
                            <input type="password" class="form-control" name="repeat_pwd" id="repeat_pwd" required>
                        </div>
                        <div class="d-grid gap-2 mb-3">
                            <button type="submit" class="btn btn-outline-primary btn-lg text-uppercase">CAMBIA PASSWORD</button>
                        </div>
                        <div style="margin-bottom: 12px;"></div>
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger text-center">${errorMsg}</div>
                        </c:if>
                        <c:if test="${not empty successMsg}">
                            <div class="alert alert-success text-center">${successMsg}</div>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
    

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