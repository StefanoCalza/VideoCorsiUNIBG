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
        <div class="container"><a class="navbar-brand logo">VideoCorsiUNIBG</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav ms-auto">
                	<li > <form action="GetCourse" method="post"> <input type="submit" style="border:0px; background:white;" value="HOME&nbsp&nbsp"> <p th:text=" ${errorMsg}"></p> </form> </li>
               		<li > <form action="goProfile" method="post"> <input type="submit" style="border:0px; background:white;" value="PROFILO&nbsp&nbsp"> <p th:text=" ${errorMsg}"></p> </form> </li>
                    <li > <form action="goEsami" method="post"> <input type="submit" style="border:0px; background:white;" value="ESAMI&nbsp&nbsp"> <p th:text=" ${errorMsg}"></p> </form> </li>
                    <li> <a href="index.jsp"><input type="submit" style="border:0px; background:white;" value="LOGOUT&nbsp&nbsp"></a></li>
                </ul>
            </div>
        </div>
    </nav>

<section class="clean-block clean-info dark" style="padding: 70px;">
    <div class="container">
        <div class="block-heading">
            <h2>${namec}</h2>
        </div>
        <div class="row">
            <c:forEach items="${chapter}" var="chara">
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title">${chara.name}</h3>
                            <p class="card-text"><strong>${chara.description}</strong></p>
                            <form method="post" action="gotovideo" enctype="multipart/form-data">
                                <input type="hidden" name="CourseId" value="${chara.idCourse}">
                                <input type="hidden" name="ChapterId" value="${chara.idChapter}">
                                <input type="hidden" name="coursename" value="${namec}">
                                <input type="hidden" name="video" value="${chara.video}">
                                <input type="hidden" name="charaname" value="${chara.name}">
                                <button type="submit" value="Submit" class="btn btn-outline-primary">VAI AL VIDEO</button>
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