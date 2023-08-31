<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
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
        <#include "css/listOfItems.css">
    </style>
    <title> List of Assets </title>
</head>
<body style="overflow-x: hidden">
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
                <li sec:authorize="hasRole('USER')" class="font-weight-bold nav-item">
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
                <#--                <p>hi ${logenedUser}</p>-->
                <#--                <p>${userRole}</p>-->
                <a href="/logout">
                    <button type="button" class="btn btn-outline-dark" data-mdb-ripple-color="dark">Log Out</button>
                </a>
            </div>
        </div>
    </div>
</nav>
<div class="p-5 text-center bg-transparent ">
    <h1 class="mb-3 header_text">Inventoried Items</h1>
</div>


<form action="/" method="get" class="g-3 th-sm row" enctype="multipart/form-data">
    <div class="col-md-1"></div>
    <div class="col-md-1">
        <label for="plant" class="form-label">Find by FAE Plant</label>
        <input type="text" name="plant" class="form-control" id="plant">
    </div>
    <div class="col-md-1">
        <label for="fae_number" class="form-label">Find by FAE Number</label>
        <input type="text" name="faenumber" class="form-control" id="fae_number">
    </div>
    <div class="col-md-1">
        <label for="sis_number" class="form-label">Find by SIS Number</label>
        <input type="text" name="sisnumber" class="form-control" id="sis_number">
    </div>
    <div class="col-md-1">
        <label for="itemname" class="form-label">Find by Item Type</label>
        <input type="text" name="itemname" class="form-control" id="itemname">
    </div>
    <div class="col-md-1">
        <label for="item_brand" class="form-label">Find by Item Brand</label>
        <input type="text" name="itembrand" class="form-control" id="item_brand">
    </div>
    <div class="col-md-1">
        <label for="item_model" class="form-label">Find by Item Model</label>
        <input type="text" name="itemmodel" class="form-control" id="item_model">
    </div>
    <div class="col-md-1">
        <label for="serialNamber" class="form-label">Find by Serial Number</label>
        <input type="text" name="serialnumber" class="form-control" id="serialNamber">
    </div>

    <div class="col-md-1">
        <label for="item_brand" class="form-label d-none">Find by ...</label>
        <input disabled type="text" name="itembrand" class="form-control d-none" id="">
    </div>
    <div class="col-md-1 ">
        <label for="item_model" class="form-label d-none">Find by ...</label>
        <input disabled type="password" class="form-control d-none" name="item_model d-none" id="">
    </div>
    <div class="col-md-1">
        <label for="serialNamber" class="form-label d-none">Find by ...</label>
        <input disabled type="text" name="serialNamber" class="form-control d-none" id="">
    </div>
    <div class="col-md-1 ">
        <button class="btn btn-primary mt-5"
                id="findItem"
                data-mdb-ripple-color="dark"
                type="submit">
            Find By ...
        </button>
    </div>
</form>

<div class="overflow-x-scroll">
    <table id="dtOrderExample" class="table table-dark table-sm table-striped table-hover" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th class="th-sm" >№</th>
            <th class="th-sm" >Plant</th>
            <th class="th-sm">FAE Number</th>
            <th class="th-sm">SIS Number</th>
            <th class="th-sm">Name</th>
            <th class="th-sm">Brand</th>
            <th class="th-sm">Model</th>
            <th class="th-sm">Serial Number</th>
            <th class="th-sm">Location</th>
            <th class="th-sm">Hostname</th>
            <th class="th-sm">IP Address</th>
            <th class="th-sm">isDamaged</th>
            <th class="th-sm">User Name</th>
            <th class="th-sm">Department</th>
            <th class="th-sm">Operator Number</th>
            <#if userRole=="ROLE_ADMIN">
                <th> Added by</th>
                <th>Action</th>
            <#else>
                <th class="d-none"> Added by</th>
                <th class="d-none">Action</th>
            </#if>

        </tr>
        </thead>
        <tbody>
        <#list items as item>
        <tr>
            <td scope="row"><#assign numberOfItems = numberOfItems +1> ${numberOfItems}</td>
            <td>${item.plant}</td>
            <td>${item.faenumber}</td>
            <td>${item.sisnumber}</td>
            <td><a href="item/${item.id}" data-mdb-toggle="tooltip" title="View Details">${item.itemname}</a></td>
            <td>${item.itembrand}</td>
            <td>${item.itemmodel}</td>
            <td>${item.serialnumber}</td>
            <td>${item.location}</td>
            <td><#if item.hostname??>
                ${item.hostname}
                <#else>
                no hostname
                </#if>
            </td>
            <td><#if item.ip_address??>
                ${item.ip_address}
                <#else>
                no ip address
                </#if>
            </td>
            <td><#if item.isDamaged??>
                working
                <#else>
                damaged
                </#if>
            </td>
            <td>${item.user_name}</td>
            <td>${item.department}</td>
            <td>${item.operator_number}</td>
            <#if userRole=="ROLE_ADMIN">
                <td>${item.user_added_item}</td>
                <td>
                    <button type="button" class="btn btn-indigo">Delet item</button>
                </td>
            <#else>
                <td class="d-none">${item.user_added_item}</td>
                <td class="d-none">
                    <button type="button" class="btn btn-indigo">Delet item</button>
                </td>
            </#if>

            <#else>
            <td colspan="15">
                <h4 class="text-uppercase text-center">Here is nothing to display</h4>
            </td>
        </tr>

        </#list>
        </tbody>
    </table>
</div>

<script>
    <#include "javascript/jQuery.js">
    <#include "javascript/ListOfItems.js">
    <#include "javascript/main.js">
    <#include "javascript/mdb.min.js">
</script>


</body>
</html>