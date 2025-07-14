*** Settings ***
Documentation   All the page objects and keywords of landing page
Library         SeleniumLibrary
Library         Collections
Library         String
Resource        ./Generic.robot

*** Variables ***


*** Keywords ***
Verify Items In Checkout Page And Proceed
    [Arguments]    ${expected_list}
    ${rows}=    Get Webelements    xpath://tr
    ${total_rows}=    Get Length    ${rows}
    ${total_rows-2}=    Evaluate    ${total_rows}-2
    ${actual_list}=    Create List

    FOR    ${index}  IN RANGE    1    ${total_rows-2}
        ${item}=    Get Text    xpath:(//tr[${index}]/td[1]/div/div/h4/a)
        Log To Console     ${item}
        Append To List    ${actual_list}    ${item}
    END

    Log    Actual items in checkout page: ${actual_list}
    Should Be Equal    ${actual_list}    ${expected_list}
    Click Element    xpath://button[@class='btn btn-success']