<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <title>Login</title>
</head>
<body>
    <div class="container">
        <div class="left">
            <form action="login" method="post">
                <h1>Sign in</h1>
                <input type="email" name="email" class="email" placeholder="Email address" value="${email}">
                <input type="password" name="password" class="password" placeholder="Password">
                <h4 style="color: red ;padding-bottom:12px">${message}</h4>
                <input type="submit" value="Login" class="btn-login">
                <input type="hidden" value="${registerSuccess}" id="registerSucess">
            </form>
            <a href="forgot_password.jsp" style="color:black;opacity: 0.6;">Forgot password?</a>
            <p>Don't have an account? <a href="register.jsp" style="color:#54B4D3">Register here</a></p>
        </div>
        <div class="right">

        </div>
    </div>
    <script type="text/javascript">
		var  message = document.getElementById("registerSucess")
		if(message.value.length>0){
			alert(message.value)
		}
    </script>

</body>
</html>