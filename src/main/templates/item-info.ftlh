<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    <style type="text/css">
        <#include "css/mdb.rtl.min.css">
        <#include "css/main.css">
        <#include "css/mdb.min.css">
        <#include "css/mdb.dark.rtl.min.css">
        <#include "css/mdb.dark.min.css">
    </style>
</head>
<body class="overflow-x-hidden">
<#--<body class="">-->
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
    <h1 class="mb-3 header_text">${item.itembrand} ${item.itemmodel} Details</h1>
</div>

<div class="d-flex justify-content-center">
    <#list images as img>
        <div class="img-container" style="margin: 0px 10px">
            <img class="d-block" style="height: 15em; border-radius: 5%;" src="/images/${img.id}" alt="First slide">
        </div>
    </#list>
</div>

<div class="container-fluid w-75 p-3 my-3">
    <form action="/item/${item.id}/update" id="itemUpdateForm" method="post">
        <div class="row mt-2">
            <div class="col-3"></div>
            <div class="col-3">
                <#--            Plant (Edited)-->
                <div class=" py-4 hover-shadow">
                    <label for="itemInfoPlant" class="form-label">Plant</label>
                    <input class="form-control" name="plant" id="itemInfoPlant" value="${item.plant}">
                </div>
            </div>
            <div class="col-3">
                <#--            Location (edited)-->
                <div class=" py-4 hover-shadow ">
                    <label for="ItemInfoLocation" class="form-label">Location</label>
                    <input class="form-control" name="location" id="ItemInfoLocation" value="${item.location}">
                </div>
            </div>
            <div class="col-3"></div>
        </div>

        <div class="text-dark row mt-2">
            <div class="col-4">
                <#--            Item Name-->
                <div class=" py-3 ">
                    <label for="itemname" class="form-label">Item Name</label>
                    <input class="form-control text-bg-dark" name="itemname" id="itemname" value="${item.itemname}"
                           hidden>
                    <input class="form-control text-bg-dark" id="itemname" value="${item.itemname}" disabled>
                </div>
            </div>
            <div class="col-4">
                <div class=" py-3 ">
                    <label for="itembrand" class="form-label">Item Brand</label>
                    <input class="form-control text-bg-dark" name="item_brand" id="itembrand" value="${item.itembrand}"
                           hidden>
                    <input class="form-control text-bg-dark" id="itembrand" value="${item.itembrand}" disabled>
                </div>
            </div>
            <div class="col-4">
                <div class=" py-3 ">
                    <label for="itemmodel" class="form-label">Item Model</label>
                    <input class="form-control  text-bg-dark" name="item_model" id="itemmodel"
                           value="${item.itemmodel}" hidden>
                    <input class="form-control  text-bg-dark" id="itemmodel" value="${item.itemmodel}" disabled>
                </div>
            </div>
        </div>

        <div class="row mt-2 text-dark">
            <div class="col-4">
                <div class="py-3">
                    <label for="faenumber" class="form-label">FAE Number</label>
                    <input class="form-control text-bg-dark" name="fae_number" id="faenumber" value="${item.faenumber}"
                           hidden>
                    <input class="form-control text-bg-dark" id="faenumber" value="${item.faenumber}" disabled>
                </div>
            </div>
            <div class="col-4">
                <div class="py-3">
                    <label for="sisnumber" class="form-label">SIS Number</label>
                    <input class="form-control text-bg-dark" name="sis_number" id="sisnumber" value="${item.sisnumber}"
                           hidden>
                    <input class="form-control text-bg-dark" id="sisnumber" value="${item.sisnumber}" disabled>
                </div>
            </div>
            <div class="col-4">
                <div class="py-3">
                    <label for="serialnumber" class="form-label">Serial Number</label>
                    <input class="form-control text-bg-dark" name="serial_number" id="serialnumber"
                           value="${item.serialnumber}" hidden>
                    <input class="form-control text-bg-dark" id="serialnumber" value="${item.serialnumber}" disabled>
                </div>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-4">
                <div class=" py-3">
                    <label for="ItemInfoIs_Damaged" class="form-label">Is Damaged</label>
                    <input class="form-control" name="isDamaged" id="ItemInfoIs_Damaged"
                           value="<#if item.isDamaged??>working<#else>damaged</#if>">
                </div>
            </div>
            <div class="col-4">
                <div class="py-3">
                    <label for="ItemInfoHostname" class="form-label">Hostname</label>
                    <input class="form-control" name="hostname" id="ItemInfoHostname"
                           value="<#if item.hostname??>${item.hostname}<#else>no hostname</#if>">
                </div>
            </div>
            <div class="col-4">
                <div class="py-3">
                    <label for="ItemInfoIpaddress" class="form-label">IP Address</label>
                    <input class="form-control" name="ip_address" id="ItemInfoIpaddress"
                           value=" <#if item.ip_address??>${item.ip_address}<#else>no ip address</#if>">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-4">
                <div class="py-3">
                    <label for="ItemInfoUser_name" class="form-label">User Name</label>
                    <input class="form-control" name="user_name" id="ItemInfoUser_name" value="${item.user_name}">
                </div>
            </div>
            <div class="col-4">
                <div class="py-3">
                    <label for="ItemInfoDepartment" class="form-label">Department</label>
                    <input class="form-control" name="department" id="ItemInfoDepartment" value="${item.department}">
                </div>
            </div>
            <div class="col-4">
                <div class="py-3">
                    <label for="ItemInfOoperator_number" class="form-label">Operator Nummber</label>
                    <input class="form-control" name="operator_number" id="ItemInfoOperator_number"
                           value="${item.operator_number}">
                </div>
            </div>
        </div>
        <div class="col-12 mt-3">
            <div class="text-center p-2">
                <input type="submit" value="Update the Item" class="btn btn-dark btn-primary" id="ItemInfoSubmit" disabled>
            </div>
        </div>
    </form>
</div>

<#assign numberOfLogs = 0>

<div class="p-5 text-center bg-transparent ">
    <h3 class="mb-3 header_text">History of item movements :</h3>
    <div class="mt-5">

        <table class="table">
            <thead class="table-dark">
            <tr>
                <th scope="col">№</th>
                <th scope="col">Time</th>
                <th scope="col">Description</th>
            </tr>
            </thead>
            <tbody>
            <#list logs as log>
                <tr class="table-dark">
                    <th scope="row"><#assign numberOfLogs = numberOfLogs +1> ${numberOfLogs}</th>
                    <th>${log.logTime}</th>
                    <th class="text-capitalize">${log.logText}</th>
                </tr>
                <#else >
                <p>no logs!</p>
            </#list>
            </tbody>
        </table>

    </div>

</div>


<script>
    <#include "javascript/itemInfoJS.js">
    <#include "javascript/main.js">
    <#include "javascript/mdb.min.js">
</script>

</body>
</html>