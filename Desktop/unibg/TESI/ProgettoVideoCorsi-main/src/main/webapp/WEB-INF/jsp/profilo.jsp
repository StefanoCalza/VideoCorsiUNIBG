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
        }
    </style>
</head>
<body>

<nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
    <div class="container">
        <span class="navbar-brand logo">VideoCorsiUNIBG</span>
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

<main class="clean-block clean-info dark" style="padding: 70px;">
    <div class="container">
        <div class="block-heading mb-4">
            <h2>PROFILO UTENTE</h2>
        </div>
        <div class="row align-items-center">
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <img src="${not empty user.profileImage ? pageContext.request.contextPath.concat(user.profileImage) : pageContext.request.contextPath.concat('/assets/img/profilo.jpg')}" alt="Immagine profilo" class="rounded-circle shadow mb-3" style="width: 180px; height: 180px; object-fit: cover; border: 3px solid #007bff;">
                        <form id="profileImageForm" action="${pageContext.request.contextPath}/UploadProfileImage" method="post" enctype="multipart/form-data" class="mt-3">
                            <input type="file" name="profileImage" accept="image/*" id="profileImageInput" style="display:none;" required onchange="handleProfileImageChange(event)">
                            <button type="button" class="btn btn-outline-primary btn-lg px-4 py-2" style="font-size:1.2em;" onclick="document.getElementById('profileImageInput').click()">Cambia immagine</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-8 d-flex align-items-center" style="min-height: 180px;">
                <div class="card h-100 w-100 d-flex flex-column justify-content-center" style="min-height: 180px;">
                    <div class="card-body">
                        <div class="mb-4">
                            <h4 class="card-title">Informazioni Personali</h4>
                            <hr>
                            <div class="row">
                                <div class="col-md-6">
                                    <p class="mb-3"><strong>Nome:</strong> ${user.name}</p>
                                    <p class="mb-3"><strong>Cognome:</strong> ${user.cognome}</p>
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
                        <div style="margin-bottom: 18px;"></div>
                        <c:if test="${param.success == '1'}">
                            <div class="alert alert-success text-center" role="alert">
                                Password modificata con successo!
                            </div>
                        </c:if>
                        <div id="profileImageError" class="alert alert-danger text-center" role="alert" style="display:none; margin-top:10px;">
                            L'immagine è troppo grande. Il limite massimo è 2MB.
                        </div>
                    </div>
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

function handleProfileImageChange(event) {
    const file = event.target.files[0];
    const errorDiv = document.getElementById('profileImageError');
    if (file && file.size > 2 * 1024 * 1024) {
        errorDiv.style.display = 'block';
        event.target.value = '';
    } else if (file) {
        errorDiv.style.display = 'none';
        document.getElementById('profileImageForm').submit();
    } else {
        errorDiv.style.display = 'none';
    }
}
</script>

</body>
</html>