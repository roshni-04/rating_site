
<?php
/* ============================================================
    All serverside validation functions
==============================================================*/

$addrPat = "^[a-zA-Z 0-9\\.\\,\\+\\-\\(\\)\\'\\@\\&\\/\\_]*$";  //. , + - ( ) ' @ & / _
$alphaNumPat = "[a-zA-Z0-9 ]+";
$alphaNumPatWithNull = "[a-zA-Z0-9 ]*";

$alphaPatWithNull = "/[a-zA-Z ]*/";

//  "/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/";
$numPat = "[0-9]+";
$numPatWithNull = "[0-9]*";
$pinPat = "[0-9]{6}";
$usernamePat = "^[a-zA-Z0-9]*$";
$datePat = "^(?:(?:31(\\/|-|\\.)(?:0?[13578]|1[02]))\\1|(?:(?:29|30)(\\/|-|\\.)(?:0?[1,3-9]|1[0-2])\\2))"
        ."(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$|^(?:29(\\/|-|\\.)0?2\\3(?:(?:(?:1[6-9]|[2-9]\\d)?(?:0[48]|[2468][048]|[13579][26])|"
        ."(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\\d|2[0-8])(\\/|-|\\.)(?:(?:0?[1-9])|(?:1[0-2]))\\4(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$";

/*
^: Asserts the position at the start of the string.
[a-zA-Z0-9._%+-]+: Matches one or more characters that are alphanumeric or one of ._%+-.
@: Matches the "@" character.
[a-zA-Z0-9.-]+: Matches one or more characters that are alphanumeric or one of .-.
\.: Matches the "." character.
[a-zA-Z]{2,}: Matches two or more alphabetic characters (to ensure the top-level domain is at least two characters long).
$: Asserts the position at the end of the string

*/


function filter_myinput($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }


function email_validate(String $emaildata){
    $emailPat = "/^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/i";
    return preg_match($emailPat, $emaildata);
}

function name_validate(String $namedata){
    $alphaPat = "/[a-zA-Z ]+/";
    return preg_match($alphaPat, $namedata);
}


?>