*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/Languages.robot

*** Test Cases ***
TC_LangCRUD_1 CRUD scenario for Languages
    Navigate and verify Languages page
    Add a new Language
    Verify new Languages is created
    Delete a default Language
    Verify a default language can not be deleted
    Set new language as default and verify it
    Set back the previous language as default and verify it
    Delete a non-default Language
    Verify a non-default language is successfully deleted
