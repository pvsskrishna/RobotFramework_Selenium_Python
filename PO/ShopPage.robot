*** Settings ***
Documentation   All the page objects and keywords of landing page
Library         SeleniumLibrary
Library         Collections
Library         String

*** Variables ***
${Error_Message_Login}     css:div[class="alert alert-danger col-md-12"]

*** Keywords ***
wait until element is loaded
    Wait Until Element Is Visible    ${Error_Message_Login}