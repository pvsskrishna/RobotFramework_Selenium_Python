
*** Settings ***
Documentation      To Validate the Login Page
Library            SeleniumLibrary
Library            DataDriver  file=../resources/data.csv    encoding=utf_8    dialect=unix
Test Setup         open the browser with mortgage payment url
Test Teardown      Close Browser
Resource           resource.robot
Test Template      Validate UnSuccessful Login

*** Variables ***
${Error_Message_Login}     css:div[class='alert alert-danger col-md-12']

*** Test Cases ***
Login with username ${username} and password ${password}    #varun       12345
    
*** Keywords ***
Validate UnSuccessful Login
    [Arguments]        ${username}        ${password}
    Fill the login form    ${username}        ${password}
    wait until it checks and displays error message
    verify the error message is correct

Fill the login form
    [Arguments]        ${username}        ${password}
    Input Text        id:username    ${username}           Clear Element Text
    Input Password    id:password    ${password}           Clear Element Text
    Click Button      id:signInBtn

wait until it checks and displays error message
    Wait Until Element Is Visible    ${Error_Message_Login}
    
verify the error message is correct
    Comment    ${result} =     Get Text    ${Error_Message_Login}
    Comment    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be     ${Error_Message_Login}    Incorrect username/password.