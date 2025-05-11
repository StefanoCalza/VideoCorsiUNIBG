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
<script>
(function(){if(!window.chatbase||window.chatbase("getState")!=="initialized"){window.chatbase=(...arguments)=>{if(!window.chatbase.q){window.chatbase.q=[]}window.chatbase.q.push(arguments)};window.chatbase=new Proxy(window.chatbase,{get(target,prop){if(prop==="q"){return target.q}return(...args)=>target(prop,...args)}})}const onLoad=function(){const script=document.createElement("script");script.src="https://www.chatbase.co/embed.min.js";script.id="QMOmt8V4IC-Q9QzLK9-Zl";script.domain="www.chatbase.co";document.body.appendChild(script)};if(document.readyState==="complete"){onLoad()}else{window.addEventListener("load",onLoad)}})();
</script>
</body> 