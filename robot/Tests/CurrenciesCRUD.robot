*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/Currencies.robot

*** Test Cases ***
TC_LangCRUD_1 CRUD scenario for Languages
    Navigate and verify Currencies page
    Add a new Currency
    Verify new Currency is created
    Delete a default Currency
    Verify a default Currency can not be deleted
    Set new Currency as default and verify it
    Set back the previous Currency as default and verify it
    Delete a non-default Currency
    Verify a non-default Currency is successfully deleted