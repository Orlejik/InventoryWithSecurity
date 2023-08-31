
// checking the user details!

// -----------plant radio buttons!
let plantRudioChisinau = document.getElementById("userDetailsChisinau");
let plantRudioComrat = document.getElementById("userDetailsComrat");
// -----------ACtive radio buttons!
let isActiveRudioActive = document.getElementById("userDetailsActive");
let isACtiveRudioNotActive = document.getElementById("userDetailsNotActive");
// -----------Roles radio buttons!
let rolesRudioUserRole = document.getElementById("userDetailsUserRole");
let rolesRudioAdminRole = document.getElementById("userDetailsAdminRole");
// -----------Permissions checkboxes!
let itPermissions = document.getElementById("userDetailsItPerm");
let engineeringPermissions = document.getElementById("userDetailsEngineeringPerm");
let qualityPermissions = document.getElementById("userDetailsQualityPerm");
let securityPermissions = document.getElementById("userDetailsSecurityPerm");
let hrPermissions = document.getElementById("userDetailsHrPerm");
// hidden inputs with user's details
let userInfoActive = document.getElementById("userInfoActive");
let userInfoPlant = document.getElementById("userInfoPlant");
let userInfoRole = document.getElementById("userInfoRole");
let userInfoPermissions = document.getElementById("userInfoPermissions");
let userInfoActiveValue = userInfoActive.value;
let userInfoPlantValue = userInfoPlant.value;
let userInfoRoleValue = userInfoRole.value;
let userInfoPermissionsValue = userInfoPermissions.value.split(",");
console.log(userInfoActiveValue);
console.log(userInfoPlantValue);
console.log(userInfoRoleValue);
console.log(userInfoPermissionsValue);
if (userInfoActiveValue === "true") {
    isActiveRudioActive.setAttribute("checked","");
}else {
    isACtiveRudioNotActive.setAttribute("checked","");
}
if (userInfoPlantValue === "Chisinau") {
    plantRudioChisinau.setAttribute("checked","");
}else {
    plantRudioComrat.setAttribute("checked","");
}
if (userInfoRoleValue === "ROLE_ADMIN") {
    rolesRudioAdminRole.setAttribute("checked","");
}else {
    rolesRudioUserRole.setAttribute("checked","");
}

for (let i = 0; i < userInfoPermissionsValue.length; i++) {
    if (userInfoPermissionsValue[i] === "it" || userInfoPermissionsValue[i] === "IT ") {
        itPermissions.setAttribute("checked","");
    }else if (userInfoPermissionsValue[i] === "engineering" || userInfoPermissionsValue[i] === "ENG ") {
        engineeringPermissions.setAttribute("checked","")
    }else if (userInfoPermissionsValue[i] === "quality" || userInfoPermissionsValue[i] === "QUAL ") {
        qualityPermissions.setAttribute("checked","");
    }else if (userInfoPermissionsValue[i] === "security" || userInfoPermissionsValue[i] === "SEC ") {
        securityPermissions.setAttribute("checked","");
    }else if (userInfoPermissionsValue[i] === "hr" || userInfoPermissionsValue[i] === "HR ") {
        hrPermissions.setAttribute("checked","");
    }else{
        userInfoPermissionsValue[i].removeAttribute("checked");
    }
}

let radiobtns = document.querySelectorAll(".isUserActive");
let isUserActiveInput = document.querySelector("#userInfoActive");
for (let i = 0; i < radiobtns.length; i++) {
    radiobtns[i].addEventListener("click", (ev)=>{
        isUserActiveInput.value = ev.target.value;
    })
}