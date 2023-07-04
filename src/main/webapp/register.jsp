<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css//register.css">
    <title>Register</title>
</head>
<body>
    <div class="container">
        <div class="left">
            <form action="register" id="form" method="post" onsubmit="return validateForm()">
                <h1>Sign up</h1>
                <input type="tel" name="phone" id="phone" class="phone" placeholder="Phone number" pattern="[0-9]{10}" required value="${phone}">
                <input type="email" name="email" id="email" class="email" placeholder="Email address" required value="${email}">
                <input type="password" name="password" id="password" placeholder="Password" required value="${password}">
                <input type="password" name="password-repeat" id="password-repeat" placeholder="Confirm Password" required>
                <span id="error" style="color: red">${message }</span>
                <input type="submit" value="Register" class="btn-login"  >
                
            </form>
            <a href="login.jsp" style="color:black;opacity: 0.6;">Already have an account?</a>

        </div>
        <div class="right">
			<img alt="" src="image/login_picture.png" >
        </div>
    </div>
    <script>
    var phone = document.getElementById("phone")
    var  password = document.getElementById("password")
    var password_repeat = document.getElementById("password-repeat")
    var error = document.getElementById("error")



    function validateForm(){
        if(password.value != password_repeat.value){
            error.innerHTML ="Mật khẩu không khớp"
            return false;
        }
        if(password.value.length<6 ){
            error.innerHTML ="Mật khẩu phải từ 6 ký tự trở lên"
            return false;
        }

        return true;
    }
    </script>
</body>
</html>