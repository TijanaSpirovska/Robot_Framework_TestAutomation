*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/HomePage.robot
Resource          ../PageObjects/LoginPage.robot
Resource          ../Resources/Testdata.robot

*** Keywords ***
Navigate to Login page
    Wait Until Page Contains Element    ${LoginBtn_HomePage}
    Click Element                       ${LoginBtn_HomePage}
    Wait Until Page Contains            Forgotten your login details?
    Location Should Be                  https://iwjwt.iwcommerce.com/login

Login User
    [Arguments]    ${email}    ${password}    # User should provide valid email and password in order to successfully login in the app
    Input Text        ${Email_Input_LoginPage}       ${email}
    Input Password    ${Password_Input_LoginPage}    ${password}
    Click Button      ${LoginBtn_LoginPage}

Verify that user is logged in
    ${authRequestFromIWJWT}=      Run Keyword And Return Status       Wait Until Location Contains    ${iwjwtUrl}
    IF    ${authRequestFromIWJWT} == True
        Click Button        ${authorizeBtn}
    END
    Wait Until Page Contains             Dashboard
    Location Should Be                   ${DashboardPage_URL}

Verify Errror message durring Login
    [Arguments]    ${Error_text}
    Element Text Should Be    ${ErrorMsg_Locator_LoginPage}    ${Error_text}
    [Teardown]
