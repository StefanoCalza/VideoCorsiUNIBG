<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PROGETTO VIDEOCORSI</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vanilla-zoom.min.css">
    <style>
        body {
            background-color: #f6f6f6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .clean-block {
            padding: 50px 0;
            flex: 1;
        }
        .card {
            transition: transform .2s;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border: none;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .block-heading {
            padding-bottom: 40px;
            text-align: center;
        }
        .block-heading h2 {
            color: #333;
            margin-bottom: 1rem;
            font-weight: bold;
        }
        .form-control {
            border-radius: 4px;
            border: 1px solid #ddd;
            padding: 10px 15px;
        }
        .form-control:focus {
            border-color: #3b99e0;
            box-shadow: 0 0 0 0.2rem rgba(59, 153, 224, 0.25);
        }
        .btn-primary {
            background-color: #3b99e0;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #2a7bc0;
            transform: translateY(-2px);
        }
        .footer-copyright {
            padding: 20px 0;
            background-color: #2d2c38;
            color: white;
            text-align: center;
        }
        .clean-navbar {
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .navbar-nav .nav-item {
            margin: 0 10px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
    <div class="container">
        <a class="navbar-brand logo" href="${pageContext.request.contextPath}/index.jsp">VideoCorsiUNIBG</a>
    </div>
</nav>

<main class="clean-block" style="margin-top: 80px;">
    <div class="container">
        <div class="block-heading">
            <h2>ACCEDI</h2>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/CheckLogin" method="post">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="pwd" required>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Accedi</button>
                            </div>
                            <div class="mt-3 text-center">
                                <p class="text-danger">${errorMsg}</p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<footer class="page-footer dark">
    <div class="footer-copyright">
        <p>© 2023 VideoCorsi UNIBG</p>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vanilla-zoom.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>

</body>
</html>