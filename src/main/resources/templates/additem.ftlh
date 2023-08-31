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
    <title> List of Assets </title>
</head>
<body class="overflow-hidden">

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
                <img src="./images/FujiInv.png" alt="Fuji Logo"/>
            </a>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li sec:authorize="hasRole('USER')" class="nav-item">
                    <a class="nav-link" active href="/">All Items</a>
                </li>
                <li sec:authorize="hasRole('USER')" class="font-weight-bold nav-item">
                    <a class="font-weight-bold nav-link" active href="/additem">Add Item</a>
                </li>
                <li sec:authorize="hasRole('ADMIN')" class="nav-item">
                    <a class="nav-link" href="/assets-add">Add Asset</a>
                </li>
                <li sec:authorize="hasRole('ADMIN')" class="nav-item">
                    <a class="nav-link" href="/charts">Charts</a>
                </li>
                <#if userRole=="ROLE_ADMIN">
                    <li sec:authorize="hasRole('ADMIN')" class="nav-item">
                        <a class="nav-link" active href="/user-add">Add new User</a>
                    </li>
                <#else>
                    <li sec:authorize="hasRole('ADMIN')" class="nav-item d-none">
                        <a class="nav-link" active href="/user-add">Add new User</a>
                    </li>
                </#if>
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
    <h1 class="mb-3 header_text">Add New Item</h1>
</div>

<form action="/item/create" method="post" class="row g-3" enctype="multipart/form-data">
    <div class="col-md-3"></div>
    <div class="col-md-3">
        <label for="plant" class="form-label">Plant</label>
        <input type="text" name="plant" class="form-control" id="plant" required>
    </div>
    <div class="col-md-3">
        <label for="location" class="form-label">Location</label>
        <input type="text" name="location" class="form-control" id="location" required>
    </div>
    <div class="col-md-3"></div>

    <div class="col-md-3"></div>
    <div class="col-md-2">
        <label for="itemname" class="form-label">Item Name</label>
        <select class="form-select" name="itemname" id="itemname" required>
            <option selected disabled value="">Choose...</option>
            <#list itemnames as asset>-->
                <option value="${asset}">${asset}</option>
            </#list>
        </select>
    </div>
    <div class="col-md-2">
        <label for="item_brand" class="form-label">Item brand</label>
        <select class="form-select" name="itembrand" id="item_brand" required>
            <option selected disabled value="">Choose...</option>
            <#list itembrands as asset>-->
                <option value="${asset}">${asset}</option>
            </#list>
        </select>
    </div>
    <div class="col-md-2">
        <label for="item_model" class="form-label">Item brand</label>
        <select class="form-select" name="itemmodel" id="item_model" required>
            <option selected disabled value="">Choose...</option>
            <#list itemmodels as asset>-->
                <option value="${asset}">${asset}</option>
            </#list>
        </select>
    </div>
    <div class="col-md-3"></div>

    <div class="col-md-3"></div>
    <div class="col-md-2">
        <label for="fae_number" class="form-label">FAE Number</label>
        <input type="text" class="form-control" name="faenumber" id="fae_number" required>
    </div>
    <div class="col-md-2">
        <label for="sis_number" class="form-label">SIS Number</label>
        <input type="text" class="form-control" name="sisnumber" id="sis_number" required>
    </div>
    <div class="col-md-2">
        <label for="serial_number" class="form-label">Serial Number</label>
        <input type="text" class="form-control" name="serialnumber" id="serial_number" required>
    </div>
    <div class="col-md-3"></div>


    <div class="col-md-3"></div>
    <div class="col-md-2">
        <label for="ip_address" class="form-label">Host Name</label>
        <input type="text" class="form-control" name="ip_address" id="ip_address">
    </div>
    <div class="col-md-2">
        <label for="hostname" class="form-label">IP Address</label>
        <input type="text" class="form-control" name="hostname" id="hostname">
    </div>
    <div class="col-md-2">
        <label for="isDamaged" class="form-label">Is Damaged</label>
        <select class="form-select" name="isDamaged" id="isDamaged" required>
            <option selected disabled value="">Choose...</option>
            <option value="damaged">damaged</option>
            <option value="working"> working</option>
        </select>
    </div>
    <div class="col-md-3"></div>

    <div class="col-md-3"></div>
    <div class="col-md-2">
        <label for="user_name" class="form-label">User Name</label>
        <input type="text" class="form-control" name="user_name" id="user_name" required>
    </div>
    <div class="col-md-2">
        <label for="department" class="form-label"> Department </label>
        <input type="text" class="form-control" name="department" id="department" required>
    </div>
    <div class="col-md-2">
        <label for="operator_number" class="form-label">Operator Number</label>
        <input type="text" class="form-control" name="operator_number" id="operator_number" required>
    </div>
    <div class="col-md-3"></div>

    <div class="col-12  text-center">
        <button class="btn btn-primary" id="addItemButton" data-mdb-ripple-color="dark" type="submit">Submit form
        </button>
    </div>
</form>


<script>
    <#include "javascript/mdb.min.js">
    <#include "javascript/main.js">
</script>


</body>
</html>