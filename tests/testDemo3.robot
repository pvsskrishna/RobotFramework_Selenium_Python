*** Settings ***
Documentation      To Validate the Login Page
Library            SeleniumLibrary
Test Setup         open the browser with mortgage payment url
Test Teardown      Close Browser
Resource           resource.robot

*** Variables ***
${Error_Message_Login}     css:div[class="alert alert-danger col-md-12"]
${child_Window}            //a[contains(text(),'Free Access to')]

*** Test Cases ***
Validate Child Window Functionality
    Click the link of Child Window
#    Verify the user is Switched to Child Window
#    Grab the Email id present in the child window
#    Switch back to the Parent window and enter the Email Id

*** Keywords ***
Click the link of Child Window
    Click Element                ${child_Window}
    Sleep                        5
    Switch Window

#Verify the user is Switched to Child Window
#Grab the Email id present in the child window
#Switch back to the Parent window and enter the Email Id