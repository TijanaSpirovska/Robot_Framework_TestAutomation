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

*** Test Cases ***
TC0001_Login with valid credintials
    Navigate to Login page
    Login User    ${Valid_Login_Email}    ${Valid_Login_Password}
    Verify that user is logged in

TC0002_Login with wrong username
    Navigate to Login page
    Login User    ${Wrong_Login_Email}    ${Valid_Login_Password}
    Verify Errror message durring Login   ${ErrorMsgText_LoginPage}

TC0003_Login with wrong password
    Navigate to Login page
    Login User    ${Valid_Login_Email}    ${Wrong_Login_Password}
    Verify Errror message durring Login   ${ErrorMsgText_LoginPage}
