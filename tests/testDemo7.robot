
*** Settings ***
Documentation            To Validate the Login Page
Library                  SeleniumLibrary
Library                  ../customLibraries/Shop.py
Test Setup               open the browser with mortgage payment url    #Beginning
Test Teardown            Close Browser Session    #Ending
Resource                 ../PO/Generic.robot
Resource                 ../PO/LandingPage.robot
Resource                 ../PO/ShopPage.robot
Resource                 ../PO/CheckoutPage.robot
Resource                 ../PO/ConfirmationPage.robot


*** Variables ***
@{list_of_products}        Blackberry    Nokia Edge
${country_name}            ind

*** Test Cases ***
#Validate UnSuccessful Login
#
#    LandingPage.Fill the login form    ${valid_user_name}    ${invalid_password}
#    LandingPage.wait until element is loaded
#    LandingPage.verify the error message is correct

#Validate Cards Display in Shopping Page
End to End Ecommerce Product Validation

    LandingPage.Fill the login form    ${valid_user_name}    ${valid_password}
    Sleep    3s
    handle chrome password manager popup
    Sleep    3s
    ShopPage.wait until element is loaded
    ShopPage.Verify the Card Titles in the Shop Page
    Add Items To Cart And Checkout   ${list_of_products}
    CheckoutPage.Verify Items In Checkout Page And Proceed    ${list_of_products}
    ConfirmationPage.Enter The Country And Select Terms    ${country_name}
    ConfirmationPage.Purchase The Product And Confirm The Message

#Select the Form and navigate to child window
#    LandingPage.Fill the Login Details and Login Form