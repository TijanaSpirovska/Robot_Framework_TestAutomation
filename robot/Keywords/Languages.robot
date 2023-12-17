*** Settings ***
Library           SeleniumLibrary
Library           String

Resource          ../Resources/Testdata.robot
Resource          ../PageObjects/LanguageCRUD.robot
Resource          ../PageObjects/UsersPage.robot
Resource          ../PageObjects/MainPage.robot


*** Keywords ***
Navigate to Languages page
    wait until location is                           ${DashboardPage_URL}
    click element                                    ${UserProfileBtn}
    click element                                    ${SelectConfigurationProfile}
    wait until location is                           ${ConfigurationPage_URL}
    wait until element is visible                    ${LanguagesInConfirguration}
    click element                                    ${LanguagesInConfirguration}
Verify Languages page
    wait until location is                           ${LanguagesPage_URL}
    wait until element is visible                    ${LanguagePage_Title}
    wait until element is visible                    ${LanguageSetUp}
    wait until element is visible                    ${AddLanguage_Select}
    wait until element is visible                    ${Language_USA}
Navigate and verify Languages page
   Navigate to Languages page
   Verify Languages page
Add a new Language
    Click element                                    ${AddLanguage_Select}
    sleep                                            2
    Press Keys                                       ${AddLanguage_Select}   Albania    RETURN
    wait until element is visible                    ${SaveLanguage_Btn}
    click button                                     ${SaveLanguage_Btn}
    sleep                                            3
  #  wait until page contains                         ${UpdLangMessage}       3
    wait until location is                           ${ConfigurationPage_URL}
Verify new Languages is created
    wait until element is visible                    ${LanguagesInConfirguration}
    click element                                    ${LanguagesInConfirguration}
    verify languages page
    wait until element is visible                    ${Language_ALB}
    page should contain element                      ${Default_USA_Language}
    page should not contain element                  ${Default_ALB_Language}
Verify new Languages is updated
    wait until element is visible                    ${LanguagesInConfirguration}
    click element                                    ${LanguagesInConfirguration}
    verify languages page
    wait until element is visible                    ${Language_ALB}
    page should not contain element                  ${Default_USA_Language}
    page should contain element                      ${Default_ALB_Language}
Set new language as default and verify it
    CLick element                                    ${SetasDefault_Alb}
    click button                                     ${SaveLanguage_Btn}
    sleep                                            2
  #  wait until page contains                         ${UpdLangMessage}       3
    wait until location is                           ${ConfigurationPage_URL}
    Verify new Languages is updated
Set back the previous language as default and verify it
    CLick element                                    ${SetasDefault_Usa}
    click button                                     ${SaveLanguage_Btn}
    sleep                                            2
  #  wait until page contains                         ${UpdLangMessage}       3
    wait until location is                           ${ConfigurationPage_URL}
    Verify new Languages is created
Delete a default Language
    wait until element is visible                    ${DeleteLanguage_first}
    click element                                    ${DeleteLanguage_first}
Verify a default language can not be deleted
    location should be                               ${LanguagesPage_URL}
    wait until page contains                         ${CantDelDefaultLang}
    wait until element is visible                    ${Language_USA}
Delete a non-default Language
    ${Count}      Get Element Count         ${tableRow}
    ${DeleteLanguage_last}   Catenate   SEPARATOR=	       ${DeleteLangBtn}  [     ${Count}     ]

    wait until element is visible                    ${DeleteLanguage_last}
    click element                                    ${DeleteLanguage_last}
    wait until element is visible                    ${savelanguage_btn}
    click button                                     ${savelanguage_btn}
Verify a non-default language is successfully deleted
    wait until location is                           ${configurationpage_url}
    wait until element is visible                    ${LanguagesInConfirguration}
   # wait until page contains                         ${UpdLangMessage}
    click element                                    ${LanguagesInConfirguration}
    wait until location is                           ${LanguagesPage_URL}
    wait until element is visible                    ${Language_USA}
    wait until element is not visible                ${Language_ALB}





