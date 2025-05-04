<div class="block-heading">
    <h2>${namec}</h2>
    <h3>${charaname}</h3>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="ratio ratio-16x9 mb-4">
            <iframe src="https://www.youtube.com/embed/${video}" allowfullscreen=""></iframe>
        </div>
        <form method="get" action="${pageContext.request.contextPath}/GetQuiz">
            <input type="hidden" name="CourseId" value="${CourseId}">
            <input type="hidden" name="ChapterId" value="${ChapterId}">
            <div class="text-center">
                <button type="submit" class="btn btn-primary btn-lg">Vai al QUIZ</button>
            </div>
        </form>
    </div>
</div> 