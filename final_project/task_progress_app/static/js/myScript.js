
// var buttonToBinary = document.querySelector("#teams");
// buttonToBinary.addEventListener('click', function() {
//   buttonToBinary.style.backgroundColor = "#CCCCCC";
//   buttonToBinary.style.color =  "#000000";
//   buttonToBinary.location.replace("/teams");
// });

$("input").on("change", function() {
    this.setAttribute(
        "data-date",
        moment(this.value, "YYYY-MM-DD")
        .format( this.getAttribute("data-date-format") )
    )
}).trigger("change")
