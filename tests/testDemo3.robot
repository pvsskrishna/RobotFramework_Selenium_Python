*** Settings ***
Documentation      To Validate the Login Page
Library            SeleniumLibrary
Test Setup         open the browser with mortgage payment url
Test Teardown      Close Browser
Resource           resource.robot

*** Variables ***
${Error_Message_Login}     css:div[class="alert alert-danger col-md-12"]
${child_Window}            //a[contains(text(),'Free Access to')]
${Child_Window_Text}       DOCUMENTS REQUEST

*** Test Cases ***
Validate Child Window Functionality
    Click the link of Child Window
    Verify the user is Switched to Child Window
    Grab the Email id present in the child window
    Switch back to the Parent window and enter the Email Id

*** Keywords ***
Click the link of Child Window
    click element                ${child_Window}
    Sleep                        5

Verify the user is Switched to Child Window
    Switch Window        NEW
    Wait Until Location Contains    documents-request    timeout=15s
    Element Text Should Be    css:h1    ${Child_Window_Text}

Grab the Email id present in the child window
    ${text_extracted} =     Get Text    css:p[class='im-para red']    #which is a string
    log     ${text_extracted}
    @{1st_split_list}=      Split String    ${text_extracted}    at      #this a list
    Log    ${1st_split_list}
    #0 ==> Please email us
    #1 ==> mentor@rahulshettyacademy.com with below template to receive response
    
    ${string_1}=    Get From List    ${1st_split_list}    1
    log     ${string_1}
    @{2nd_split_list}=    Split String    ${string_1}         #splaiting string at white space
    Log    ${2nd_split_list}
    #0 ==>mentor@rahulshettyacademy.com
    #1 ==> with below template to receive response

    ${mail_id}=    Get From List    ${2nd_split_list}    0
    Log    ${mail_id}
    Set Global Variable        ${mail_id}
            
Switch back to the Parent window and enter the Email Id
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text        id:username    ${mail_id}    Clear Element Text
    

