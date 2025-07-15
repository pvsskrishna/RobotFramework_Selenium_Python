#This file is the optimised version of testDemo1.robot file

*** Settings ***
Documentation            To Validate the Login Page
Library                  SeleniumLibrary
#Test Setup               open the browser with mortgage payment url    #Beginning
Test Setup               Open the browser with the url    Firefox    #Beginning
Test Teardown            Close Browser Session    #Ending
Resource                 ../PO/Generic.robot     #give two tabs between "Resource" and "resource.robot"


*** Variables ***
${Error_Message_Login}     css:div[class="alert alert-danger col-md-12"]
${Shop_Page_Load}          css:a[class='nav-link']
${Card_Titles}             css:h4[class='card-title']
${cardname}                Blackberry

*** Test Cases ***
Validate UnSuccessful Login
    Fill the login form    ${valid_user_name}    ${invalid_password}
    wait until element is loaded    ${Error_Message_Login}
    verify the error message is correct

Validate Cards Display in Shopping Page
    Fill the login form    ${valid_user_name}    ${valid_password}
    wait until element is loaded    ${Shop_Page_Load}
    Verify the Card Titles in the Shop Page
    Select the card    ${cardname}

Select the Form and navigate to child window
    Fill the Login Details and Login Form


*** Keywords ***
Fill the login form
    [Arguments]       ${username}     ${password}
    Input Text        css:input[name='username']     ${username}        Clear Element Text
    Input Password    css:input[name='password']     ${password}        Clear Element Text
    Click Button      id:signInBtn

wait until element is loaded
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify the error message is correct
    Comment    ${result} =    Get Text    ${Error_Message_Login}
    Comment    Should Be Equal As Strings    ${result}    Incorrect username/password.    #Syntax: Should Be Equal As Strings <1Tab> String1 <1Tab> String2 --> compare two strings
    Element Text Should Be     ${Error_Message_Login}    Incorrect username/password.     #Syntax: Element Text Should Be <1Tab> Locator <1Tab> Expected Text --> compare element text with expected text

Verify the Card Titles in the Shop Page
    @{expectedList}=    Create List    iphone X     Samsung Note 8    Nokia Edge    Blackberry
    @{elements}=    Get Webelements    ${Card_Titles}
    @{actualList}=    Create List

    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List     ${actualList}    ${element.text}
    END

    #${areEqual}=    Lists Should Be Equal     ${expectedList}    ${actualList}
    ${areEqual}=    Evaluate    ${expectedList}==${actualList}
    IF     ${areEqual} == ${TRUE}
        Log     Lists are Equal
    ELSE
        Log    List are not matching
    END

Select the card
    [Arguments]    ${cardname}
    @{elements}=    Get Webelements    ${Card_Titles}
    ${index}    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${element.text}' == '${cardname}'    #quotes are from syntax
        ${index} =    Evaluate    ${index} + 1    #We need to add Evaluate Keyword, For every steps or line there should be one Keyword in Robot Framework

    END
    Click Button    xpath:(//button[@class='btn btn-info'])[${index}]
    Log     ${element.text}

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



    