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
        <#include "css/mdb.dark.rtl.min.css">
        <#include "css/mdb.dark.min.css">
        <#include "css/main.css">
    </style>
    <title> List of Assets </title>
</head>
<body class="overflow-hidden">
<#assign numberOfItems = 0>
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
                <li sec:authorize="hasRole('USER')" class="nav-item">
                    <a class="nav-link" active href="/additem">Add Item</a>
                </li>
                <li sec:authorize="hasRole('ADMIN')" class="font-weight-bold nav-item">
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
    <h1 class="mb-3 header_text">Add New Asset</h1>
</div>


<form action="/assets/create" method="post" class=" row mt-5" enctype="multipart/form-data">

    <div class="col-md-3"></div>
    <div class="col-md-2">
        <label for="assettype" class="form-label">Asset Type</label>
        <input type="text" class="form-control" name="assettype" id="assettype" required>
    </div>
    <div class="col-md-2">
        <label for="assetBrand" class="form-label">Asset Brand</label>
        <input type="text" class="form-control" name="assetBrand" id="assetBrand" required>
    </div>
    <div class="col-md-2">
        <label for="assetModel" class="form-label">Asset Model</label>
        <input type="text" class="form-control" name="assetModel" id="assetModel" required>
    </div>
    <div class="col-md-3"></div>

    <div class="col-md-3"></div>
    <div class="col-md-2">
        <label for="customFile1" class="form-label">Image</label>
        <input type="file" class="form-control" name="file1" id="customFile1" >
    </div>
    <div class="col-md-2">
        <label for="customFile2" class="form-label">Image</label>
        <input type="file" class="form-control" name="file2" id="customFile2" >
    </div>
    <div class="col-md-2">
        <label for="customFile3" class="form-label">Image</label>
        <input type="file" class="form-control" name="file3" id="customFile3" >
    </div>
    <div class="col-md-3"></div>

    <div class="col-12 mt-5 mb-3 px-3 text-center">
        <div class="col-12  text-center">
            <button class="btn btn-primary"
                    id="addItemButton"
                    data-mdb-ripple-color="dark"
                    type="submit">Add Asset
        </button>
    </div>

    </div>
</form>

<table style="text-align: center" class="table table-dark table-striped table-hover">
    <thead>
    <tr>
        <td scope="col">№</td>
        <td scope="col">Asset Name</td>
        <td scope="col">Asset Brand</td>
        <td scope="col">Asset Model</td>
        <td scope="col">Delete</td>
    </tr>
    </thead>
    <tbody>
    <#list assets as asset>
        <tr>
        <td scope="row"><#assign numberOfItems = numberOfItems +1> ${numberOfItems}</td>
        <td>${asset.assettype}</td>
        <td>${asset.assetBrand}</td>
        <td>${asset.assetModel}</td>
        <td>
            <form action="/assets/delete/${asset.id}" method="post">
                <input type="submit" value="Delete Asset">
            </form>
        </td>

    <#else>
        <td colspan="5">
            <h4 class="text-uppercase text-center">Here is nothing to display </h4>
        </td>
        </tr>

    </#list>
    </tbody>
</table>
</div>

<script>
    <#include "javascript/mdb.min.js">
</script>


</body>
</>