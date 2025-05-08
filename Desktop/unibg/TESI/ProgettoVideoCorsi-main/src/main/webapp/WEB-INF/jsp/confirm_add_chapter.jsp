<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Capitolo aggiunto</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <div class="container" style="margin-top: 100px;">
        <div class="alert alert-success" role="alert">
            Capitolo aggiunto con successo!
        </div>
        <div class="mb-3">
            <form method="get" action="${pageContext.request.contextPath}/CreateChapter">
                <input type="hidden" name="CourseId" value="${id_course}">
                <input type="hidden" name="name_course" value="${name_course}">
                <input type="hidden" name="description_corse" value="${description_corse}">
                <button type="submit" class="btn btn-primary">Aggiungi un altro capitolo</button>
            </form>
            <a href="${pageContext.request.contextPath}/GetCourse" class="btn btn-secondary" style="margin-left: 10px;">Torna alla home</a>
        </div>
    </div>
</body>
</html> 