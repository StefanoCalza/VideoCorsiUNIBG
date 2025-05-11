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
        <a class="navbar-brand logo" href="${pageContext.request.contextPath}/HomeDocente">VideoCorsiUNIBG</a>
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
<section class="clean-block clean-form dark" style="padding: 70px;">
    <div class="container">
        <div class="block-heading">
            <h2>Modifica Capitolo</h2>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/ModificaCapitolo">
            <input type="hidden" name="CourseId" value="${CourseId}">
            <input type="hidden" name="ChapterId" value="${chapter.idChapter}">
            <div class="mb-3">
                <label class="form-label" for="name">Nome Capitolo:</label>
                <input type="text" class="form-control" name="Chaptername" value="${chapter.name}" required>
            </div>
            <div class="mb-3">
                <label class="form-label" for="description">Descrizione:</label>
                <textarea class="form-control" name="Chapterdescription" required>${chapter.description}</textarea>
            </div>
            <div class="mb-3">
                <label class="form-label" for="video">Link Video:</label>
                <input type="text" class="form-control" name="Chaptervideo" value="${chapter.video}">
            </div>
            <div class="mb-3">
                <label class="form-label">Quiz finale?</label>
                <input type="checkbox" name="isFinal" value="1" <c:if test="${chapter.isFinal == 1}">checked</c:if>>
            </div>
            <hr>
            <h4>Domande Quiz</h4>
            <c:if test="${empty quizList}">
                <div class="alert alert-info">Nessuna domanda quiz presente per questo capitolo.</div>
            </c:if>
            <c:forEach items="${quizList}" var="quiz" varStatus="status">
                <div class="mb-3 p-3 border rounded">
                    <label class="form-label">Domanda ${status.index + 1}:</label>
                    <input type="text" class="form-control mb-2" name="quiz_question_${quiz.idQuiz}" value="${quiz.question}" required>
                    <label>Risposte:</label>
                    <ul>
                        <li>A: <input type="text" class="form-control d-inline w-auto" name="quiz_a_${quiz.idQuiz}" value="${quiz.first}" required></li>
                        <li>B: <input type="text" class="form-control d-inline w-auto" name="quiz_b_${quiz.idQuiz}" value="${quiz.second}" required></li>
                        <li>C: <input type="text" class="form-control d-inline w-auto" name="quiz_c_${quiz.idQuiz}" value="${quiz.third}" required></li>
                        <li>D: <input type="text" class="form-control d-inline w-auto" name="quiz_d_${quiz.idQuiz}" value="${quiz.fourth}" required></li>
                    </ul>
                    <label>Risposta corretta:</label>
                    <select class="form-select w-auto d-inline" name="quiz_correct_${quiz.idQuiz}" required>
                        <option value="1" <c:if test="${quiz.risposta == 1}">selected</c:if>>A</option>
                        <option value="2" <c:if test="${quiz.risposta == 2}">selected</c:if>>B</option>
                        <option value="3" <c:if test="${quiz.risposta == 3}">selected</c:if>>C</option>
                        <option value="4" <c:if test="${quiz.risposta == 4}">selected</c:if>>D</option>
                    </select>
                </div>
            </c:forEach>
            <button type="submit" class="btn btn-outline-primary">Salva modifiche</button>
        </form>
    </div>
</section>
<footer class="page-footer dark">
    <div class="footer-copyright">
        <p>2023 Copyright Text</p>
    </div>
</footer>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html> 