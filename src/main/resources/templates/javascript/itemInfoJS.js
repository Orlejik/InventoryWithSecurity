
// disabling button without any changes!
let plantValue = document.getElementById("itemInfoPlant").value;
let locationValue = document.getElementById("ItemInfoLocation").value;
let isDamagedValue = document.getElementById("ItemInfoIs_Damaged").value;
let hostnameValue = document.getElementById("ItemInfoHostname").value;
let ipAddressValue = document.getElementById("ItemInfoIpaddress").value;
let usernameValue = document.getElementById("ItemInfoUser_name").value;
let departmentValue = document.getElementById("ItemInfoDepartment").value;
let operatorValue = document.getElementById("ItemInfoOperator_number").value;
let initialValues = [plantValue,
    locationValue,
    isDamagedValue,
    hostnameValue,
    ipAddressValue,
    usernameValue,
    departmentValue,
    operatorValue
];

function checkValues() {
    let plantNewValue = document.getElementById("itemInfoPlant").value;
    let locationNewValue = document.getElementById("ItemInfoLocation").value;
    let isDamagedNewValue = document.getElementById("ItemInfoIs_Damaged").value;
    let hostnameNewValue = document.getElementById("ItemInfoHostname").value;
    let ipAddressNewValue = document.getElementById("ItemInfoIpaddress").value;
    let usernameNewValue = document.getElementById("ItemInfoUser_name").value;
    let departmentNewValue = document.getElementById("ItemInfoDepartment").value;
    let operatorNewValue = document.getElementById("ItemInfoOperator_number").value;

    let initialNewValues = [plantNewValue,
        locationNewValue,
        isDamagedNewValue,
        hostnameNewValue,
        ipAddressNewValue,
        usernameNewValue,
        departmentNewValue,
        operatorNewValue
    ];
    console.log("Existing Values : " + initialValues);
    console.log("New Values : " + initialNewValues);

    return JSON.stringify(initialValues) === JSON.stringify(initialNewValues);


}

document.getElementById("itemUpdateForm").onchange = () => {
    if (!checkValues()) {
        document.getElementById("ItemInfoSubmit").removeAttribute("disabled");
    } else {
        document.getElementById("ItemInfoSubmit").setAttribute("disabled", "");

        console.log("No Changes Done");
    }
}
