*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${Base_url}=    http://216.10.245.166
*** Test Cases ***
Play around with Dictionary
    &{data}=     Create Dictionary    name=varun    pen=paper    url=https://apaims2.0.vassarlabs.com/login
    Log    ${data}
    Dictionary should contain key    ${data}    url
    ${url}=    Get From Dictionary   ${data}    url
    log     ${url}
    log     ${data}[name]
    ${name}=    Get From Dictionary    ${data}    name
    log     ${name}

Add Book Into Library Database
    &{req_body}=    Create Dictionary    name=Robotframework    isbn=1234    aisle=45766    author=varun
    POST    ${Base_url}/Library/Addbook.php    json=${req_body}    expected_status=200


