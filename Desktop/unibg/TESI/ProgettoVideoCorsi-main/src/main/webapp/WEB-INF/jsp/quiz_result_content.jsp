<div class="block-heading">
    <h2>RISULTATI QUIZ</h2>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <h3 class="card-title">Punteggio: ${score}%</h3>
                <c:if test="${score >= 60}">
                    <div class="alert alert-success">
                        <i class="fa fa-check-circle"></i> Complimenti! Hai superato il quiz.
                    </div>
                </c:if>
                <c:if test="${score < 60}">
                    <div class="alert alert-danger">
                        <i class="fa fa-times-circle"></i> Non hai superato il quiz. Riprova!
                    </div>
                </c:if>
                <form action="${pageContext.request.contextPath}/ChapterController" method="post">
                    <input type="hidden" name="CourseId" value="${CourseId}">
                    <button type="submit" class="btn btn-primary">Torna al corso</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
(function(){if(!window.chatbase||window.chatbase("getState")!=="initialized"){window.chatbase=(...arguments)=>{if(!window.chatbase.q){window.chatbase.q=[]}window.chatbase.q.push(arguments)};window.chatbase=new Proxy(window.chatbase,{get(target,prop){if(prop==="q"){return target.q}return(...args)=>target(prop,...args)}})}const onLoad=function(){const script=document.createElement("script");script.src="https://www.chatbase.co/embed.min.js";script.id="QMOmt8V4IC-Q9QzLK9-Zl";script.domain="www.chatbase.co";document.body.appendChild(script)};if(document.readyState==="complete"){onLoad()}else{window.addEventListener("load",onLoad)}})();
</script>
</body> 