<div class="block-heading">
    <h2>PROFILO UTENTE</h2>
</div>
<div class="row">
    <div class="col-md-6 offset-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Informazioni personali</h5>
                <p class="card-text">
                    <strong>Nome:</strong> ${user.name}<br>
                    <strong>Cognome:</strong> ${user.surname}<br>
                    <strong>Email:</strong> ${user.email}<br>
                    <strong>Matricola:</strong> ${user.matricola}
                </p>
                <form action="${pageContext.request.contextPath}/updateProfile" method="post">
                    <button type="submit" class="btn btn-primary">Modifica profilo</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
(function(){if(!window.chatbase||window.chatbase("getState")!=="initialized"){window.chatbase=(...arguments)=>{if(!window.chatbase.q){window.chatbase.q=[]}window.chatbase.q.push(arguments)};window.chatbase=new Proxy(window.chatbase,{get(target,prop){if(prop==="q"){return target.q}return(...args)=>target(prop,...args)}})}const onLoad=function(){const script=document.createElement("script");script.src="https://www.chatbase.co/embed.min.js";script.id="QMOmt8V4IC-Q9QzLK9-Zl";script.domain="www.chatbase.co";document.body.appendChild(script)};if(document.readyState==="complete"){onLoad()}else{window.addEventListener("load",onLoad)}})();
</script>
</body> 