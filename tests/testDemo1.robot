# *** Module Name *** --> Syntax to define module name in robotframework.
# Documentation <1Tab space> Description about the Module
# Library <1Tab space> Library Name ==>this is like importing library


*** Settings ***
Documentation      To Validate the Login Page
Library            SeleniumLibrary
Test Teardown      Close Browser

*** Variables ***
${Error_Message_Login}     css:div[class="alert alert-danger col-md-12"]

#Under  *** Test Cases*** we will write business scenarios.
*** Test Cases ***
Validate UnSuccessful Login
    open the browser with mortgage payment url
    Fill the login form
    wait until it checks and displays error message
    verify the error message is correct

# Under *** Keywords *** we will tie up keywords written in test cases to actual selenium keywords.
*** Keywords ***
open the browser with mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/
    
Fill the login form
    Input Text        id:username    varunpaladugula    Clear Element Text
    Input Password    id:password    12345678           Clear Element Text
    Click Button      id:signInBtn

wait until it checks and displays error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify the error message is correct
    Comment    ${result} =     Get Text    ${Error_Message_Login}
    Comment    Should Be Equal As Strings    ${result}    Incorrect username/password.    #Syntax: Should Be Equal As Strings <1Tab> String1 <1Tab> String2 --> compare two strings
    Element Text Should Be     ${Error_Message_Login}    Incorrect username/password.     #Syntax: Element Text Should Be <1Tab> Locator <1Tab> Expected Text --> compare element text with expected text