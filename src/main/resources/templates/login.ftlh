<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
</head>
<body>

<h1>FujInventory</h1><br><br>
<hr>
<br><br>
<h4>Login</h4>

<form action="/login" method="post">

    User Name : <input type="text" name="username"><br><br>
    Password  : <input type="password" name="password"> <br><br>

    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Enter">

</form>


</body>
</html>