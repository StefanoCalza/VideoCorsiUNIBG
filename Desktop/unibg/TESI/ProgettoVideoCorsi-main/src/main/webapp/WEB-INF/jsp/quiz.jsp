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

<nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
    <div class="container">
        <span class="navbar-brand logo">VideoCorsiUNIBG</span>
    </div>
</nav>

<section class="clean-block clean-info dark" style="padding: 70px;">
    <div class="container">
        <div class="block-heading">
            <h2>Quiz</h2>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/CheckQuiz" method="get">
                            <c:forEach items="${quiz}" var="q" varStatus="status">
                                <div class="mb-4 p-3 bg-light rounded">
                                    <h5 class="card-title mb-3">${q.question}</h5>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="radio" name="${q.ids}" value="1" required="required" id="opt1_${status.index}">
                                        <label class="form-check-label" for="opt1_${status.index}">${q.first}</label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="radio" name="${q.ids}" value="2" required="required" id="opt2_${status.index}">
                                        <label class="form-check-label" for="opt2_${status.index}">${q.second}</label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="radio" name="${q.ids}" value="3" required="required" id="opt3_${status.index}">
                                        <label class="form-check-label" for="opt3_${status.index}">${q.third}</label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="radio" name="${q.ids}" value="4" required="required" id="opt4_${status.index}">
                                        <label class="form-check-label" for="opt4_${status.index}">${q.fourth}</label>
                                    </div>
                                    <input type="hidden" name="CourseId" value="${q.idcourse}">
                                    <input type="hidden" name="ChapterId" value="${q.idchapter}">
                                </div>
                            </c:forEach>
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-outline-primary btn-lg">Invia Risposte</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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