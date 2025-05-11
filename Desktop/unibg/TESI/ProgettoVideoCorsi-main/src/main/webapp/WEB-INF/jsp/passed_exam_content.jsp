<div class="block-heading">
    <h2>CORSI PASSATI</h2>
</div>
<div class="row justify-content-center">
    <c:choose>
        <c:when test="${empty passed}">
            <div class="col-md-8">
                <div class="alert alert-info text-center" role="alert">
                    <h4 class="alert-heading mb-3">Nessun corso completato</h4>
                    <p class="mb-0">Non hai ancora superato nessun corso. Continua a studiare e completare i quiz finali per vedere qui i tuoi successi!</p>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach items="${passed}" var="course">
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <h3 class="card-title">${course.name}</h3>
                            <div class="mb-3">
                                <i class="fa fa-check-circle text-success fa-3x"></i>
                            </div>
                            <p class="card-text">Hai superato con successo questo corso!</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>
<script>
(function(){if(!window.chatbase||window.chatbase("getState")!=="initialized"){window.chatbase=(...arguments)=>{if(!window.chatbase.q){window.chatbase.q=[]}window.chatbase.q.push(arguments)};window.chatbase=new Proxy(window.chatbase,{get(target,prop){if(prop==="q"){return target.q}return(...args)=>target(prop,...args)}})}const onLoad=function(){const script=document.createElement("script");script.src="https://www.chatbase.co/embed.min.js";script.id="QMOmt8V4IC-Q9QzLK9-Zl";script.domain="www.chatbase.co";document.body.appendChild(script)};if(document.readyState==="complete"){onLoad()}else{window.addEventListener("load",onLoad)}})();
</script>
</body> 