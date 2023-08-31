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
        <#include "css/mdb.dark.rtl.min.css">
        <#include "css/mdb.dark.min.css">
        <#include "css/charts.css">
<#--        <#include "css/BootStrapCss/bootstrap.css">-->
<#--        <#include "css/BootStrapCss/bootstrap-grid.css">-->
<#--        <#include  "css/BootStrapCss/bootstrap-reboot.css">-->
    </style>

    <script>
        <#include "javascript/chartsPlotly.js">
    </script>
    <title> Charts </title>
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
                <li sec:authorize="hasRole('ADMIN')" class="font-weight-bold nav-item">
                    <a class="nav-link" href="/charts">Charts</a>
                </li>
                <#if userRole=="ROLE_ADMIN">
                    <li sec:authorize="hasRole('ADMIN')" class="nav-item">
                        <a class="nav-link" active href="/user-add">Add new User</a>
                    </li>
                <#else>
                    <li sec:authorize="hasRole('ADMIN')" class=" nav-item d-none">
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
    <h1 class="mb-3 header_text">Chart of Inventoried Items</h1>
</div>

<div class="row">
    <div class="col-5"></div>
    <div class="col-1">
        <button type="button" id="showChisinauChart" class="btn btn-primary">Chisinau</button>
    </div>
    <div class="col-1">
        <button type="button" id="showComratChart" class="btn btn-light">Comrat</button>
    </div>
    <div class="col-5"></div>
</div>

<div class="d-none">

    <div>
        <#list itemnamesLength as plant, itemsNames>
            ${plant} : <#list itemsNames as itemname, quantity> ${itemname} - ${quantity}

        </#list>
        </#list>
    </div>
    <div>
        <#list itembrandsLength as plant, itemsBrands>
            ${plant} : <#list itemsBrands as itembrand, quantity> ${itembrand} - ${quantity}

        </#list>
        </#list>
    </div>
    <div>
        <#list itemmodelsLength as plant, itemsModels>
            ${plant} : <#list itemsModels as itemmodel, quantity> ${itemmodel} - ${quantity}

        </#list>
        </#list>
    </div>

</div>

<#--to test!-->

<div class="mt-5 row container-fluid">
    <div id="PlantChiOrCom">

    </div>
    <div class="col-4">
        <#list itemnamesLength as plant, itemsNames>
            <div id="${plant}NameChartContainer">
                <div class="text-center mt-5 mb-5">
                    <h3>
                        <#--                        ${plant}-->
                    </h3>
                </div>

                <div class="row">
                    <div class="col-12" id="${plant}ChartNames">

                    </div>
                </div>
                <div id="dataForCharts" class="d-none">
                    <#list itemsNames as itemname, quantity>
                        <div class="itemnames${plant}">${itemname}</div>
                        <div class="itemnamesQuantity${plant}">${quantity}</div>
                    </#list>
                </div>
            </div>
        </#list>
    </div>
    <div class="col-4">
        <#list itembrandsLength as plant, itemsBrands>
            <div id="${plant}BrandChartContainer">
                <div class="text-center mt-5 mb-5">
                    <h3>
                        <#--                        ${plant}-->
                    </h3>
                </div>

                <div class="row">
                    <div class="col-12" id="${plant}ChartBrands">

                    </div>
                </div>
                <div id="dataForCharts" class="d-none">
                    <#list itemsBrands as itembrand, quantity>
                        <div class="itembrands${plant}">${itembrand}</div>
                        <div class="itembrandsQuantity${plant}">${quantity}</div>
                    </#list>
                </div>
            </div>
        </#list>
    </div>
    <div class="col-4">

        <#list itemmodelsLength as plant, itemsModels>
            <div id="${plant}ModelChartContainer">
                <div class="text-center mt-5 mb-5">
                    <h3>
                        <#--                ${plant}-->
                    </h3>
                </div>

                <div class="row">
                    <div class="col-12" id="${plant}ChartModels">

                    </div>
                </div>
                <div id="dataForCharts" class="d-none">
                    <#list itemsModels as itemmodel, quantity>
                        <div class="itemmodels${plant}">${itemmodel}</div>
                        <div class="itemmodelsQuantity${plant}">${quantity}</div>
                    </#list>
                </div>
            </div>
        </#list>
    </div>
</div>

<div class="buttonsUpload">
    <div class="p-5 row">
        <div class="col-1"></div>

        <div class="col-1"></div>
        <div class="col-2">
            <button type="button" id="excelWithAssets" data-toggle="modal" data-target="#UploadExcelOfAssets" class="btn btn-primary">Upload excel of Assets</button>

            <#-- -------------------Modal Upload Excel with Assets ------------------------------------------------------ -->
            <!-- Modal -->
            <div class="modal fade" id="UploadExcelOfAssets" tabindex="-1" role="dialog" aria-labelledby="UploadExcelWithAssets" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Central Modal Small -->

        </div>
        <div class="col-4" style="text-align: center">
            <button id="downloadAllItems" type="button" data-toggle="modal" data-target="#downloadInvntoryList"  class="btn text-center btn-indigo">Download List of Inventory</button>
            <#-- -------------------Modal Upload Excel with Items ------------------------------------------------------ -->
            <!-- Central Fluid Small -->
            <div class="modal fade" id="downloadInvntoryList" tabindex="-1" role="dialog" aria-labelledby="downloadInventoryList"
                 aria-hidden="true">

                <!-- Change class .modal-sm to change the size of the modal -->
                <div class="modal-dialog modal-fluid" role="document">


                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title w-100" id="myModalLabel">Modal title</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary btn-sm">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Central Modal Small -->
        </div>
        <div class="col-2">
            <button type="button" id="exceWithItems" class="btn btn-primary" data-toggle="modal" data-target="#UploadExcelOfItems">Upload excel of Items</button>
            <#-- -------------------Modal Download Excel with inventoried items ------------------------------------------------------ -->
            <!-- Central Fluid Small -->
            <div class="modal fade" id="UploadExcelOfItems" tabindex="-1" role="dialog" aria-labelledby="ExcelOfItems"
                 aria-hidden="true">

                <!-- Change class .modal-sm to change the size of the modal -->
                <div class="modal-dialog modal-fluid" role="document">


                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title w-100" id="myModalLabel">Modal title</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary btn-sm">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Central Modal Small -->
        </div>
        <div class="col-1"></div>
        <div class="col-1"></div>
    </div>
</div>


<script>
    <#include "javascript/chart.js">
    <#include "javascript/mdb.min.js">
<#--    <#include "javascript/BootStrapJS/bootstrap.bundle.js">-->
<#--    <#include "javascript/BootStrapJS/bootstrap.js">-->
</script>


</body>
</html>