<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
</head>
<body>
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <h3>Login</h3>
            </div>
            <div class="card-body">
                <form id="loginForm" action="#">
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input id="userName" type="text" class="form-control" placeholder="username">

                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input id="password" type="password" class="form-control" placeholder="password">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Login" class="btn float-right login_btn">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        document.getElementById("loginForm").addEventListener("submit", checkUser);

        function checkUser(event) {
            event.preventDefault();
            let userName = document.getElementById("userName").value;
            let password = document.getElementById("password").value;

            let param = JSON.stringify({"userName": userName, "password": password});

            if (!isEmptyString(userName) || !isEmptyString(password)) {
                $.ajax({
                    url: "/auth",
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    data: param,
                    success: function (data) {
                        window.location.href = "/dashboard";
                    }, error: function (data) {
                        alert(data.responseText.substring(584,616));
                        window.location.href = "/home";
                    }
                });
            } else {
                alert("Username and password cannot be empty");
            }
        }

    </script>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>
</body>
</html>
