*** Settings ***
Documentation   All the page objects and keywords of landing page
Library         SeleniumLibrary
Library         Collections
Library         String
Resource        ../PO/Generic.robot


*** Variables ***
${Shop_Page_Load}          css:a[class='nav-link']
${Card_Titles}             css:h4[class='card-title']

*** Keywords ***
Enter The Country And Select Terms
    [Arguments]    ${country_name}
    Input Text    xpath://input[@id='country']    ${country_name}
    Generic.Wait until element passed is located on page    xpath://a[text()='${country_name}']
    Click Element    xpath://a[text()='${country_name}']    #clicking the displayed country name - handled dynamic dropdown.
    Click Element    css:.checkbox label[for='checkbox2']    #clicking the checkbox.

Purchase The Product And Confirm The Message
    Click Button    xpath://input[@value='Purchase']    #clicking the purchase button.
    Page Should Contain    Success!    
    

