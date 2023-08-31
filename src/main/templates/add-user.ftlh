<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style type="text/css">
        <#include "css/mdb.rtl.min.css">
        <#include "css/mdb.min.css">
        <#include "css/main.css">
        <#include "css/mdb.dark.rtl.min.css">
        <#include "css/mdb.dark.min.css">
    </style>
    <title> Add new user </title>
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
                    <li sec:authorize="hasRole('ADMIN')" class=" font-weight-bold nav-item">
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
                    <button type="button" class="btn btn-outline-dark" data-mdb-ripple-color="dark">Log Out</button>
                </a>
            </div>
        </div>
    </div>
</nav>


<div class="p-5 text-center bg-transparent ">
    <h1 class="mb-3 header_text">Add new user</h1>
</div>


<form action="/users/create" method="post" class="row g-3" enctype="multipart/form-data">

<#--    username - user email - password inputs-->
    <div class="col-md-1"></div>
    <div class="col-md-3">
        <label for="username" class="form-label">User Name</label>
        <input type="text" name="username" class="form-control" id="username" required>
    </div>
    <div class="col-md-4">
        <label for="email" class="form-label">User E-Mail</label>
<#--        <input type="text"  value="@eu.fujikura.com" name="email" class="form-control" id="email" required>-->
        <div class="input-group" id="email" >
            <input
                    type="text"
                    name="email"
                    class="form-control"
                    placeholder="user.name"
                    aria-label="user.name"
                    aria-describedby="basic-addon2"
            />
            <span class="input-group-text" id="basic-addon2">@eu.fujikura.com</span>
        </div>
    </div>
    <div class="col-md-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" name="password" id="password" required>
    </div>
    <div class="col-md-1"></div>

<#--active - plant - role radio buttons!-->
    <div class="col-md-3"></div>
    <div class="text-center col-md-2">
        <label for="plant" class="form-label">Plant</label>
        <div id="plant" class="row">
            <div class="col-md-2"></div>
            <div class="col-md-4 btn-group">
                <input type="radio" class="btn-check" name="plant" value="Chisinau" id="chisinau" autocomplete="off" checked />
                <label class="btn btn-secondary" for="chisinau">Chisinau</label>

                <input type="radio" class="btn-check" name="plant" value="Comrat" id="comrat" autocomplete="off" />
                <label class="btn btn-secondary" for="comrat">Comrat</label>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
    <div class="text-center col-md-2"></div>
    <div class="text-center col-md-2">
        <label for="roles" class="form-label">Role</label>
        <div id="roles" class="row">
            <div class="col-md-2"></div>
            <div class="col-md-4 btn-group">
                <input type="radio" class="btn-check" name="roles" value="USER" id="user" autocomplete="off" checked />
                <label class="btn btn-secondary" for="user">USER</label>

                <input type="radio" class="btn-check" name="roles" value="ADMIN" id="admin" autocomplete="off" />
                <label class="btn btn-secondary" for="admin">ADMIN</label>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
    <div class="col-md-3"></div>


<#--    Department - Permissions inputs-->
    <div class="col-md-1"></div>
    <div class="col-md-4">
        <label for="department" class="form-label">Department</label>
        <div>
            <div class="col-md-4 btn-group" th:required="department">
                <input type="radio" class="btn-check" name="department" value="IT" id="it" autocomplete="off"/>
                <label class="btn btn-secondary" for="it">IT</label>

                <input type="radio" class="btn-check" name="department" value="Engineering" id="eng" autocomplete="off"/>
                <label class="btn btn-secondary" for="eng">Engineering</label>

                <input type="radio" class="btn-check" name="department" value="Quality" id="qual" autocomplete="off"/>
                <label class="btn btn-secondary" for="qual">Quality</label>

                <input type="radio" class="btn-check" name="department" value="Security" id="sec" autocomplete="off"/>
                <label class="btn btn-secondary" for="sec">Security</label>

                <input type="radio" class="btn-check" name="department" value="HR" id="hr" autocomplete="off"/>
                <label class="btn btn-secondary" for="hr">HR</label>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <label for="permissions" class=" text-center form-label">Permissions</label>
        <div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" name="permissions" type="checkbox" id="it" value="it" />
                <label class="form-check-label" for="it">IT</label>
            </div>

            <div class="form-check form-check-inline">
                <input class="form-check-input" name="permissions" type="checkbox" id="engineering" value="engineering" />
                <label class="form-check-label" for="engineering">Engineering</label>
            </div>

            <div class="form-check form-check-inline">
                <input class="form-check-input" name="permissions" type="checkbox" id="quality" value="quality" />
                <label class="form-check-label" for="quality">Quality</label>
            </div>

            <div class="form-check form-check-inline">
                <input class="form-check-input" name="permissions" type="checkbox" id="security" value="security" />
                <label class="form-check-label" for="IT">Security</label>
            </div>

            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" id="hr" value="hr" />
                <label class="form-check-label" for="hr">HR</label>
            </div>
        </div>

    </div>
    <div class="col-md-1"></div>

<#--button -->
    <div class="col-12  text-center">
        <button class="btn btn-primary"
                id="addUserButton"
                data-mdb-ripple-color="dark"
                type="submit">
            Add New User
        </button>
    </div>
</form>


<#assign numberOfUsers = 0>

<table class="table table-dark table-striped table-hover mt-3">
    <thead>
    <tr>
        <td scope="col">№</td>
        <td scope="col">Creation Date</td>
        <td scope="col">Plant</td>
        <td scope="col">User Name</td>
        <td scope="col">Password</td>
        <td scope="col">User's Email</td>
        <td scope="col">Department</td>
        <td scope="col">Role</td>
        <td scope="col">Permissions</td>
        <td scope="col">Is Active</td>

        <td scope="col">To Delete</td>
    </tr>
    </thead>
    <tbody>
    <#list users as item>
        <tr>
        <td scope="row"><#assign numberOfUsers = numberOfUsers +1> ${numberOfUsers}</td>
        <td>${item.creationDate}</td>
        <td>${item.plant}</td>
        <td id="username">
            <a href="/user/${item.username}">
                ${item.username}
            </a>
        </td>
        <td style="position: relative; text-align: center;" class="eye_open_close pass_td pass-hidden"
            id="passwordInTable">${item.password}
            <div id="eye_open" class="eye_icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye "
                     viewBox="0 0 16 16">
                    <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                    <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                </svg>
            </div>

            <div id="eye_close" class="eye_icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-eye-slash" viewBox="0 0 16 16">
                    <path d="M13.359 11.238C15.06 9.72 16 8 16 8s-3-5.5-8-5.5a7.028 7.028 0 0 0-2.79.588l.77.771A5.944 5.944 0 0 1 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.134 13.134 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755-.165.165-.337.328-.517.486l.708.709z"/>
                    <path d="M11.297 9.176a3.5 3.5 0 0 0-4.474-4.474l.823.823a2.5 2.5 0 0 1 2.829 2.829l.822.822zm-2.943 1.299.822.822a3.5 3.5 0 0 1-4.474-4.474l.823.823a2.5 2.5 0 0 0 2.829 2.829z"/>
                    <path d="M3.35 5.47c-.18.16-.353.322-.518.487A13.134 13.134 0 0 0 1.172 8l.195.288c.335.48.83 1.12 1.465 1.755C4.121 11.332 5.881 12.5 8 12.5c.716 0 1.39-.133 2.02-.36l.77.772A7.029 7.029 0 0 1 8 13.5C3 13.5 0 8 0 8s.939-1.721 2.641-3.238l.708.709zm10.296 8.884-12-12 .708-.708 12 12-.708.708z"/>
                </svg>
            </div>
        </td>
        <td>${item.email}</td>
        <td>${item.department}</td>
        <td><#if item.roles??>
                ${item.roles}
                <#else>
                Something Wring!
        </#if>
            </td>
        <td>
            <#if item.permissions??>
                ${item.permissions}
            <#else>
                Something Wring!
            </#if>
            </td>
        <td class="isActive">
            ${
            item.active?then("Active", "Not Active")
            }
        </td>
        <td>
            <form action="/users/delete/${item.id}" method="post">
                <input type="submit" value="Delete User">
            </form>
        </td>

    <#else>
        <td colspan="15">
            <h4 class="text-uppercase text-center">Here is no Users to display</h4>
        </td>
        </tr>

    </#list>
    </tbody>
</table>


<script>
    <#include "javascript/main.js">
    <#include "javascript/mdb.min.js">
</script>


</body>
</html>