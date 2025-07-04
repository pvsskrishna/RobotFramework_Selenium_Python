*** Settings ***
Documentation   All the page objects and keywords of landing page
Library         SeleniumLibrary
Library         Collections
Library         String

*** Keywords ***
Fill the login form
    [Arguments]       ${username}     ${password}
    Input Text        css:input[name='username']     ${username}        Clear Element Text
    Input Password    css:input[name='password']     ${password}        Clear Element Text
    Click Button      id:signInBtn