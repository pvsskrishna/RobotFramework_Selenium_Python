*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${Base_url}=    http://216.10.245.166
${book_id}
${book_name}    Robotframework

*** Test Cases ***
#API Test Case requirement document for referring---> https://drive.google.com/file/d/18FC3jDnsOol9zn3_KGSrjg35a4unpiSG/view
Play around with Dictionary
    [Tags]    API
    &{data}=     Create Dictionary    name=varun    pen=paper    url=https://apaims2.0.vassarlabs.com/login
    Log    ${data}
    Dictionary should contain key    ${data}    url
    ${url}=    Get From Dictionary   ${data}    url
    log     ${url}
    log     ${data}[name]
    ${name}=    Get From Dictionary    ${data}    name
    log     ${name}

Add Book Into Library Database
    [Tags]    API
    &{req_body}=    Create Dictionary    name=Robotframework    isbn=123654    aisle=4573466    author=varun
    ${response}=    POST    ${Base_url}/Library/Addbook.php    json=${req_body}    expected_status=200
    log    ${response.json()}
    Dictionary Should Contain Key     ${response.json()}    ID
    ${book_id}=    Get From Dictionary     ${response.json()}    ID
    Set Global Variable    ${book_id}
    Log    ${book_id}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]
    Status should be     200    ${response}

Get the Book Details Which got added
    [Tags]    API
    ${get_response}=    GET     ${Base_url}/Library/GetBook.php    params=ID=${book_id}    expected_status=200
    Log    ${get_response.json()}
    Should Be Equal As Strings    ${book_name}    ${get_response.json()}[0][book_name]

Delete the Book from Database
    [Tags]    API
    ${delete_request}=    Create Dictionary    ID=${book_id}
    ${delete_response}=    POST    ${base_url}/Library/DeleteBook.php    json=${delete_request}    expected_status=200
    Log    ${delete_response.json()}
    Should Be Equal As Strings    book is successfully deleted    ${delete_response.json()}[msg]

    



