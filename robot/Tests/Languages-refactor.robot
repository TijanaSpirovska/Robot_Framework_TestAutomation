*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/Languages.robot

*** Test Cases ***
#User tries to create a new Language (Vale)
TC_Lang_1 Create a new Language
    Navigate and verify Languages page
    Add a new Language
    Verify new Languages is created

#User tries to delete a default Language and verifies it can not be removed from the Languages list (Vale)
TC_Lang_2 Delete a default Language
    Navigate and verify Languages page
    Delete a default Language
    Verify a default language can not be deleted

#User sets a non-default Language as default and verifies it, than sets the previous language as default and verifies it (Vale)
TC_Lang_3 Set new language as default
    Navigate and verify Languages page
    Set new language as default and verify it
    Set back the previous language as default and verify it

#User tries to delete a non-default Language and verifies it can be deleted from the Languages list (Vale)
TC_Lang_4 Delete a non-default Language
    Navigate and verify Languages page
    Delete a non-default Language
    Verify a non-default language is successfully deleted