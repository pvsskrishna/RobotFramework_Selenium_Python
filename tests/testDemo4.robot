
*** Settings ***
Documentation      To Validate the Login Page
Library            SeleniumLibrary
Test Setup         open the browser with mortgage payment url
Test Teardown      Close Browser
Resource           resource.robot
Test Template     Validate UnSuccessful Login


*** Variables ***
${Error_Message_Login}     css:div[class='alert alert-danger col-md-12']
#${Error_Message_Login}     CSS:[class="alert alert-danger col-md-12"][style="display: none;"]

*** Test Cases ***                            username                   password
Valid UN and Invalid PWD                   rahulshettyacademy            learn
Invalid UN and Valid PWD                   rahul                          learning
Invalid UN and Invalid PWD                 rahul                          learn
Special characters                         !%&                           !@}})
Numbers                                    12345                          6543
    

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
    Comment    Should Be Equal As Strings    ${result}    Incorrect username/password.    #Syntax: Should Be Equal As Strings <1Tab> String1 <1Tab> String2 --> compare two strings
    Element Text Should Be     ${Error_Message_Login}    Incorrect username/password.     #Syntax: Element Text Should Be <1Tab> Locator <1Tab> Expected Text --> compare element text with expected text