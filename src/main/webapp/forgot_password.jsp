<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/forgot_password.css">
    <title>Forgot password</title>
</head>
<body>
    <div class="container">
        <img src="image/images.png" alt="">
        <div class="guide">
            <h2 style="margin-bottom: 18px;">Forgot your password?</h2>
            <p style="margin-bottom: 12px;">Follow these simple steps to reset your account:</p>
            <ol>
                <li>Enter your username or email.</li>
                <li>Visit your email account, open the email sent by Apple tree Book.</li>
                <li>Follow the instruction in the mail to change password.</li>
            </ol>
        </div>
        <form class="form" action="#">
            <label for="email"><h3>Your email</h3></label>
            <input type="email" name="email" id="email">
            <input type="submit" class="btn-submit" value="Get New Password">
        </form>
    </div>
</body>
</html>