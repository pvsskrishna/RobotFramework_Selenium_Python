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
    &{req_body}=    Create Dictionary    name=Robotframework    isbn=123654    aisle=4573466    author=varun
    ${response}=    POST    ${Base_url}/Library/Addbook.php    json=${req_body}    expected_status=200
    log    ${response.json()}
    Dictionary Should Contain Key     ${response.json()}    ID
    ${id_value}=    Get From Dictionary     ${response.json()}    ID
    Log    ${id_value}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
    Status should be     200    ${response}
    



