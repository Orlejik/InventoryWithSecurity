<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Registration</title>
</head>
<body class="overflow-hidden">

<h1>FujInventory</h1><br><br>
<hr>
<br><br>
<h4>Registration</h4>
<form action="/registration" method="post">
    UserName : <input type="text" name="usernaem"> <br><br>
    Email : <input type="email" name="email"> <br><br>
    Phone Number : <input type="text" name="phoneNumber"> <br><br>
    Password : <input type="password" name="password">

    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Register">
</form>

<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>

</body>
</html>