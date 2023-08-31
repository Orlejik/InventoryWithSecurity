let eye_icon = document.getElementsByClassName("eye_icon");

for (let i = 0; i < eye_icon.length; i++) {
    console.log(eye_icon);
}
//
let change_class = (event, changeClass) => {
    event.target.classList.toggle("changeClass");
    console.log(event.target);
}

for (let i = 0; i < eye_icon.length; i++) {
    eye_icon[i].addEventListener("click", (event) => {
        let eventTarget = event.target;
        let thisEventTarget = this.event.target;
        eventTarget.style.zIndex = -1000;
        thisEventTarget.parentElement.classList.replace("pass-hidden", "pass_open");
    });
}

let isActive_tds = document.getElementsByClassName("isActive");
for (let i = 0; i < isActive_tds.length; i++) {
    if (isActive_tds[i].innerText === "Not Active") {
        isActive_tds[i].style.color = "darkred";
        isActive_tds[i].style.textShadow ="0px 0px 15px #ce0000, 0 0 5px #ce0000, 0px 0px 4px #af4c4c"

    }else{
        isActive_tds[i].style.color = "green"
        isActive_tds[i].style.textShadow ="0px 0px 15px #00CE11, 0 0 5px #00CE11, 0px 0px 4px #4CAF50;"
    }
}

// reduce the length of text in password cell
let pass_hidden = document.getElementsByClassName("pass-hidden");
for (let i = 0; i < pass_hidden.length; i++) {
    pass_hidden[i].innerText = pass_hidden[i].innerText.substring(0, 10);
}

// Get the input field
let searchForm = document.getElementById("searchForm");

// Execute a function when the user presses a key on the keyboard
searchForm.addEventListener("keypress", function(event) {
    // If the user presses the "Enter" key on the keyboard
    if (event.key === "Enter") {
        // Cancel the default action, if needed
        event.preventDefault();
        // Trigger the button element with a click
        document.getElementById("myBtn").click();
    }
});

$(document).ready(function () {
    $('#dtBasicExample').DataTable();
    $('.dataTables_length').addClass('bs-select');
});