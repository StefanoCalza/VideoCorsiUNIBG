<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .modulo-title {
            font-weight: bold;
            font-size: 1.1rem;
            display: block;
            margin-top: 1rem;
            margin-bottom: 0.2rem;
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
                    <form action="${pageContext.request.contextPath}/goLogin" method="post">
                        <input type="submit" class="btn btn-link nav-link" value="LOGIN">
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
        
    <main class="page landing-page">
        <section class="clean-block clean-hero" style="color: rgba(9,162,255,0);padding:0;background:transparent;min-height:auto;height:auto;">
            <img src="${pageContext.request.contextPath}/assets/img/wide_icdl.png" class="img-fluid" style="width: 100%; height: auto; display: block;">
        </section>
        <section class="clean-block clean-info dark" style="margin-bottom: -121px;">
            <div class="container">
                <div class="block-heading">
                    <h2 class="text-info">CORSI</h2>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-5 d-flex justify-content-center mb-4 mb-md-0">
                        <img src="${pageContext.request.contextPath}/assets/img/icdl_fullStandard.jpeg" class="img-fluid rounded shadow" style="width: 350px; max-width: 100%; height: auto;">
                    </div>
                    <div class="col-md-7">
                        <div class="getting-started-info p-4" style="background: #fff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
                            <p style="font-size: 1.1rem; margin-bottom: 0;">
                                La certificazione ICDL è composta da 7 moduli:<br>
                                <span class="modulo-title">ICDL Base:</span> copre le competenze digitali fondamentali:
                                <ul style="margin-bottom: 0.5rem;">
                                    <li>Computer Essentials (concetti di base e uso del computer)</li>
                                    <li>Online Essentials (navigazione e comunicazione su internet)</li>
                                    <li>Word Processing (videoscrittura)</li>
                                    <li>Spreadsheets (fogli di calcolo)</li>
                                </ul>
                                <span class="modulo-title">ICDL Standard:</span> copre competenze più avanzate e specifiche:
                                <ul style="margin-bottom: 0;">
                                    <li>Presentation (creazione di presentazioni)</li>
                                    <li>IT Security (sicurezza informatica)</li>
                                    <li>Online Collaboration (strumenti di collaborazione online)</li>
                                </ul>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="clean-block clean-info dark">
            <div class="container">
                <div class="block-heading">
                    <h2 class="text-info">ESAMI</h2>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <img src="${pageContext.request.contextPath}/assets/img/TestCenter-icdl.png" style="width: 586px;">
                    </div>
                    <div class="col-md-6">
                        <div class="getting-started-info">
                            <p style="width: 667px;font-size: 21px;">
                                La Patente ICDL (International Certification of Digital Literacy), è una certificazione riconosciuta a livello internazionale che attesta le competenze informatiche di base e avanzate di una persona ed è inoltre riconosciuta nei Protocolli di Intesa stipulati con le Amministrazioni Pubbliche.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="clean-block about-us">
            <div class="container">
                <div class="block-heading">
                    <h2 class="text-info">FORMATORI</h2>
                </div>
                <div class="row justify-content-center">
                    <div class="col-sm-6 col-lg-4">
                        <div class="card text-center clean-card">
                            <img class="card-img-top w-100 d-block" src="${pageContext.request.contextPath}/assets/img/avatars/avatar2.jpg">
                            <div class="card-body info">
                                <h4 class="card-title">Stefano Calzà</h4>
                                <p class="card-text">IT Security, Computer Essential, Online Essential, Online Collaboration</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4">
                        <div class="card text-center clean-card">
                            <img class="card-img-top w-100 d-block" src="${pageContext.request.contextPath}/assets/img/avatars/avatar3.jpg">
                            <div class="card-body info">
                                <h4 class="card-title">Martina Rasmo</h4>
                                <p class="card-text">Microsoft Office:<br>Word, Power Point, Excell</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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