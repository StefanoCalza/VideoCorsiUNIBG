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
        <div class="container"><a class="navbar-brand logo">VideoCorsiUNIBG</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav ms-auto">
           <%--      	<li > <form action="GetCourse" method="post"> <input type="submit" style="border:0px; background:white;" value="HOME&nbsp&nbsp"> <p th:text=" ${errorMsg}"></p> </form> </li>
               		<li > <form action="goProfile" method="post"> <input type="submit" style="border:0px; background:white;" value="PROFILO&nbsp&nbsp"> <p th:text=" ${errorMsg}"></p> </form> </li>
                    <li > <form action="goEsami" method="post"> <input type="submit" style="border:0px; background:white;" value="ESAMI&nbsp&nbsp"> <p th:text=" ${errorMsg}"></p> </form> </li>
                    <li> <a href="index.html"><input type="submit" style="border:0px; background:white;" value="LOGOUT&nbsp&nbsp"></a></li>
            --%>     </ul>
            </div>
        </div>
    </nav>
     
    <br><br>
    
    
    <section class="clean-block clean-info dark" style="padding: 70px;">
        
        <div class="container mt-5">
        <div class="d-flex justify-content-center row">
            <div class="col-md-10 col-lg-10">
                <div class="border">
                    <div class="question bg-white p-3 border-bottom">
                        <div class="d-flex flex-row justify-content-between align-items-center mcq">
                            <h4>Quiz</h4></div>
                    </div>
                    
                    <div class="question bg-white p-3 border-bottom">
                        <div class="d-flex flex-row align-items-center question-title">
                        </div><div class="ans ml-2">
<label>
<form action="CheckQuiz">
  <fieldset>
  <c:forEach items="${quiz}" var="q">
    <div>
     <legend>${q.question }</legend>
      <input type="radio"  name="${q.ids }" value="1" required="required" /> <label for="contactChoice1"> ${q.first} </label> <br>

      <input type="radio"  name="${q.ids }" value="2" required="required"/> <label for="contactChoice2">${q.second} </label> <br>

      <input type="radio"  name="${q.ids }" value="3" required="required"/> <label for="contactChoice3"> ${q.third} </label> <br>
      
       <input type="radio" id="contactChoice4" name="${q.ids }" value="4" required="required"/> <label for="contactChoice3"> ${q.fourth}  </label>
      
      <input type="hidden" name="CourseId" value="${q.idcourse}"><br><br>
  <input type="hidden" name="ChapterId" value="${q.idchapter}"><br><br>
    </c:forEach>
    </div>
    <div>
     
      <button type="submit" class="btn btn-outline-primary btn-lg">Submit</button>
    </div>
  </fieldset>
</form>
</label>    
</div></div>
            </div>
        </div>
    </div>
                                  
    </section>
	
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