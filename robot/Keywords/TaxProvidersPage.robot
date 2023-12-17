*** Settings ***
Library     SeleniumLibrary
Resource    ../PageObjects/TaxProvidersPage.robot
Resource    ../Resources/Testdata.robot
Resource    ../PageObjects/MainPage.robot

*** Keywords ***

Navigate to Tax Providers Page
    Wait until page contains element     ${avatarbtn}
    Click Button                         ${avatarbtn}
    Click Link                           ${configuration}
    Wait until location is               ${configurationUrlPath}
    Wait until element is visible        ${TaxProvidersInConfiguration}
    Click element                        ${TaxProvidersInConfiguration}
    Wait until location is               ${taxProvidersUrl}
Navigate to Tax Provider
    Wait until element is visible        ${taxJarTab}
    Click element       ${taxJarTab}
    Wait until element is visible        ${tabIsDisplayed}
Confirm if the Provider is active
    Navigate to Tax Providers Page
    Navigate to Tax Provider
    Wait until page contains element     ${taxJarActive}
Deactivate & Verify TaxJar is deactivated
   # Wait until page contains element    ${taxJarTab}
   # Click element       ${taxJarTab}
   # Wait until element is visible       ${tabIsDisplayed}
   # Input Text       ${taxJarAPITokenInput}      ${taxJarAPIToken}
   # ${providerIsActive}=   Run Keyword And Return Status    Page should contain element    ${taxJarIsActive}
   # Run keyword if      ${providerIsActive}!= ${True}   Click Element  ${taxJarStatusChkBox}
   click element                          ${taxJarStatusCheckBox}
   click button                           ${updatebtn}
   wait until element is visible          ${taxJarInactive}
Activate & Verify TaxJar is activated
   click element                          ${taxJarStatusCheckBox}
   click button                           ${updatebtn}
   wait until element is visible          ${taxJarActive}


Deactivate & Clear TaxJar
    Wait until page contains element    ${taxJarTab}
    Click element           ${taxJarTab}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Clear Element Text                  ${taxJarAPITokenInput}
    ${providerIsActive}=   Run Keyword And Return Status    Page should contain element    ${taxJarIsActive}
    Run keyword if          ${providerIsActive}== ${True}   Click Element  ${taxJarStatusChkBox}
    Click Button                        ${updateProviderBtn1}




Activate Avalara
    Wait until page contains element    ${avalaratab}
    Click element       ${avalaraTab}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Input Text       ${avalaraUsernameInput}      ${taxJarAPIToken}
    Input Text       ${avalaraPasswordInput}      ${avalaraUsername}
    Input Text       ${accountIdInput}            ${avalaraPassword}
    Input Text       ${companyIdInput}            ${accountId}
    Input Text       ${taxpayerIdNrInput}         ${companyId}
    ${providerIsActive}=   Run Keyword And Return Status    Page should contain element    ${avalaraIsActive}
    Run keyword if      ${providerIsActive}!= ${True}   Click Element  ${avalaraStatusChkBox}
    Click Button     ${updateProviderBtn2}


Deactivate & Clear Avalara
    Wait until page contains element    ${avalaratab}
    Click element           ${avalaratab}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Clear Element Text                  ${avalaraUsernameInput}
    Clear Element Text                  ${avalaraPasswordInput}
    Clear Element Text                  ${accountIdInput}
    Clear Element Text                  ${companyIdInput}
    Clear Element Text                  ${taxpayerIdNrInput}
    ${providerIsActive}=   Run Keyword And Return Status    Page should contain element    ${avalaraIsActive}
    Run keyword if          ${providerIsActive}== ${True}   Click Element  ${avalaraStatusChkBox}
    Click Button                        ${updateProviderBtn2}



Activate Vertex
    Wait until page contains element    ${vertexTab}
    Click element       ${vertexTab}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Input Text       ${vertexAPITokenInput}      ${vertexAPIToken}
    ${providerIsActive}=   Run Keyword And Return Status    Page should contain element    ${vertexIsActive}
    Run keyword if      ${providerIsActive}!= ${True}   Click Element  ${vertexStatusChkBox}
    Click Button     ${updateProviderBtn3}


Deactivate & Clear Vertex
    Wait until page contains element    ${vertexTab}
    Click element           ${vertexTab}
    Wait until page contains element    ${tabIsDisplayed}
    Wait until element is visible       ${tabIsDisplayed}
    Clear Element Text                  ${vertexAPITokenInput}
    ${providerIsActive}=   Run Keyword And Return Status    Page should contain element    ${vertexIsActive}
    Run keyword if          ${providerIsActive}== ${True}   Click Element  ${vertexStatusChkBox}
    Click Button                        ${updateProviderBtn3}







