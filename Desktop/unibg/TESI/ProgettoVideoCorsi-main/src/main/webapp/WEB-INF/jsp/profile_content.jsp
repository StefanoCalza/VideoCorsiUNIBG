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