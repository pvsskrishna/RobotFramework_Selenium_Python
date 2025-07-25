# Here we will be writing reusable items
*** Settings ***
Documentation   A resource file with reusable keywords and variables     #we use ... to continue the string in next line.
...             the system specific keywords created  here form our own
...             domain specific language. They utilize keywords provided 
...             by the imported SeleniumLibrary.
Library         SeleniumLibrary
Library         Collections
Library         String
#Library         DataDriver
#Library         RPA.Browser.Selenium    auto_close=${FALSE}

*** Variables ***
${Error_Message_Login}     css:div[class="alert alert-danger col-md-12"]
${valid_user_name}         rahulshettyacademy 
${invalid_user_name}       varunpaladugula
${valid_password}          learning
${invalid_password}        123456789
${url}                     https://rahulshettyacademy.com/loginpagePractise/
${browser_name}            Chrome

*** Keywords ***

open the browser with mortgage payment url
    Open Browser     ${URL}         ${browser_name}         options=add_experimental_option("detach", True)
#    Create Webdriver            Chrome
#    Go To                       ${url}
    Maximize Browser Window

Open the browser with the url
    #[Arguments]    ${browser_name}
    ${driver_path}    Set Variable If
    ...    '${browser_name}'=='chrome'     ../resources/chromedriver.exe
    ...    '${browser_name}'=='firefox'    ../resources/geckodriver.exe
    ...    '${browser_name}'=='edge'       ../resources/msedgedriver.exe
    Open Browser    ${url}    ${browser_name}    executable_path=${driver_path}
    Maximize Browser Window

Close Browser Session
    Close Browser

handle chrome password manager popup
    [Documentation]    Handles Chrome 'Change Password' alert popup if present
    Run Keyword And Ignore Error
    ...    Wait Until Element Is Visible    xpath=//button[text()='OK']    3s
    Run Keyword And Ignore Error
    ...    Click Button    xpath=//button[text()='OK']

Wait until element passed is located on page
    [Arguments]    ${Page_locator}
    Wait Until Element Is Visible    ${Page_locator}