<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>User Info</title>
    <style type="text/css">
        <#include "css/mdb.rtl.min.css">
        <#include "css/main.css">
        <#include "css/mdb.min.css">
        <#include "css/mdb.dark.rtl.min.css">
        <#include "css/mdb.dark.min.css">
    </style>
</head>
<body style="overflow-x: hidden">
<nav class="navbar shadow-4 navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <button
                class="navbar-toggler"
                type="button"
                data-mdb-toggle="collapse"
                data-mdb-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <i class="fas fa-bars"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <a class="navbar-brand mt-2 mt-lg-0" href="/">
                <img src="images/FujiInv.png" alt="Fuji Logo"/>
            </a>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li sec:authorize="hasRole('USER')" class="nav-item">
                    <a class="nav-link" active href="/">All Items</a>
                </li>
                <li sec:authorize="hasRole('USER')" class="nav-item">
                    <a class="nav-link" active href="/additem">Add Item</a>
                </li>
                <li sec:authorize="hasRole('ADMIN')" class="nav-item">
                    <a class="nav-link" href="/assets-add">Add Asset</a>
                </li>
                <li sec:authorize="hasRole('ADMIN')" class="nav-item">
                    <a class="nav-link" href="/charts">Charts</a>
                </li>
                    <li sec:authorize="hasRole('ADMIN')" class="nav-item">
                        <a class="nav-link" active href="/user-add">Add new User</a>
                    </li>
                    <li sec:authorize="hasRole('ADMIN')" class="nav-item d-none">
                        <a class="nav-link" active href="/user-add">Add new User</a>
                    </li>
            </ul>
        </div>
        <div class="d-flex align-items-center">
            <div class="d-flex align-items-center">
                <a href="/logout">
                    <button type="button" class="btn btn-dark custom_btn_hover" data-mdb-ripple-color="dark">log out</button>
                </a>
            </div>
        </div>
    </div>
</nav>

<div class="p-5 text-center bg-transparent ">
    <h1 class="mb-3 header_text">${userInfo.username} Info</h1>
</div>

<form action="/users/${username}/update" method="post" class="row g-3" enctype="multipart/form-data">

    <#--    First line - inactive input-->
    <div class="col-md-1"></div>
    <div class="col-md-3">
        <label for="username" class="form-label">User Name</label>
        <input class="form-control text-bg-dark" name="username" id="username" value="${userInfo.username}"
               hidden>
        <input class="form-control text-bg-dark" id="username" value="${userInfo.username}" disabled>
    </div>
    <div class="col-md-4">
        <label for="email" class="form-label">User E-Mail</label>
        <input class="form-control text-bg-dark" name="email" id="email" value="${userInfo.email}"
               hidden>
        <input class="form-control text-bg-dark" id="email" value="${userInfo.email}" disabled>
    </div>
    <div class="col-md-3">
        <label for="password" class="form-label">Password</label>
        <input type="text" class="form-control" value="${userInfo.password}" name="password" id="password" required>
    </div>
    <div class="col-md-1"></div>

    <#--    Second line - active inputs-->
    <div class="col-md-3"></div>
    <div class="col-md-2">
        <label for="isActive" class="form-label">Is User Active</label>
        <div id="isActive" class="row">
            <div class="col-md-4 btn-group">
                <input type="radio" class="btn-check isUserActive" name="Active"  value="true" id="userDetailsActive" autocomplete="off"/>
                <label class="btn btn-secondary" for="userDetailsActive">Active</label>

                <input type="radio" class="btn-check isUserActive" name="Active"  value="false" id="userDetailsNotActive" autocomplete="off"/>
                <label class="btn btn-secondary" for="userDetailsNotActive">Inactive</label>
            </div>
        </div>
    </div>
    <div class="col-md-2">
        <label for="plant" class="form-label">Plant</label>
        <div id="plant" class="row">
            <div class="col-md-4 btn-group">
                <input type="radio" class="btn-check" name="plant" value="Chisinau" id="userDetailsChisinau" autocomplete="off"/>
                <label class="btn btn-secondary" for="userDetailsChisinau">Chisinau</label>

                <input type="radio" class="btn-check" name="plant" value="Comrat" id="userDetailsComrat" autocomplete="off"/>
                <label class="btn btn-secondary" for="userDetailsComrat">Comrat</label>
            </div>
        </div>
    </div>
    <div class="col-md-2">
        <label for="roles" class="form-label">Role</label>
        <div id="roles" class="row">
            <div class="col-md-4 btn-group">
                <input type="radio" class="btn-check" name="roles" value="ROLE_USER" id="userDetailsUserRole" autocomplete="off"/>
                <label class="btn btn-secondary" for="userDetailsUserRole">USER</label>

                <input type="radio" class="btn-check" name="roles" value="ROLE_ADMIN" id="userDetailsAdminRole" autocomplete="off"/>
                <label class="btn btn-secondary" for="userDetailsAdminRole">ADMIN</label>
            </div>
        </div>
    </div>
    <div class="col-md-3"></div>

    <#--Third Line - acive inputs-->
    <div class="col-md-2"></div>
    <div class="col-md-3">
        <label for="department" class="form-label">Department</label>
        <input class="form-control text-bg-dark" name="department" id="department" value="${userInfo.department}"
               hidden>
        <input class="form-control text-bg-dark" id="department" value="${userInfo.department}" disabled>
    </div>
    <div class="col-md-5">
        <label for="permissions" class=" text-center form-label">Permissions</label>
        <div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" name="permissions" type="checkbox" id="userDetailsItPerm" value="it"/>
                <label class="form-check-label" for="userDetailsItPerm">IT</label>
            </div>

            <div class="form-check form-check-inline">
                <input class="form-check-input" name="permissions" type="checkbox" id="userDetailsEngineeringPerm"
                       value="engineering"/>
                <label class="form-check-label" for="userDetailsEngineeringPerm">Engineering</label>
            </div>

            <div class="form-check form-check-inline">
                <input class="form-check-input" name="permissions" type="checkbox" id="userDetailsQualityPerm" value="quality"/>
                <label class="form-check-label" for="userDetailsQualityPerm">Quality</label>
            </div>

            <div class="form-check form-check-inline">
                <input class="form-check-input" name="permissions" type="checkbox" id="userDetailsSecurityPerm" value="security"/>
                <label class="form-check-label" for="userDetailsSecurityPerm">Security</label>
            </div>

            <div class="form-check form-check-inline">
                <input class="form-check-input" name="permissions" type="checkbox" id="userDetailsHrPerm" value="hr"/>
                <label class="form-check-label" for="userDetailsHrPerm">HR</label>
            </div>
        </div>

    </div>
    <div class="col-md-2"></div>

    <#--    Fourth Line - buttons-->
    <div class="mt-5 row">
        <div class="col-2"></div>
        <div class="col-3  text-center">
            <button class="btn btn-primary" id="addItemButton" data-mdb-ripple-color="dark" type="submit">Update
                user ${userInfo.username}</button>
        </div>
        <div class="col-2"></div>
        <div class="col-3  text-center">
            <input class="btn btn-danger" id="addItemButton" data-mdb-ripple-color="dark" onclick="history.back()"
                   value="Cancel" type="button">
        </div>
        <div class="col-2"></div>
    </div>
</form>

<#--<div class=" mt-10 d-none">-->
<div class=" mt-10 d-none">
    <input type="text" class="d-block hiddenInput" id="userInfoActive" value="${userInfo.active?then("true", "false")}">
    <input type="text" class="d-block hiddenInput" id="userInfoPlant" value="${userInfo.plant}">
    <input type="text" class="d-block hiddenInput" id="userInfoRole" value="${userInfo.roles}">
    <input type="text" class="d-block hiddenInput" id="userInfoPermissions" value="${userInfo.permissions}">
</div>

<script>
    <#include "javascript/userDetailsJS.js">
    <#include "javascript/main.js">
    <#include "javascript/mdb.min.js">
</script>

</body>
</html>