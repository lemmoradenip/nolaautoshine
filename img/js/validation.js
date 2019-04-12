//function validateForm() {
//    var x = document.forms["myForm"]["ctl00$ContentPlaceHolder1$txtCFname"].value;
//    if (x == "") {
       
//        console.log("x");
//        return false;
//    }
//}

function myFunction() {
    var x, text;

    // Get the value of the input field with id="numb"
    x = document.getElementById("ContentPlaceHolder1_txtCFname").value;

    // If x is Not a Number or less than one or greater than 10
    if (isNaN(x) || x < 1 || x > 10) {
        text = "Input not valid";
    } else {
        text = "Input OK";
    }
    //document.getElementById("demo").innerHTML = text;
    console.log(text);
}