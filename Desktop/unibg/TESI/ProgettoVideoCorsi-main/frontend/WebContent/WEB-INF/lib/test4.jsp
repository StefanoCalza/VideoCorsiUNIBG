<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>bootstrap_VC</title>
    <link rel="stylesheet" href="Graphic/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="Graphic/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel="stylesheet" href="Graphic/assets/css/vanilla-zoom.min.css">
</head>
</head>
<body>

<nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
        <div class="container"><a class="navbar-brand logo" href="index.html">VideoCorsiUNIBG</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="Alunni.html">corsi</a></li>
                    <li class="nav-item"><a class="nav-link" href="Esami.html">esami</a></li>
                    <li class="nav-item"><a class="nav-link" href="Profilo.html">PROFILO</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.html">LOGOUT</a></li>
                    <li > <form action="gohome" method="post"> <input type="submit" value="home"> <p th:text=" ${errorMsg}"></p> </form> </li>
					<li > <form action="GetCourse" method="post"> <input type="submit" value="esami"> <p th:text=" ${errorMsg}"></p> </form> </li>
                </ul>
            </div>
        </div>
    </nav>


<section class="clean-block clean-info dark" style="padding: 70px;">
        <div class="container">
            <div class="block-heading">
                <h2>IT SECURITY</h2>
            </div>
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h3>CAPITOLO 1</h3>
                    <div class="getting-started-info">
                        <p style="color: var(--bs-dark);font-size: 18px;font-family: Montserrat, sans-serif;text-align: left;"><strong>INTRODUZIONE:</strong><br><strong>La sicurezza informatica è un argomento di vasta portata, che tocca molti aspetti dell'attività individuale in ambito ICT. IT Security aiuta a fornire alle persone le competenze necessarie per identificare e trattare le minacce associate all'uso delle tecnologie informatiche, migliorando la loro capacità di gestire in modo sicuro i propri dati ed i dati delle organizzazioni per cui lavorano.</strong></p>
                    </div>
                </div>
                <ul>
			<div class="col"> <c:forEach items="${chapter}" var="chara">
			<form method="get" action="GetQuiz" enctype="multipart/form-data">
				 <input type="hidden" name="CourseId" value="${chara.idCourse}">
				  <input type="hidden" name="ChapterId" value="${chara.idChapter}">
				  <button type="submit" value="Submit"> Vai al VIDEO </button>
				</form>
					</c:forEach>
					</ul> </div>
            </div>
    </section>

    
${charapter}

	<ul>
	<c:forEach items="${chapter}" var="chara">
	
	
	
	<li>
	
	
	 numero del corso ->   ${chara.idCourse}   numero del capitolo ->  ${chara.idChapter}  video ->  <iframe width="420" height="315"
src="${chara.video }">
</iframe> 
<form method="get" action="GetQuiz" enctype="multipart/form-data">
 <input type="hidden" name="CourseId" value="${chara.idCourse}"><br><br>
  <input type="hidden" name="ChapterId" value="${chara.idChapter}"><br><br>
  <button type="submit" value="Submit">quiz </button>
</form> </li>
	</c:forEach>
	</ul>
	

<br><br><br>

<footer class="page-footer dark">
        <div class="footer-copyright">
            <p>© 2023 Copyright Text</p>
        </div>
    </footer>
    <script src="Graphic/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script src="Graphic/assets/js/vanilla-zoom.js"></script>
    <script src="Graphic/assets/js/theme.js"></script>
    
	

</body>
</html>