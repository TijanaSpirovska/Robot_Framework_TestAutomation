*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/Currencies.robot

*** Test Cases ***
#User tries to create a new Currency(Vale)
TC_Lang_1 Create a new Currency
    Navigate and verify Currencies page
    Add a new Currency
    Verify new Currency is created
#User tries to delete a default Currency and verifies it can not be removed from the Currencies list (Vale)
TC_Lang_2 Delete a default Currency
    Navigate and verify Currencies page
    Delete a default Currency
    Verify a default Currency can not be deleted

#User sets a non-default Currency as default and verifies it, than sets the previous currency as default and verifies it (Vale)
TC_Lang_3 Set new Currency as default
    Navigate and verify Currencies page
    Set new Currency as default and verify it
    Set back the previous Currency as default and verify it

#User tries to delete a non-default Currency and verifies it can be deleted from the Currencies list (Vale)
TC_Lang_4 Delete a non-default Currency
    Navigate and verify Currencies page
    Delete a non-default Currency
    Verify a non-default Currency is successfully deleted