let itemnamesChi = document.getElementsByClassName("itemnamesChisinau");
let itemnamesQuaChi = document.getElementsByClassName("itemnamesQuantityChisinau");
let itemnamesCom = document.getElementsByClassName("itemnamesComrat");
let itemnamesQuaCom = document.getElementsByClassName("itemnamesQuantityComrat");

let itembrandsChi = document.getElementsByClassName("itembrandsChisinau");
let itembrandsQuaChi = document.getElementsByClassName("itembrandsQuantityChisinau");
let itembrandsCom = document.getElementsByClassName("itembrandsComrat");
let itembrandsQuaCom = document.getElementsByClassName("itembrandsQuantityComrat");

let itemmodelsChi = document.getElementsByClassName("itemmodelsChisinau");
let itemmodelsQuaChi = document.getElementsByClassName("itemmodelsQuantityChisinau");
let itemmodelsCom = document.getElementsByClassName("itemmodelsComrat");
let itemmodelsQuaCom = document.getElementsByClassName("itemmodelsQuantityComrat");

function valuesItemNames(arr){
    let itemNamesArr = [];
    for (let i=0; i<arr.length; i++){
        itemNamesArr.push(arr[i].innerText);
    }
    return itemNamesArr;
}

let itemNamesChiChart = {
    x: valuesItemNames(itemnamesChi),
    y: valuesItemNames(itemnamesQuaChi),
    marker:{
        color: ['rgb(10,73,140)', 'rgb(11,97,183)']
    },
    type: 'bar',
};

let itemNamesComChart = {
    x: valuesItemNames(itemnamesCom),
    y: valuesItemNames(itemnamesQuaCom),
    marker:{
        color: ['rgb(10,73,140)', 'rgb(11,97,183)']
      },
    type: 'bar'
};

let itemBrandsChiChart = {
    x: valuesItemNames(itembrandsChi),
    y: valuesItemNames(itembrandsQuaChi),
    marker:{
        color: ['rgb(10,73,140)', 'rgb(11,97,183)']
    },
    type: 'bar'
};

let itemBrandsComChart = {
    x: valuesItemNames(itembrandsCom),
    y: valuesItemNames(itembrandsQuaCom),
    marker:{
        color: ['rgb(10,73,140)', 'rgb(11,97,183)']
    },
    type: 'bar'
};

let itemModelsChiChart = {
    x: valuesItemNames(itemmodelsChi),
    y: valuesItemNames(itemmodelsQuaChi),
    marker:{
        color: ['rgb(10,73,140)', 'rgb(11,97,183)']
    },
    type: 'bar'
};

let itemModelsComChart = {
    x: valuesItemNames(itemmodelsCom),
    y: valuesItemNames(itemmodelsQuaCom),
    marker:{
        color: ['rgb(10,73,140)', 'rgb(11,97,183)']
    },
    type: 'bar'
};

let namesChi = [itemNamesChiChart];
let namesCom = [itemNamesComChart];
let brandsChi = [itemBrandsChiChart];
let brandsCom = [itemBrandsComChart];
let modelsChi = [itemModelsChiChart];
let modelsCom = [itemModelsComChart];


let layoutnamesChi = {
    title: 'Quantity of Items \n by Name in Chisinau',
    "plot_bgcolor":"transparent",
    "paper_bgcolor":"transparent",
    font:{
        family: 'Roboto Light',
        size: 15,
        color: '#d9d9d9'
    }
};

let layoutnamecCom = {
    title: 'Quantity of Items\n by Name in Comrat',
    "plot_bgcolor":"transparent",
    "paper_bgcolor":"transparent",
    font:{
        family: 'Roboto Light',
        size: 15,
        color: '#d9d9d9'
    }
};

let layoutbrandsChi = {
    title: 'Quantity of Items \nby Brand in Chisinau',
    "plot_bgcolor":"transparent",
    "paper_bgcolor":"transparent",
    font:{
        family: 'Roboto Light',
        size: 15,
        color: '#d9d9d9'
    }
};

let layoutbrandsCom = {
    title: 'Quantity of Items \nby Brand in Comrat',
    "plot_bgcolor":"transparent",
    "paper_bgcolor":"transparent",
    font:{
        family: 'Roboto Light',
        size: 15,
        color: '#d9d9d9'
    }
};

let layoutmodelsChi = {
    title: 'Quantity of Items \nby Model in Chisinau',
    "plot_bgcolor":"transparent",
    "paper_bgcolor":"transparent",
    font:{
        family: 'Roboto Light',
        size: 15,
        color: '#d9d9d9'
    }
};

let layoutmodelsCom = {
    title: 'Quantity of Items by Model in Comrat',
    "plot_bgcolor":"transparent",
    "paper_bgcolor":"transparent",
    font:{
        family: 'Roboto Light',
        size: 15,
        color: '#d9d9d9'
    }
};

const config = {
    displayModeBar: false, // this is the line that hides the bar.
};

Plotly.newPlot('ChisinauChartNames', namesChi, layoutnamesChi, config);
Plotly.newPlot('ComratChartNames', namesCom, layoutnamecCom, config);

Plotly.newPlot('ChisinauChartBrands', brandsChi, layoutbrandsChi, config);
Plotly.newPlot('ComratChartBrands', brandsCom, layoutbrandsCom, config);

Plotly.newPlot('ChisinauChartModels', modelsChi, layoutmodelsChi, config);
Plotly.newPlot('ComratChartModels', modelsCom, layoutmodelsCom, config);




let chiNameChrats = document.getElementById("ChisinauNameChartContainer");
let comNameCharts = document.getElementById("ComratNameChartContainer");
let chiBrandChrats = document.getElementById("ChisinauBrandChartContainer");
let comBrandCharts = document.getElementById("ComratBrandChartContainer");
let chiModelChrats = document.getElementById("ChisinauModelChartContainer");
let comModelChrats = document.getElementById("ComratModelChartContainer");
let showChi = document.getElementById("showChisinauChart");
let showCom = document.getElementById("showComratChart");
let divWithPlant = document.getElementById("PlantChiOrCom");

window.addEventListener("load",()=>{
    chiNameChrats.classList.remove("d-none");
    comNameCharts.classList.add("d-none");
    chiBrandChrats.classList.remove("d-none");
    comBrandCharts.classList.add("d-none");
    chiModelChrats.classList.remove("d-none");
    comModelChrats.classList.add("d-none");
    showChi.classList.remove("btn-light");
    showCom.classList.remove("btn-primary");
    showChi.classList.add("btn-primary");
    showCom.classList.add("btn-light");
    divWithPlant.innerText = "Chisinau";
})

document.getElementById("showChisinauChart").addEventListener("click", ()=>{
    chiNameChrats.classList.remove("d-none");
    comNameCharts.classList.add("d-none");
    chiBrandChrats.classList.remove("d-none");
    comBrandCharts.classList.add("d-none");
    chiModelChrats.classList.remove("d-none");
    comModelChrats.classList.add("d-none");

    showChi.classList.add("btn-primary");
    showChi.classList.remove("btn-light");
    showCom.classList.add("btn-light");
    showCom.classList.remove("btn-primary");

    divWithPlant.innerText = "Chisinau";
})

document.getElementById("showComratChart").addEventListener("click", ()=>{
    chiNameChrats.classList.add("d-none");
    comNameCharts.classList.remove("d-none");
    chiBrandChrats.classList.add("d-none");
    comBrandCharts.classList.remove("d-none");
    chiModelChrats.classList.add("d-none");
    comModelChrats.classList.remove("d-none");

    showCom.classList.add("btn-primary");
    showCom.classList.remove("btn-light");
    showChi.classList.add("btn-light");
    showChi.classList.remove("btn-primary");

    divWithPlant.innerText = "Comrat";
})