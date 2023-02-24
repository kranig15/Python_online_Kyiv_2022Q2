function openPage(pageName, elmnt) {
  // Hide all elements with class="tabcontent" by default
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }


  // Remove the background color of all tablinks/buttons
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
  }

  // Show the specific tab content
  document.getElementById(pageName).style.display = "block";

  // Show the specific tab title of page
  document.getElementById("headpage").innerHTML=pageName + " List"


  // Add the specific color to the button used to open the tab content
  elmnt.style.backgroundColor = "#CCCCCC";
  elmnt.style.color =  "#000000";




}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

