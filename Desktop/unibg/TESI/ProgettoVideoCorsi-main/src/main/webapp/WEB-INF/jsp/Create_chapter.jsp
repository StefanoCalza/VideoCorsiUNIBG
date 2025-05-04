<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PROGETTO VIDEOCORSI</title>
    <link rel="stylesheet" href="Graphic/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="Graphic/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel="stylesheet" href="Graphic/assets/css/vanilla-zoom.min.css">
</head>

<body>


<nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
        <div class="container"><a class="navbar-brand logo" href="index.html">VideoCorsiUNIBG</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav ms-auto">
                	<li > <form action="GetCourse" method="post"> <input type="submit" style="border:0px; background:white;" value="HOME&nbsp&nbsp"> <p th:text=" ${errorMsg}"></p> </form> </li>
               		<li > <form action="goProfile" method="post"> <input type="submit" style="border:0px; background:white;" value="PROFILO&nbsp&nbsp"> <p th:text=" ${errorMsg}"></p> </form> </li>
                    <li > <form action="goEsami" method="post"> <input type="submit" style="border:0px; background:white;" value="ESAMI&nbsp&nbsp"> <p th:text=" ${errorMsg}"></p> </form> </li>
                   <li> <a href="index.html"><input type="submit" style="border:0px; background:white;" value="LOGOUT&nbsp&nbsp"></a></li>
                </ul>
            </div>
        </div>
    </nav>


<section class="clean-block clean-info dark" style="padding: 70px;">
        <div class="container">
            <div class="block-heading">
                       <section class="clean-block clean-form dark">
                        <div class="container">
                            <div class="block-heading"></div>
                            <h2>AGGIUNGI CAPITOLO</h2>
                            <form method="get" action="CreateChapter" enctype="multipart/form-data">
                                <div class="mb-3"><label class="form-label" for="name">NOME CAPITOLO:&nbsp&nbsp</label><input type="text" name="Chaptername"></div>
                                <div class="mb-3"><label class="form-label" for="subject">DESCRIZIONE CAPITOLO:&nbsp&nbsp</label><input type="text" name="Chapterdescription"></div>
                                <div class="mb-3"><label class="form-label" for="subject">LINK VIDEO:&nbsp&nbsp</label><input type="text" name="Video"></div>
                                <div class="mb-3"></div> 
                            
                                <input type="hidden" name="CourseId" value="${id_course}">
								<input type="hidden" name="description_corse" value="${description_corse}" >
								<input type="hidden" name="name_course" value="${name_course}" >
				<br><br>
							<section class="clean-block clean-form dark">
		                        <div class="container">
		                            <div class="block-heading"></div>
								<h2>ESAME</h2>
								
								  FINALE <input type="radio" name="isfinal" value="1" >
								  QUIZ <input type="radio" name="isfinal" value="0" ><br><br>
								  
								  <div class="mb-3"><label class="form-label" for="name">PRIMA DOMANDA:&nbsp&nbsp</label><input type="text" name="d1"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA1:&nbsp&nbsp</label><input type="text" name="r11"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA2:&nbsp&nbsp</label><input type="text" name="r12"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA3:&nbsp&nbsp</label><input type="text" name="r13"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA4:&nbsp&nbsp</label><input type="text" name="r14"></div>
								  RISPOSTA GIUSTA: <select name="g1">
								    <option value="1">RISPOSTA1</option>
								    <option value="2">RISPOSTA2</option>
								    <option value="3">RISPOSTA3</option>
								    <option value="4">RISPOSTA4</option>
								    </select>	
								  <br><br><br><br>	
								  
								  <div class="mb-3"><label class="form-label" for="name">SECONDA DOMANDA:&nbsp&nbsp</label><input type="text" name="d2"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA1:&nbsp&nbsp</label><input type="text" name="r21"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA2:&nbsp&nbsp</label><input type="text" name="r22"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA3:&nbsp&nbsp</label><input type="text" name="r23"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA4:&nbsp&nbsp</label><input type="text" name="r24"></div>
								  RISPOSTA GIUSTA: <select name="g2">
								    <option value="1">RISPOSTA1</option>
								    <option value="2">RISPOSTA2</option>
								    <option value="3">RISPOSTA3</option>
								    <option value="4">RISPOSTA4</option>
								    </select>	
								  <br><br><br><br>	
								  
								  <div class="mb-3"><label class="form-label" for="name">TERZA DOMANDA:&nbsp&nbsp</label><input type="text" name="d3"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA1:&nbsp&nbsp</label><input type="text" name="r31"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA2:&nbsp&nbsp</label><input type="text" name="r32"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA3:&nbsp&nbsp</label><input type="text" name="r33"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA4:&nbsp&nbsp</label><input type="text" name="r34"></div>
								  RISPOSTA GIUSTA: <select name="g3">
								    <option value="1">RISPOSTA1</option>
								    <option value="2">RISPOSTA2</option>
								    <option value="3">RISPOSTA3</option>
								    <option value="4">RISPOSTA4</option>
								    </select>	
								  <br><br><br><br>	
								  
								  <div class="mb-3"><label class="form-label" for="name">QUARTA DOMANDA:&nbsp&nbsp</label><input type="text" name="d4"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA1:&nbsp&nbsp</label><input type="text" name="r41"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA2:&nbsp&nbsp</label><input type="text" name="r42"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA3:&nbsp&nbsp</label><input type="text" name="r43"></div>
								  <div class="mb-3"><label class="form-label" for="name">RISPOSTA4:&nbsp&nbsp</label><input type="text" name="r44"></div>
								  RISPOSTA GIUSTA: <select name="g4">
								    <option value="1">RISPOSTA1</option>
								    <option value="2">RISPOSTA2</option>
								    <option value="3">RISPOSTA3</option>
								    <option value="4">RISPOSTA4</option>
								    </select>	
								  <br><br><br><br><br><br>

								   <button type="submit" value="Submit" class="btn btn-outline-primary btn-lg">CREA CAPITOLO </button>
									</form>	
									</div>
									</div>        
									</section>  
									</section> 

	
<!--
	<ul>
	<c:forEach items="${userchapter}" var="c">
	<li>
	
	 numero del corso ->   ${c.idcourse}   <br>
	 numero del capitolo ->  ${c.idchapter} <br>
	 numero dell'utente ->  ${c.iduser} <br> 
<form method="get" action="VerifyQuiz" enctype="multipart/form-data"> 
 <input type="hidden" name="ChapterId" value="${c.idchapter}"><br><br>
  <input type="hidden" name="CourseId" value="${c.idcourse}"><br><br>
  <input type="hidden" name="UserId" value="${c.iduser}"><br><br>
  <button type="submit" value="Submit">passare esame </button>
</form> </li>----------------------------------------------------------------------------------------------------------------------------
	</c:forEach>
	</ul>
	
	crea corso
<form method="get" action="Createcourse" enctype="multipart/form-data">
nome corso: <input type="text" name="name_course" required> <br>
descrizione corso: <input type="text" name="description_corse" required> <br>
<br>
<h2>quiz finale</h2> <br>
 <button type="submit" value="Submit">crea esame </button>
</form>	
	-->
	
	
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