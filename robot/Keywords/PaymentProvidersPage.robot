*** Settings ***
Library     SeleniumLibrary
Resource    ../PageObjects/PaymentProvidersPage.robot
Resource    ../Resources/Testdata.robot
Resource    ../PageObjects/MainPage.robot

*** Keywords ***
Go to Payment Providers Page
    Wait until page contains element     ${profilePicBtn}
    Click Button                         ${profilePicBtn}
    Click Link                           ${SelectConfigurationProfile}
    Go to Payment Providers

Go to Payment Providers
    Wait until location is               ${configurationUrlPath}
    Wait until page contains element     ${paymentProvidersLink}
    Click Link                           ${paymentProvidersLink}
    Location should be                   ${paymentProvidersUrl}

Confirm if the Provider is active
    [Arguments]    ${arg1}
    Go to Payment Providers
    Wait until page contains element     ${arg1}



Update & Activate Stripe
    Wait until page contains element    ${stripeTab}
    Click element       ${stripeTab}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Input Text       ${stripePublicKeyInput}      ${stripePublicKey}
    input text       ${stripeSecretKeyInput}      ${stripeSecretKey}
    ${providerIsActive}=   Run Keyword And Return Status    Page Should Contain Element           ${stripeIsActive}
    Run keyword if      ${providerIsActive}!= ${True}   Click Element  ${stripeStatusChkBox}
    Click Button     ${updateProviderBtn1}

Update & Activate Square
    Wait until page contains element    ${squareTab}
    Click element       ${squareTab}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Input Text       ${squareAppIdInput}         ${squareAppId}
    input text       ${squareTokenInput}         ${squareToken}
    input text       ${squareLocationInput}      ${squareLocation}
    ${providerIsActive}=   Run Keyword And Return Status    Page Should Contain Element          ${squareIsActive}
    Run keyword if      ${providerIsActive}!= ${True}   Click Element  ${squareStatusChkBox}
    Click Button     ${updateProviderBtn2}

Update & Activate PayPal
    Wait until page contains element    ${payPalTab}
    Click element       ${payPalTab}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Input Text       ${paypalClientIdInput}          ${paypalClientId}
    input text       ${paypalClientSecretInput}      ${paypalClientSecret}
    ${providerIsActive}=   Run Keyword And Return Status    Page Should Contain Element           ${paypalIsActive}
    Run keyword if      ${providerIsActive}!= ${True}   Click Element  ${paypalStatusChkBox}
    Click Button     ${updateProviderBtn3}


Remove mandatory fileds - Paypal
    Wait until page contains element    ${payPalTab}
    Click element       ${payPalTab}
    sleep             2
    Click Element    ${paypalClientIdInput}
    Press Keys       ${paypalClientIdInput}         CTRL+A+DELETE
    Click Element    ${paypalClientSecretInput}
    Press Keys       ${paypalClientSecretInput}     CTRL+A+DELETE
    Click Button     ${updateProviderBtn3}
Remove mandatory fileds - Square
    Wait until page contains element    ${squareTab}
    Click element       ${squareTab}
    sleep             2
    Click Element    ${squareAppIdInput}
    Press Keys       ${squareAppIdInput}         CTRL+A+DELETE
    Click Element    ${squareTokenInput}
    Press Keys       ${squareTokenInput}         CTRL+A+DELETE
    Click Element    ${squareLocationInput}
    Press Keys       ${squareLocationInput}      CTRL+A+DELETE
    Click Button     ${updateProviderBtn2}
Remove mandatory fileds - Stripe
    Wait until page contains element    ${stripeTab}
    Click element       ${stripeTab}
    sleep             2
    Click Element    ${stripePublicKeyInput}
    Press Keys       ${stripePublicKeyInput}          CTRL+A+DELETE
    Click Element    ${stripeSecretKeyInput}
    Press Keys       ${stripeSecretKeyInput}     CTRL+A+DELETE
    Click Button     ${updateProviderBtn1}
Deactivate & Clear Stripe
    Wait until page contains element    ${stripeTab}
    Click element       ${stripeTab}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Clear Element Text       ${stripePublicKeyInput}
    Clear Element Text       ${stripeSecretKeyInput}
    ${providerIsActive}=   Run Keyword And Return Status    Page should contain element    ${stripeIsActive}
    Run keyword if      ${providerIsActive}== ${True}   Click Element  ${stripeStatusChkBox}
    Click Button     ${updateProviderBtn1}

Deactivate & Clear Square
    Wait until page contains element    ${squareTab}
    Click element       ${squareTab}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Clear Element Text       ${squareAppIdInput}
    Clear Element Text       ${squareTokenInput}
    Clear Element Text       ${squareLocationInput}
    ${providerIsActive}=   Run Keyword And Return Status    Page should contain element    ${squareIsActive}
    Run keyword if      ${providerIsActive}== ${True}   Click Element  ${squareStatusChkBox}
    Click Button     ${updateProviderBtn2}

Deactivate & Clear PayPal
    Wait until page contains element    ${payPalTab}
    Click element       ${payPalTab}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Clear Element Text       ${paypalClientIdInput}
    Clear Element Text       ${paypalClientSecretInput}
    ${providerIsActive}=   Run Keyword And Return Status    Page should contain element    ${paypalIsActive}
    Run keyword if      ${providerIsActive}== ${True}   Click Element  ${paypalStatusChkBox}
    Click Button     ${updateProviderBtn3}

Confirm that the providers can not be updated - Stripe
    Page Should Contain Element     ${StripePublicKEy_ErrorMsg}
    Page Should Contain Element    ${StripePrivateKEy_ErrorMsg}
Confirm that the providers can not be updated - Square
    Page Should Contain Element    ${squareAppId_ErrorMsg}
    Page Should Contain Element    ${squareToken_ErrorMsg}
    Page Should Contain Element    ${squareLocation_ErrorMsg}
Confirm that the providers can not be updated - Pay Pal
    Page Should Contain Element    ${paypalClientID_ErrorMsg}
    Page Should Contain Element    ${paypalClientSecret_ErrorMsg}































