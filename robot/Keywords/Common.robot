*** Settings ***
Library           SeleniumLibrary
Resource          ../PageObjects/HomePage.robot
Resource          ../Resources/Testdata.robot
Resource          ../Keywords/Login.robot
Resource          ../PageObjects/MainPage.robot

*** Keywords ***
Open Admin app
    Open Browser              ${mainUrl}    ${browser}    # Used only for Login test cases (Vale)
    Maximize Browser Window

Open Admin app and Login with valid credintials        #Used for the setup in each test case(Vale)
    SeleniumLibrary.open browser            ${mainUrl}    ${browser}
    Maximize Browser Window
    Navigate to Login page
    Login User                              ${Valid_Login_Email}             ${Valid_Login_Password}
    Verify that user is logged in

Log out
    Wait until page contains element     ${profilePicBtn}
    Click Button                         ${profilePicBtn}
    Click Link                           ${logoutLink}
    Location Should be                   ${mainUrl}
    Wait until page contains element     ${LoginBtn_HomePage}
    Close Browser