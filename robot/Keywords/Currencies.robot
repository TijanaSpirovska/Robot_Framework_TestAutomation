*** Settings ***
Library           SeleniumLibrary
Library           String

Resource          ../Resources/Testdata.robot
Resource          ../PageObjects/Currencies.robot
Resource          ../PageObjects/UsersPage.robot
Resource          ../PageObjects/MainPage.robot


*** Keywords ***
Navigate to Currencies page
    wait until location is                           ${DashboardPage_URL}
    click element                                    ${UserProfileBtn}
    click element                                    ${SelectConfigurationProfile}
    wait until location is                           ${ConfigurationPage_URL}
    wait until element is visible                    ${CurrenciesInConfirguration}
    click element                                    ${CurrenciesInConfirguration}
Verify Currencies page
    wait until location is                           ${CurrenciesPage_URL}
    wait until element is visible                    ${CurrenciesPage_Title}
    wait until element is visible                    ${CurrencySetUp}
    wait until element is visible                    ${AddCurrency_Select}
    wait until element is visible                    ${Currency_USD}
Navigate and verify Currencies page
    Navigate to Currencies page
    Verify Currencies page
Add a new Currency
    Click element                                    ${AddCurrency_Select}
    sleep                                            2
    Press Keys                                       ${AddCurrency_Select}   Euro    RETURN
    wait until element is visible                    ${SaveCurrency_Btn}
    click button                                     ${SaveCurrency_Btn}
    sleep                                            3
  # wait until page contains                         ${UpdLangMessage}       3
    wait until location is                           ${ConfigurationPage_URL}
Verify new Currency is created
    wait until element is visible                    ${CurrenciesInConfirguration}
    click element                                    ${CurrenciesInConfirguration}
    Verify Currencies page
    wait until element is visible                    ${Currency_USD}
    page should contain element                      ${Default_USD_Currency}
    page should not contain element                  ${Default_EUR_Currency}
Verify new Currency is updated
    wait until element is visible                    ${CurrenciesInConfirguration}
    click element                                    ${CurrenciesInConfirguration}
    Verify Currencies page
    wait until element is visible                    ${Currency_EUR}
    page should not contain element                  ${Default_USD_Currency}
    page should contain element                      ${Default_EUR_Currency}
Set new Currency as default and verify it
    CLick element                                    ${SetasDefault_Eur}
    click button                                     ${SaveCurrency_Btn}
    sleep                                            2
  # wait until page contains                         ${UpdLangMessage}       3
    wait until location is                           ${ConfigurationPage_URL}
    Verify new Currency is updated
Set back the previous Currency as default and verify it
    CLick element                                    ${SetasDefault_Usd}
    click button                                     ${SaveCurrency_Btn}
    sleep                                            2
 #  wait until page contains                         ${UpdLangMessage}       3
    wait until location is                           ${ConfigurationPage_URL}
    Verify new Currency is created
Delete a default Currency
    wait until element is visible                    ${DeleteCurrency_first}
    click element                                    ${DeleteCurrency_first}
Verify a default Currency can not be deleted
    location should be                               ${CurrenciesPage_URL}
    wait until page contains                         ${CantDelDefaultCurr}
    wait until element is visible                    ${Currency_USD}
Delete a non-default Currency
    ${Count}      Get Element Count         ${tableRow}
    ${DeleteCurrency_last}   Catenate   SEPARATOR=	       ${DeleteCurrency_Btn}  [     ${Count}     ]
    wait until element is visible                    ${DeleteCurrency_last}
    click element                                    ${DeleteCurrency_last}
    wait until element is visible                    ${SaveCurrency_Btn}
    click button                                     ${SaveCurrency_Btn}
Verify a non-default Currency is successfully deleted
    wait until location is                           ${configurationpage_url}
    wait until element is visible                    ${CurrenciesInConfirguration}
#   wait until page contains                         ${UpdCurrMessage}
    click element                                    ${CurrenciesInConfirguration}
    wait until location is                           ${CurrenciesPage_URL}
    wait until element is visible                    ${Currency_USD}
    wait until element is not visible                ${Currency_EUR}


