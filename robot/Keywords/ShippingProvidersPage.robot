*** Settings ***
Library     SeleniumLibrary
Resource    ../PageObjects/ShippingProvidersPage.robot
Resource    ../Resources/Testdata.robot
Resource    ../PageObjects/MainPage.robot
Resource    ../PageObjects/UsersPage.robot
*** Keywords ***

Go to Shipping Providers Page
    Wait until page contains element     ${profilePicBtn}
    Click Button                         ${profilePicBtn}
    Click Element                        ${SelectConfigurationProfile1}
    Go to Shipping Providers

Go to Shipping Providers
    Wait until location is               ${configurationUrlPath}
    Wait until page contains element     ${shipProvidersLink}
    Click Link                           ${shipProvidersLink}
    Location should be                   ${shipProvidersUrl}



Update & Activate FedEx Provider
    Wait until page contains element    ${fedExTab}
    Click element       ${fedExTab}
    ${providerIsActive}=   Run Keyword And Return Status    Element Should Be Visible                 ${fedExActiveClass}

    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Input text          ${fedExKeyInput}           ${fedExKey}
    Input text          ${fedExPasswordInput}      ${fedExPassword}
    Input text          ${fedExAccNrInput}         ${fedExAccNr}
    Input text          ${fedExMeterNrInput}       ${fedExMeterNr}

    Run keyword if      ${providerIsActive}!= ${True}   Click Element  ${fedExStatusChkBox}
    Click element       ${groundShipping}
    Click element       ${grndShippingHomeDelivery}
    Click element       ${costEffective}
    Click element       ${overnightShippingEarly}
    Click element       ${overnightShippingAfternoon}
    Click element       ${midmorning}
    Click element       ${fastSecond}
    Click element       ${2dayAM}
    Click Button        ${updateProviderBtn1}
#    Page Should Contain    ${SuccessfulyUpdate_Msg}

Clear mandatory fields - Fedex
    Wait until page contains element    ${fedExTab}
    Click element       ${fedExTab}
#    Click Element    ${fedExKeyInput}
    Press Keys       ${fedExKeyInput}     CTRL+A+DELETE
    Click Element    ${fedExPasswordInput}
    Press Keys       ${fedExPasswordInput}   CTRL+A+DELETE
    Click Element    ${fedExAccNrInput}
    Press Keys       ${fedExAccNrInput}      CTRL+A+DELETE
    Click Element    ${fedExMeterNrInput}
    Press Keys       ${fedExMeterNrInput}    CTRL+A+DELETE
    Click Button        ${updateProviderBtn1}
Update & Activate Easy Post
    Wait until page contains element    ${easyPostTab}
    Click element       ${easyPostTab}
    ${element_present}=  Run Keyword And Return Status    Element Should Be Visible     ${easyPostActiveClass}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Input text          ${easyPostInput}           ${easyPostKey}
    Run Keyword If    ${element_present} != ${True}         Click element       ${easyPostStatusChkBox}

    Click Button        ${updateProviderBtn2}
    sleep               2
    Page Should Contain    ${SuccessfulyUpdate_Msg}

Clear mandatory fields - Easy Post
    Wait until page contains element    ${easyPostTab}
    Click element       ${easyPostTab}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Click Element              ${easyPostInput}
    Press Keys          ${easyPostInput}                   CTRL+A+DELETE
    Click Button        ${updateProviderBtn2}

Confirm if the Provider is active
    [Arguments]    ${arg1}
    Go to Shipping Providers
    Wait until page contains element     ${arg1}


Deactivate & Clear FedEx
    Wait until page contains element    ${fedExTab}
    Click element           ${fedExTab}
    ${providerIsActive}=   Run Keyword And Return Status     Element Should Be Visible         ${fedExActiveClass}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Clear Element Text      ${fedExKeyInput}
    Clear Element Text      ${fedExPasswordInput}
    Clear Element Text      ${fedExAccNrInput}
    Clear Element Text      ${fedExMeterNrInput}
    Run keyword if          ${providerIsActive}== ${True}   Click Element  ${fedExStatusChkBox}
    Click element           ${groundShipping}
    Click element           ${grndShippingHomeDelivery}
    Click element           ${costEffective}
    Click element           ${overnightShippingEarly}
    Click element           ${overnightShippingAfternoon}
    Click element           ${midmorning}
    Click element           ${fastSecond}
    Click element           ${2dayAM}
    Click Button            ${updateProviderBtn1}




Deactivate & Clear EasyPost
    Wait until page contains element    ${easyPostTab}
    Click element       ${easyPostTab}
    ${element_present}=  Run Keyword And Return Status    Element Should Be Visible    ${easyPostActiveClass}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Input text          ${easyPostInput}           ${easyPostKey}
    Run Keyword If    ${element_present} == ${True}         Click element       ${easyPostStatusChkBox}

    Click Button        ${updateProviderBtn2}

Confirm that the providers can not be updated - Fedex
    Page Should Contain Element       ${fedExKey_ErrorMsg}
    Page Should Contain Element       ${fedExPassword_ErrorMsg}
    Page Should Contain Element       ${fedExAccNr_ErrorMsg}
    Page Should Contain Element       ${fedExMeterNr_ErrorMsg}
Confirm that the providers can not be updated - Easy Post
    Page Should Contain Element    ${EasyPostKey_ErrorMsg}


