<div class="block-heading">
    <h2>CAPITOLI DEL CORSO</h2>
</div>
<div class="row">
    <c:forEach items="${chapters}" var="chapter">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${chapter.name}</h5>
                    <p class="card-text">${chapter.description}</p>
                    <form action="${pageContext.request.contextPath}/gotovideo" method="post">
                        <input type="hidden" name="ChapterId" value="${chapter.id}">
                        <input type="hidden" name="CourseId" value="${courseId}">
                        <button type="submit" class="btn btn-primary">Vai al video</button>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
</div> 