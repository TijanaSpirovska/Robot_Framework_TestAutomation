*** Settings ***
Test Setup        Open Admin app
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/Login.robot
Resource          ../Resources/Testdata.robot
Resource          ../PageObjects/LoginPage.robot
Resource          ../PageObjects/HomePage.robot
Resource          ../PageObjects/Dashboard.robot

*** Test Cases ***
TC004_Verify Dashboard page content

Verify Navigation Links
    Navigate to Login page
    Login User    ${Valid_Login_Email}    ${Valid_Login_Password}
    Verify that user is logged in
    Sleep    3
    Click Element    ${Products_MenuLink}
    Element Text Should Be    class:page-title    Products
