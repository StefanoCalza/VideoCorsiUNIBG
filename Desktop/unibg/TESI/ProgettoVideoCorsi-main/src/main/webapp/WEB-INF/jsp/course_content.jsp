<div class="block-heading">
    <h2>CORSI DISPONIBILI</h2>
</div>
<div class="row">
    <c:forEach items="${courses}" var="course">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${course.name}</h5>
                    <p class="card-text">${course.description}</p>
                    <form action="${pageContext.request.contextPath}/ChapterController" method="post">
                        <input type="hidden" name="CourseId" value="${course.id}">
                        <button type="submit" class="btn btn-primary">Vai al corso</button>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
</div> 