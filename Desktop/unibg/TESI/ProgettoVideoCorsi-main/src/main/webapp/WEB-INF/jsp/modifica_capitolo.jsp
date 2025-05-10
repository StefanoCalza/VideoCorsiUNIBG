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
</head>
<body>
<nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
    <div class="container"><a class="navbar-brand logo">VideoCorsiUNIBG</a></div>
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
                    <input type="text" class="form-control mb-2" name="quiz_question_${quiz.idQuiz}" value="${quiz.question}" readonly>
                    <label>Risposte:</label>
                    <ul>
                        <li>A: <input type="text" class="form-control d-inline w-auto" name="quiz_a_${quiz.idQuiz}" value="${quiz.first}" readonly></li>
                        <li>B: <input type="text" class="form-control d-inline w-auto" name="quiz_b_${quiz.idQuiz}" value="${quiz.second}" readonly></li>
                        <li>C: <input type="text" class="form-control d-inline w-auto" name="quiz_c_${quiz.idQuiz}" value="${quiz.third}" readonly></li>
                        <li>D: <input type="text" class="form-control d-inline w-auto" name="quiz_d_${quiz.idQuiz}" value="${quiz.fourth}" readonly></li>
                    </ul>
                    <label>Risposta corretta:</label>
                    <input type="text" class="form-control w-auto d-inline" name="quiz_correct_${quiz.idQuiz}" value="${quiz.risposta}" readonly>
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