<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Modifica Capitolo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar-custom.css">
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
            <h2 class="fw-bold">MODIFICA CAPITOLO</h2>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-sm p-4">
                    <form method="post" action="${pageContext.request.contextPath}/ModificaCapitolo">
                        <input type="hidden" name="CourseId" value="${CourseId}">
                        <input type="hidden" name="ChapterId" value="${chapter.idChapter}">
                        <div class="mb-3">
                            <label class="form-label" for="name"><i class="fa fa-book"></i> Nome Capitolo</label>
                            <input type="text" class="form-control" name="Chaptername" value="${chapter.name}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="description"><i class="fa fa-align-left"></i> Descrizione Capitolo</label>
                            <input type="text" class="form-control" name="Chapterdescription" value="${chapter.description}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="video"><i class="fa fa-video-camera"></i> Link Video</label>
                            <input type="text" class="form-control" name="Chaptervideo" value="${chapter.video}">
                        </div>
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="isFinal" value="1" id="isFinal" <c:if test="${chapter.isFinal == 1}">checked</c:if>>
                                <label class="form-check-label" for="isFinal">Test finale?</label>
                            </div>
                        </div>
                        <hr class="my-4">
                        <div class="block-heading text-center mb-3">
                            <h3 class="fw-bold">MODIFICA DOMANDE</h3>
                        </div>
                        <div class="row">
                            <c:if test="${empty quizList}">
                                <div class="alert alert-info">Nessuna domanda quiz presente per questo capitolo.</div>
                            </c:if>
                            <c:forEach items="${quizList}" var="quiz" varStatus="status">
                                <div class="col-12 mb-4 p-3 border rounded bg-light">
                                    <label class="form-label fw-semibold">Domanda ${status.index + 1}:</label>
                                    <input type="text" class="form-control mb-2" name="quiz_question_${quiz.idQuiz}" value="${quiz.question}" required>
                                    <div class="row g-2 align-items-center">
                                        <div class="col-12 col-md-6 col-lg-3">
                                            <label class="form-label">Risposta 1</label>
                                            <input type="text" class="form-control" name="quiz_a_${quiz.idQuiz}" value="${quiz.first}" required>
                                        </div>
                                        <div class="col-12 col-md-6 col-lg-3">
                                            <label class="form-label">Risposta 2</label>
                                            <input type="text" class="form-control" name="quiz_b_${quiz.idQuiz}" value="${quiz.second}" required>
                                        </div>
                                        <div class="col-12 col-md-6 col-lg-3">
                                            <label class="form-label">Risposta 3</label>
                                            <input type="text" class="form-control" name="quiz_c_${quiz.idQuiz}" value="${quiz.third}" required>
                                        </div>
                                        <div class="col-12 col-md-6 col-lg-3">
                                            <label class="form-label">Risposta 4</label>
                                            <input type="text" class="form-control" name="quiz_d_${quiz.idQuiz}" value="${quiz.fourth}" required>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <label class="form-label">Risposta corretta</label>
                                        <select class="form-select w-auto d-inline" name="quiz_correct_${quiz.idQuiz}" required>
                                            <option value="1" <c:if test="${quiz.risposta == 1}">selected</c:if>>Risposta 1</option>
                                            <option value="2" <c:if test="${quiz.risposta == 2}">selected</c:if>>Risposta 2</option>
                                            <option value="3" <c:if test="${quiz.risposta == 3}">selected</c:if>>Risposta 3</option>
                                            <option value="4" <c:if test="${quiz.risposta == 4}">selected</c:if>>Risposta 4</option>
                                        </select>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="text-center mt-4">
                            <button type="submit" class="btn btn-outline-primary btn-lg px-5 text-uppercase">SALVA MODIFICHE</button>
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
<script>
(function(){if(!window.chatbase||window.chatbase("getState")!=="initialized"){window.chatbase=(...arguments)=>{if(!window.chatbase.q){window.chatbase.q=[]}window.chatbase.q.push(arguments)};window.chatbase=new Proxy(window.chatbase,{get(target,prop){if(prop==="q"){return target.q}return(...args)=>target(prop,...args)}})}const onLoad=function(){const script=document.createElement("script");script.src="https://www.chatbase.co/embed.min.js";script.id="QMOmt8V4IC-Q9QzLK9-Zl";script.domain="www.chatbase.co";document.body.appendChild(script)};if(document.readyState==="complete"){onLoad()}else{window.addEventListener("load",onLoad)}})();
</script>
</body>
</html> 