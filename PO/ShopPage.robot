*** Settings ***
Documentation   All the page objects and keywords of landing page
Library         SeleniumLibrary
Library         Collections
Library         String
Resource        ./Generic.robot

*** Variables ***
${Shop_Page_Load}          css:a[class='nav-link']
${Card_Titles}             css:h4[class='card-title']

*** Keywords ***
wait until element is loaded
    Wait until element passed is located on page    ${Shop_Page_Load}

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
        Log    Lists are not matching
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