# Here we will be writing reusable items
*** Settings ***
Documentation   A resource file with reusable keywords and variables     #we use ... to continue the string in next line.
...             the system specific keywords created  here form our own
...             domain specific language. They utilize keywords provided 
...             by the imported SeleniumLibrary.
Library         SeleniumLibrary
Library         Collections
#Library         RPA.Browser.Selenium    auto_close=${FALSE}



*** Variables ***
${Error_Message_Login}     css:div[class="alert alert-danger col-md-12"]

${valid_user_name}         rahulshettyacademy 
${invalid_user_name}       varunpaladugula

${valid_password}          learning
${invalid_password}        123456789

${url}                     https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***

open the browser with mortgage payment url
#    Open Browser     ${URL}         chrome         options=add_experimental_option("detach", True)
    Create Webdriver            Chrome
    Go To                       ${url}
    Maximize Browser Window

Close Browser Session
    Close Browser
