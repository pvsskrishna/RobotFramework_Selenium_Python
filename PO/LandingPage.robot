*** Settings ***
Documentation   All the page objects and keywords of landing page
Library         SeleniumLibrary
Library         Collections
Library         String
Resource        ./Generic.robot

*** Variables ***
${Error_Message_Login}     css:div[class="alert alert-danger col-md-12"]

*** Keywords ***
Fill the login form
    [Arguments]       ${username}     ${password}
    Input Text        css:input[name='username']     ${username}        Clear Element Text
    Input Password    css:input[name='password']     ${password}        Clear Element Text
    Click Button      id:signInBtn

wait until element is loaded    
    Wait until element passed is located on page    ${Error_Message_Login}

verify the error message is correct
    Comment    ${result} =    Get Text    ${Error_Message_Login}
    Comment    Should Be Equal As Strings    ${result}    Incorrect username/password.    #Syntax: Should Be Equal As Strings <1Tab> String1 <1Tab> String2 --> compare two strings
    Element Text Should Be     ${Error_Message_Login}    Incorrect username/password.     #Syntax: Element Text Should Be <1Tab> Locator <1Tab> Expected Text --> compare element text with expected text.

Fill the Login Details and Login Form
    Input Text            id:username            rahulshettyacademy
    Input Password        password               learning
    Click Button          css:input[value='user']
    Wait Until Element Is Visible    css:div[class='modal-content']
    Click Button          css:button[id='okayBtn']
    Wait Until Element Is Not Visible    css:div[class='modal-content']
    Select From List By Value    css:select[class='form-control']    teach
    Select Checkbox    css:input[id='terms']
    Checkbox Should Be Selected    css:input[id='terms']