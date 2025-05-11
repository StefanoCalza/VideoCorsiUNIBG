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
<script>
(function(){if(!window.chatbase||window.chatbase("getState")!=="initialized"){window.chatbase=(...arguments)=>{if(!window.chatbase.q){window.chatbase.q=[]}window.chatbase.q.push(arguments)};window.chatbase=new Proxy(window.chatbase,{get(target,prop){if(prop==="q"){return target.q}return(...args)=>target(prop,...args)}})}const onLoad=function(){const script=document.createElement("script");script.src="https://www.chatbase.co/embed.min.js";script.id="QMOmt8V4IC-Q9QzLK9-Zl";script.domain="www.chatbase.co";document.body.appendChild(script)};if(document.readyState==="complete"){onLoad()}else{window.addEventListener("load",onLoad)}})();
</script>
</body> 